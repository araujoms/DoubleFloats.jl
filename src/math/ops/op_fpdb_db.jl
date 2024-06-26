@inline function add_fpdb_db(x::T, y::DoubleFloat{T}) where {T<:IEEEFloat}
    (isnotfinite(x) | isnotfinite(y)) && return add_fpdb_db_nonfinite(x,y)
    return DoubleFloat{T}(add_fpdd_dd(x, HILO(y)))
end

@inline function sub_fpdb_db(x::T, y::DoubleFloat{T}) where {T<:IEEEFloat}
    (isnotfinite(x) | isnotfinite(y)) && return sub_fpdb_db_nonfinite(x,y)
    return DoubleFloat{T}(sub_fpdd_dd(x, HILO(y)))
end

@inline function mul_fpdb_db(x::T, y::DoubleFloat{T}) where {T<:IEEEFloat}
    (isnotfinite(x) | isnotfinite(y)) && return mul_fpdb_db_nonfinite(x,y)
    return DoubleFloat{T}(mul_fpdd_dd(x, HILO(y)))
end

@inline function dvi_fpdb_db(x::T, y::DoubleFloat{T}) where {T<:IEEEFloat}
    (isnotfinite(x) | isnotfinite(y)) && return dvi_fpdb_db_nonfinite(x,y)
    return DoubleFloat{T}(dvi_fpdd_dd(x, HILO(y)))
end

@inline function add_fpdb_db_nonfinite(x::T, y::DoubleFloat{T}) where {T<:IEEEFloat}
    z = x + HI(y)
    return DoubleFloat{T}(z, z)
end

@inline function sub_fpdb_db_nonfinite(x::T, y::DoubleFloat{T}) where {T<:IEEEFloat}
    z = x - HI(y)
    return DoubleFloat{T}(z, z)
end

@inline function mul_fpdb_db_nonfinite(x::T, y::DoubleFloat{T}) where {T<:IEEEFloat}
    z = x * HI(y)
    return DoubleFloat{T}(z, z)
end

@inline function dvi_fpdb_db_nonfinite(x::T, y::DoubleFloat{T}) where {T<:IEEEFloat}
    z = x / HI(y)
    return DoubleFloat{T}(z, z)
end

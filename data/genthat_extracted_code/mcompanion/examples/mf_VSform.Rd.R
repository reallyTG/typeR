library(mcompanion)


### Name: mf_VSform
### Title: Extract properties of multi-filters
### Aliases: mf_order mf_period mf_poles mf_VSform
### Keywords: ts

### ** Examples

## simulate a 3x3 2-companion matrix
##  and turn it into a multi-filter
(m <- mCompanion("sim", dim=3, mo=2))
(flt <- new("MultiFilter", mc = m ))
mf_period(flt)
mf_poles(flt)
abs(mf_poles(flt))
mf_VSform(flt,form="U")
mf_VSform(flt,form="L")
mf_VSform(flt,form="I")

## simulate a pc filter (2 seasons)
## and turn it into a multi-filter object
(rfi <- sim_pcfilter(2, 3))
(flt <- new("MultiFilter", coef = rfi$pcfilter))
mf_period(flt)
mf_poles(flt)
abs(mf_poles(flt))
mf_VSform(flt, form="U")
mf_VSform(flt, form="I")
mf_VSform(flt, form="L")

## indexing can be used  to extract filter coefficients
flt[]
flt[1,]
## the rest are some checks of numerical performance.
rfi
rfi$mat==0

zapsmall(rfi$mat)
mCompanion(zapsmall(rfi$mat))
unclass(mCompanion(zapsmall(rfi$mat)))
unclass(mCompanion(rfi$mat))

flt1 <- new("MultiFilter", mc = mCompanion(zapsmall(rfi$mat)))
flt2 <- flt

flt1[]
flt2[]
flt1[] - flt2[]
rfi$pcfilter - rfi$mat[1:2,]

mf_poles(flt1)
abs(mf_poles(flt1))

svd(rfi$mat)
rcond(rfi$mat)
Matrix::rcond(Matrix::Matrix(rfi$mat),"O")
1/Matrix::rcond(Matrix::Matrix(rfi$mat),"O")




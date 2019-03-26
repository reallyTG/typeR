library(Runuran)


### Name: unuran.new
### Title: Create a UNU.RAN object
### Aliases: unuran.new
### Keywords: distribution datagen

### ** Examples

## Use method 'TDR' (Transformed Density Rejection) to 
## draw a sample of size 10 from a hyperbolic distribution with PDF
##   f(x) = const * exp(-sqrt(1+x^2)) 
## restricted to domain [-1,2].

## We first have to define functions that return the log-density and
## its derivative, respectively. (We also could use the density itself.)
lf  <- function (x) { -sqrt(1+x^2) }
dlf <- function (x) { -x/sqrt(1+x^2) }

## Next create the continuous distribution object.
d <- unuran.cont.new(pdf=lf,dpdf=dlf,islog=TRUE,lb=-1,ub=2)

## Create 'unuran' object. We choose method 'TDR' with 
## immediate acceptance (IA) and parameter c=0.
gen <- unuran.new(distr=d, method="tdr; variant_ia; c=0")

## Now we can use this object to draw the sample.
## (Of course we can repeat this step as often as required.)
ur(gen,10)

## Here is some information about our generator object.
unuran.details(gen)




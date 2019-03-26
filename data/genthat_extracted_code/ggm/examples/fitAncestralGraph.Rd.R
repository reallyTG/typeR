library(ggm)


### Name: fitAncestralGraph
### Title: Fitting of Gaussian Ancestral Graph Models
### Aliases: fitAncestralGraph
### Keywords: graphs models ancestral graph multivariate

### ** Examples

## A covariance matrix
"S" <- structure(c(2.93, -1.7, 0.76, -0.06,
                  -1.7, 1.64, -0.78, 0.1,
                   0.76, -0.78, 1.66, -0.78,
                  -0.06, 0.1, -0.78, 0.81), .Dim = c(4,4),
                 .Dimnames = list(c("y", "x", "z", "u"), c("y", "x", "z", "u")))
## The following should give the same fit.   
## Fit an ancestral graph y -> x <-> z <- u
fitAncestralGraph(ag1 <- makeMG(dg=DAG(x~y,z~u), bg = UG(~x*z)), S, n=100)

## Fit an ancestral graph y <-> x <-> z <-> u
fitAncestralGraph(ag2 <- makeMG(bg= UG(~y*x+x*z+z*u)), S, n=100)

## Fit the same graph with fitCovGraph
fitCovGraph(ag2, S, n=100)    

## Another example for the mathematics marks data

data(marks)
S <- var(marks)
mag1 <- makeMG(bg=UG(~mechanics*vectors*algebra+algebra*analysis*statistics))
fitAncestralGraph(mag1, S, n=88)

mag2 <- makeMG(ug=UG(~mechanics*vectors+analysis*statistics),
               dg=DAG(algebra~mechanics+vectors+analysis+statistics))
fitAncestralGraph(mag2, S, n=88) # Same fit as above




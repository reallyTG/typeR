library(PtProcess)


### Name: mpp
### Title: Marked Point Process Object
### Aliases: mpp
### Keywords: classes

### ** Examples

data(Tangshan)

#   increment magnitudes a fraction so none are zero
Tangshan[,"magnitude"] <- Tangshan[,"magnitude"] + 0.01

dmagn_mark <- function(x, data, params){
    #  Gamma distribution
    #  exponential density when params[7]=0
    #   See topic "marks" for further discussion
    lambda <- etas_gif(data, x[,"time"], params=params[1:5])
    y <- dgamma(x[,"magnitude"], shape=1+sqrt(lambda)*params[7],
                rate=params[6], log=TRUE)
    return(y)
}

TT <- c(0, 4018)
# params <- c(0.0067, 1.1025, 1.0794, 0.0169, 0.9506, 1.9159, 0.4704)
params <- c(0.007, 1.1, 1.08, 0.02, 0.95, 1.92, 0.47)

x <- mpp(data=Tangshan,
         gif=etas_gif,
         marks=list(dmagn_mark, NULL),
         params=params,
         gmap=expression(params[1:5]),
         mmap=expression(params[1:7]),
         TT=TT)

allmap <- function(y, p){
    #    one to one mapping, all p positive
    y$params <- exp(p)
    return(y)
}

#    Parameters must be positive. Transformed so that nlm
#    can use entire real line (no boundary problems, see
#    topic "neglogLik" for further explanation).
#    Argument "iterlim" has been restricted to 2 to avoid
#    excessive time in package checks, set much larger to
#    ensure convergence.
z <- nlm(neglogLik, log(params), object=x, pmap=allmap,
         print.level=2, iterlim=2, typsize=abs(params))

x1 <- allmap(x, z$estimate)

#    print parameter estimates
print(x1$params)

print(logLik(x))
print(logLik(x1))
plot(x1, log=TRUE)




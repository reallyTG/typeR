library(lmomco)


### Name: lmom2par
### Title: Convert L-moments to the Parameters of a Distribution
### Aliases: lmom2par lmr2par
### Keywords: distribution (parameters) parameter (L-moments to)
###   distribution (utility) parameter (estimation)

### ** Examples

lmr  <- lmoms(rnorm(20))
para <- lmom2par(lmr,type="nor")

# The lmom2par() calls will error if trim != 1.
X <- rcauchy(20)
cauchy <- lmom2par(TLmoms(X, trim=1), type="cau")
slash  <- lmom2par(TLmoms(X, trim=1), type="sla")
## Not run: 
##D plot(pp(X), sort(X), xlab="PROBABILITY", ylab="CAUCHY")
##D lines(nonexceeds(), par2qua(nonexceeds(), cauchy))
##D lines(nonexceeds(), par2qua(nonexceeds(), slash), col=2)
## End(Not run)




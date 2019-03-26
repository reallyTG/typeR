library(sensR)

## change discrim
discrim(correct=13, total=30, method="triangle")
discrim(correct=13, total=30, method="triangle", double = TRUE)

## change findcr
findcr(sample.size = 20, alpha = 0.05, p0 = 0.5)
## example from the J.Bi paper
findcr(sample.size = 100, alpha = 0.05, p0 = 0.5)
findcr(sample.size = 100, alpha = 0.05, p0 = 1/4) ## critical value for the double duo-trio method
findcr(sample.size = 100, alpha = 0.05, p0 = 1/9) ## critical value for the double triangle method


## discrimPwr
discrimPwr(pdA = 0.5, sample.size = 20, alpha = 0.05, pGuess = 1/2)
## example from the J.Bi paper 
pdA <- pc2pd(0.35, 1/4)
discrimPwr(pdA = pdA, sample.size = 100, alpha = 0.05, pGuess = 1/4, statistic = "exact")
discrimPwr(pdA = pdA, sample.size = 100, alpha = 0.05, pGuess = 1/4, statistic = "normal")

stopifnot(all.equal(discrimPwr(pdA = pdA, sample.size = 100, alpha = 0.05, 
                               pGuess = 1/4, statistic = "normal"),
          0.7268466, tol=1e-5))

## test double triangle
discrim(10, 15, method = "twoAFC")
discrim(10, 15, method = "twoAFC", double = TRUE, statistic = "likelihood")
findcr(sample.size = 15, alpha = 0.05, p0 = 1/4) ## critical value for the double twoAFC method

discrim(35,100, method="duotrio")
discrim(10,15, method="duotrio")



## check psyderiv
## g' =2 * f * f'
# duotrio
dprime <- coefficients(discrim(10, 15, method="duotrio", double = TRUE))[3,1]
stopifnot(all.equal(psyderiv(dprime, method = "duotrio", double = TRUE),
                    2*psyfun(dprime, method = "duotrio") * 
                      psyderiv(dprime, method = "duotrio"), tol=1e-6))

# threeAFC
dprime <- coefficients(discrim(10, 15, method="threeAFC", double = TRUE))[3,1]
stopifnot(all.equal(psyderiv(dprime, method = "threeAFC", double = TRUE),
                    2*psyfun(dprime, method = "threeAFC") * 
                      psyderiv(dprime, method = "threeAFC"), tol=1e-6))

# twoAFC
dprime <- coefficients(discrim(10, 15, method="twoAFC", double = TRUE))[3,1]
stopifnot(all.equal(psyderiv(dprime, method = "twoAFC", double = TRUE),
                    2*psyfun(dprime, method = "twoAFC") * 
                      psyderiv(dprime, method = "twoAFC"), tol=1e-6))

# triangle 
dprime <- coefficients(discrim(10, 15, method="triangle", double = TRUE))[3,1]
stopifnot(all.equal(psyderiv(dprime, method = "triangle", double = TRUE),
                    2*psyfun(dprime, method = "triangle") * 
                      psyderiv(dprime, method = "triangle"), tol=1e-6))

#tetrad 
dprime <- coefficients(discrim(10, 15, method="tetrad", double = TRUE))[3,1]
stopifnot(all.equal(psyderiv(dprime, method = "tetrad", double = TRUE),
                    2*psyfun(dprime, method = "tetrad") * 
                      psyderiv(dprime, method = "tetrad"), tol=1e-6))

## check g=f^2
# duotrio
f <- psyfun(psyinv(10/15, method = "duotrio", double = TRUE), method = "duotrio")
g <- sqrt(psyfun(psyinv(10/15, method = "duotrio", double = TRUE), 
                 method = "duotrio", double = TRUE))

stopifnot(all.equal(f,g, tol=1e-6))

# threeAFC
f <- psyfun(psyinv(10/15, method = "threeAFC", double = TRUE), method = "threeAFC")
g <- sqrt(psyfun(psyinv(10/15, method = "threeAFC", double = TRUE),
                 method = "threeAFC", double = TRUE))
stopifnot(all.equal(f,g, tol=1e-6))

# twoAFC
f <- psyfun(psyinv(10/15, method = "twoAFC", double = TRUE), method = "twoAFC")
g <- sqrt(psyfun(psyinv(10/15, method = "twoAFC", double = TRUE),
                 method = "twoAFC", double = TRUE))
stopifnot(all.equal(f,g, tol=1e-6))

# triangle
f <- psyfun(psyinv(10/15, method = "triangle", double = TRUE), method = "triangle")
g <- sqrt(psyfun(psyinv(10/15, method = "triangle", double = TRUE),
                 method = "triangle", double = TRUE))
stopifnot(all.equal(f,g, tol=1e-6))

# tetrad
f <- psyfun(psyinv(10/15, method = "tetrad", double = TRUE), method = "tetrad")
g <- sqrt(psyfun(psyinv(10/15, method = "tetrad", double = TRUE),
                 method = "tetrad", double = TRUE))
stopifnot(all.equal(f,g, tol=1e-6))

##########
## More tests by RHBC:
# Check that gradient(psyfun)==psyderiv across methods:
if(require(numDeriv)) {
  methvec <- c("duotrio", "tetrad", "threeAFC", 
               "twoAFC", "triangle")
  res <- lapply(methvec, function(meth) {
    fun <- function(dp) psyfun(dp, method=meth, double=TRUE)
    sapply(seq(0 + 1e-3, 3, length.out = 10), function(dp) 
      grad(fun, x=dp) - psyderiv(dp, method=meth, double=TRUE) )
  })
  stopifnot(max(abs(unlist(res))) < 1e-5)
}

library(lmomco)


### Name: parkur
### Title: Estimate the Parameters of the Kumaraswamy Distribution
### Aliases: parkur
### Keywords: distribution (parameters) Distribution: Kumaraswamy

### ** Examples

lmr <- lmoms(runif(20)^2)
parkur(lmr)

kurpar <- list(para=c(1,1), type="kur");
lmr <- lmomkur(kurpar)
parkur(lmr)

kurpar <- list(para=c(0.1,1), type="kur");
lmr <- lmomkur(kurpar)
parkur(lmr)

kurpar <- list(para=c(1,0.1), type="kur");
lmr <- lmomkur(kurpar)
parkur(lmr)

kurpar <- list(para=c(0.1,0.1), type="kur");
lmr <- lmomkur(kurpar)
parkur(lmr)




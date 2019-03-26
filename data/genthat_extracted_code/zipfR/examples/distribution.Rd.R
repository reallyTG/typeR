library(zipfR)


### Name: LNRE
### Title: Type and Probability Distributions of LNRE Models (zipfR)
### Aliases: LNRE rlnre dlnre plnre qlnre tdlnre tplnre tqlnre ldlnre
###   ltdlnre
### Keywords: distribution models

### ** Examples


## define ZM and fZM LNRE models 
ZM <- lnre("zm", alpha=.8, B=1e-3)
FZM <- lnre("fzm", alpha=.8, A=1e-5, B=.05)

## random samples from the two models
head(table(rlnre(ZM, 10000)))
head(table(rlnre(FZM, 10000)))

## plot logarithmic type density functions
x <- 10^seq(-6, 1, by=.01)  # pi = 10^(-6) .. 10^(-1)
y.zm <- ltdlnre(ZM, x)
y.fzm <- ltdlnre(FZM, x)
## Not run: plot(x, y.zm, type="l", lwd=2, col="red", log="x", ylim=c(0,14000))
## Not run: lines(x, y.fzm, lwd=2, col="blue")
## Not run: legend("topright", legend=c("ZM", "fZM"), lwd=3, col=c("red", "blue"))

## probability pi_k of k-th type according to FZM model
k <- 10
plnre(FZM, tqlnre(FZM, k-1)) - plnre(FZM, tqlnre(FZM, k))

## number of types with pi >= 1e-6
tplnre(ZM, 1e-6)

## lower tail fails for infinite population size
## Not run: tplnre(ZM, 1e-3, lower=TRUE)

## total probability mass assigned to types with pi <= 1e-6
plnre(ZM, 1e-6)
  




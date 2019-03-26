library(BivarP)


### Name: BiVarEst
### Title: Estimation of the parameters of the bivariate distribution
###   function of the Archimedean copula family.
### Aliases: BiVarEst
### Keywords: ~kwd1 ~kwd2

### ** Examples

rodinka <- c("weibull", "norm")
kopule <- "frank"
xweib <- c(1.75, 145, 1.30, 80, 3.5)
BcG <- BiCopGen(x = xweib, rodiny = rodinka, rodina = kopule, No=30,
cens = TRUE, bicens = FALSE, digi = 2)
Nxyd <- data.frame(X=BcG$X, Y=BcG$Y, dX=BcG$dX, dY=BcG$dY)
Bivar <- BiVarEst(Nxyd, kopule = kopule, rodiny = rodinka)
Bivar
plot(Nxyd$Y, Nxyd$X, type="n", xlab="Y", ylab="X",
xlim=c(min(0, min(Nxyd$Y)), max(Nxyd$Y)),
ylim=c(min(0, min(Nxyd$X)),max(Nxyd$X)))
points(Nxyd$Y, Nxyd$X, col=ifelse(Nxyd$dX==1 & Nxyd$dY==1, "black",
ifelse(Nxyd$dX==0 & Nxyd$dY==1, "red", ifelse(Nxyd$dX==1 & Nxyd$dY==0,
"blue", "green"))), pch=20)
legend("topleft",c("dX, dY","1,1", "0,1", "1,0", "0,0"),
text.col=c("black", "black", "red", "blue", "green"), bty = "n")
grid(col = "grey50")




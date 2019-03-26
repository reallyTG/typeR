library(copula)


### Name: mixCopula
### Title: Create Mixture of Copulas
### Aliases: mixCopula
### Keywords: distribution multivariate

### ** Examples

mC <- mixCopula(list(gumbelCopula(2.5, dim=3),
                     claytonCopula(pi, dim=3),
                     tCopula(0.7, dim=3)),
                c(2,2,4)/8)
mC
stopifnot(dim(mC) == 3)

set.seed(17)
uM <- rCopula(600, mC)
splom2(uM, main = "mixCopula( (gumbel, clayton, t-Cop) )")
d.uM <- dCopula(uM, mC)
p.uM <- pCopula(uM, mC)

## mix a Gumbel with a rotated Gumbel (with equal weights 1/2):
mGG <- mixCopula(list(gumbelCopula(2), rotCopula(gumbelCopula(1.5))))
rho(mGG)   # 0.57886
lambda(mGG)# both lower and upper tail dependency

loglikCopula(c(2.5, pi, rho.1=0.7, df = 4, w = c(2,2,4)/8),
                    u = uM, copula = mC)
ll.df <- Vectorize(function(df, rho)
                   loglikCopula(c(2.5, pi, rho.1=rho, df=df, w = c(2,2,4)/8),
                                uM, mC))
(df. <- 1/rev(seq(1/8, 1/2, length=21)))# in [2, 8] equidistant in 1/. scale

ll. <- ll.df(df., rho = (rh1 <- 0.7))
plot(df., ll., type = "b", main = "loglikCopula((.,.,rho = 0.7, df, ..), u, <mixCopula>)")

if(!exists("Xtras")) Xtras <- copula:::doExtras() ; cat("Xtras: ", Xtras,"\n")
if (Xtras) {
  Rhos <- seq(0.55, 0.70, by = 0.01)
  ll.m <- matrix(NA, nrow=length(df.), ncol=length(Rhos))
  for(k in seq_along(Rhos)) ll.m[,k] <- ll.df(df., rho = Rhos[k])
  tit <- "loglikelihood(<tCop>, true param. for rest)"
  persp         (df., Rhos, ll.m, phi=30, theta = 50, ticktype="detailed", main = tit)
  filled.contour(df., Rhos, ll.m, xlab="df", ylab = "rho", main = tit)
}

## fitCopula() example with "fixed weights" -- (only these are "ok" !!) -------------

(mNt <- mixCopula(list(normalCopula(0.95), tCopula(-0.7)), w = c(1, 2) / 3))
set.seed(1452) ; U <- pobs(rCopula(1000, mNt))
(m1 <- mixCopula(list(normalCopula(), tCopula()), w = mNt@w))

getTheta(m1, freeOnly = TRUE, attr = TRUE)
getTheta(m1, named=TRUE)
copula:::isFree(m1)
fixedParam(m1) <- fx <- c(FALSE, FALSE, FALSE, TRUE, TRUE)
stopifnot(identical(copula:::isFree(m1), !fx))

if (Xtras) { ## time
  print(system.time(
    fit <- fitCopula(m1, start = c(0, 0, 10), data = U)))
  ## 16 sec (nb-mm4)
  print( fit )
  print( summary(fit) )#-> incl  'Std.Error' (which seems small for rho1 !)
} #{Xtras}





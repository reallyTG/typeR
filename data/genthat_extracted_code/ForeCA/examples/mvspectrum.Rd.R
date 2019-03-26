library(ForeCA)


### Name: mvspectrum
### Title: Estimates spectrum of multivariate time series
### Aliases: check_mvspectrum_normalized get_spectrum_from_mvspectrum
###   mvpgram mvspectrum normalize_mvspectrum
###   spectrum_of_linear_combination
### Keywords: manip ts

### ** Examples


set.seed(1)
XX <- cbind(rnorm(100), arima.sim(n = 100, list(ar = 0.9)))
ss3d <- mvspectrum(XX)
dim(ss3d)

ss3d[2,,] # at omega_1; in general complex-valued, but Hermitian
identical(ss3d[2,,], Conj(t(ss3d[2,,]))) # is Hermitian

ss <- mvspectrum(XX[, 1], smoothing = TRUE)

## Not run: 
##D   mvspectrum(XX, normalize = TRUE)
## End(Not run)
ss <- mvspectrum(whiten(XX)$U, normalize = TRUE)

xx <- scale(rnorm(100), center = TRUE, scale = FALSE)
var(xx)
sum(mvspectrum(xx, normalize = FALSE, method = "direct")) * 2
sum(mvspectrum(xx, normalize = FALSE, method = "wosa")) * 2


xx <- scale(rnorm(100), center = TRUE, scale = FALSE)
ss <- mvspectrum(xx)
ss.n <- normalize_mvspectrum(ss)
sum(ss.n)
# multivariate
UU <- whiten(matrix(rnorm(40), ncol = 2))$U
S.U <- mvspectrum(UU, method = "wosa")
mvspectrum2wcov(normalize_mvspectrum(S.U))


XX <- matrix(rnorm(1000), ncol = 2)
SS <- mvspectrum(XX, "direct")
ss1 <- mvspectrum(XX[, 1], "direct")

SS.1 <- get_spectrum_from_mvspectrum(SS, 1)
plot.default(ss1, SS.1)
abline(0, 1, lty = 2, col = "blue")


XX <- matrix(arima.sim(n = 1000, list(ar = 0.9)), ncol = 4)
beta.tmp <- rbind(1, -1, 2, 0)
yy <- XX %*% beta.tmp

SS <- mvspectrum(XX, "wosa")
ss.yy.comb <- spectrum_of_linear_combination(SS, beta.tmp)
ss.yy <- mvspectrum(yy, "wosa")

plot(ss.yy, log = TRUE) # using plot.mvspectrum()
lines(ss.yy.comb, col = "red", lty = 1, lwd = 2) 





library(AER)


### Name: USMacroSW
### Title: US Macroeconomic Data (1957-2005, Stock & Watson)
### Aliases: USMacroSW
### Keywords: datasets

### ** Examples

## Stock and Watson (2007)
data("USMacroSW", package = "AER")
library("dynlm")
library("strucchange")
usm <- ts.intersect(USMacroSW, 4 * 100 * diff(log(USMacroSW[, "cpi"])))
colnames(usm) <- c(colnames(USMacroSW), "infl")

## Equations 14.7, 14.13, 14.16, 14.17, pp. 536
fm_ar1 <- dynlm(d(infl) ~ L(d(infl)),
  data = usm, start = c(1962,1), end = c(2004,4))
fm_ar4 <- dynlm(d(infl) ~ L(d(infl), 1:4), 
  data = usm, start = c(1962,1), end = c(2004,4))
fm_adl41 <- dynlm(d(infl) ~ L(d(infl), 1:4) + L(unemp),
  data = usm, start = c(1962,1), end = c(2004,4))
fm_adl44 <- dynlm(d(infl) ~ L(d(infl), 1:4) + L(unemp, 1:4),
  data = usm, start = c(1962,1), end = c(2004,4))
coeftest(fm_ar1, vcov = sandwich)
coeftest(fm_ar4, vcov = sandwich)
coeftest(fm_adl41, vcov = sandwich)
coeftest(fm_adl44, vcov = sandwich)

## Granger causality test mentioned on p. 547
waldtest(fm_ar4, fm_adl44, vcov = sandwich)  

## Figure 14.5, p. 570
## SW perform partial break test of unemp coefs
## here full model is used
mf <- model.frame(fm_adl44) ## re-use fm_adl44
mf <- ts(as.matrix(mf), start = c(1962, 1), freq = 4)
colnames(mf) <- c("y", paste("x", 1:8, sep = ""))
ff <- as.formula(paste("y", "~",  paste("x", 1:8, sep = "", collapse = " + ")))
fs <- Fstats(ff, data = mf, from = 0.1)
plot(fs)
lines(boundary(fs, alpha = 0.01), lty = 2, col = 2)
lines(boundary(fs, alpha = 0.1), lty = 3, col = 2)

## More examples can be found in:
## help("StockWatson2007")




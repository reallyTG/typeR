library(rioja)


### Name: MAT
### Title: Palaeoenvironmental reconstruction using the Modern Analogue
###   Technique (MAT)
### Aliases: MAT predict.MAT paldist paldist2 performance.MAT crossval.MAT
###   print.MAT summary.MAT plot.MAT fitted.MAT residuals.MAT screeplot.MAT
### Keywords: models multivariate

### ** Examples

# pH reconstruction of the RLGH, Scotland, using SWAP training set 
# shows recent acidification history
data(SWAP)
data(RLGH)
fit <- MAT(SWAP$spec, SWAP$pH, k=20)  # generate results for k 1-20
#examine performance
performance(fit)
print(fit)
# How many analogues?
screeplot(fit)
# do the reconstruction
pred.mat <- predict(fit, RLGH$spec, k=10)
# plot the reconstruction
plot(RLGH$depths$Age, pred.mat$fit[, 1], type="b", ylab="pH", xlab="Age")

#compare to a weighted average model
fit <- WA(SWAP$spec, SWAP$pH)
pred.wa <- predict(fit, RLGH$spec)
points(RLGH$depths$Age, pred.wa$fit[, 1], col="red", type="b")
legend("topleft", c("MAT", "WA"), lty=1, col=c("black", "red"))




library(robustbase)


### Name: ambientNOxCH
### Title: Daily Means of NOx (mono-nitrogen oxides) in air
### Aliases: ambientNOxCH
### Keywords: datasets

### ** Examples

data(ambientNOxCH)
str (ambientNOxCH)

yearly <- log(colMeans(ambientNOxCH[,-1], na.rm=TRUE))
xlim <- range(yearly)
lNOx <- log(ambientNOxCH[, -1])
days <-     ambientNOxCH[, "date"]

## Subset of 9 days starting at April 4:
idays <- seq(which(ambientNOxCH$date=="2004-12-04"), length=9)
ylim <- range(lNOx[idays,],na.rm=TRUE)
op <- par(mfrow=c(3,3),mar=rep(1,4), oma = c(0,0,2,0))

for (id in idays) {
  daily <- unlist(lNOx[id,])
  plot(NA, xlim=xlim,ylim=ylim, ann=FALSE, type = "n")
  abline(0:1, col="light gray")
  abline(lmrob(daily~yearly, na.action=na.exclude),
         col="red", lwd=2)
  text(yearly, daily, names(yearly), col="blue")
  mtext(days[id], side=1, line=-1.2, cex=.75, adj=.98)
}
mtext("Daily ~ Yearly  log( NOx mean values ) at 13 Swiss locations",
      outer=TRUE)
par(op)

## do all 366 regressions:  Least Squares and Robust:
LS <- lapply(1:nrow(ambientNOxCH), function(id)
             lm(unlist(lNOx[id,]) ~ yearly,
                na.action = na.exclude))
R <- lapply(1:nrow(ambientNOxCH),
            function(id) lmrob(unlist(lNOx[id,]) ~ yearly,
                               na.action = na.exclude))
## currently 4 warnings about non-convergence;
## which ones?
days[notOk <- ! sapply(R, `[[`, "converged") ]
## "2004-01-10" "2004-05-12" "2004-05-16" "2004-11-16"

## first problematic case:
daily <- unlist(lNOx[which(notOk)[1],])
plot(daily ~ yearly,
     main = paste("lmrob() non-convergent:",days[notOk[1]]))
rr <- lmrob(daily ~ yearly, na.action = na.exclude,
            control = lmrob.control(trace=3, max.it = 100))
##-> 53 iter.

## Look at all coefficients:
R.cf <- t(sapply(R, coef))
C.cf <- t(sapply(LS, coef))
plot(C.cf, xlim=range(C.cf[,1],R.cf[,1]),
           ylim=range(C.cf[,2],R.cf[,2]))
mD1 <- rowMeans(abs(C.cf - R.cf))
lrg <- mD1 > quantile(mD1, 0.80)
arrows(C.cf[lrg,1], C.cf[lrg,2],
       R.cf[lrg,1], R.cf[lrg,2], length=.1, col="light gray")
points(R.cf, col=2)

## All robustness weights
aW <- t(sapply(R, weights, type="robustness"))
colnames(aW) <- names(yearly)
summary(aW)
sort(colSums(aW < 0.05, na.rm = TRUE)) # how often "clear outlier":
# lu st zg ba se sz su si re la ef ad ri
#  0  0  0  1  1  1  2  3  4 10 14 17 48

lattice::levelplot(aW, asp=1/2, main="Robustness weights",
                   xlab= "day", ylab= "site")




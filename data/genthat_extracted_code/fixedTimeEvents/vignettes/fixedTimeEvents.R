## ------------------------------------------------------------------------
library(fixedTimeEvents)
R <- 1949; r <- 162
Liland(R, r)

## ------------------------------------------------------------------------
R <- 1949; r <- 162
dL <- dLiland(1:100, R, r)
plot(dL, type = 'l', xlab = "distance", ylab = "probability mass")

## ------------------------------------------------------------------------
Lt <- Liland.test(1:100, 1, R, r)
Liland.crit(1, R, r)
plot(Lt, type='l', xlab='#(x<2)', ylab='p-value')
points(73, Liland.test(73, 1, R, r), col = 2)

## ------------------------------------------------------------------------
sL <- simLiland(5000, 15,5) # 5000 samples, R = 15, r = 5
qqplot(dLiland(1:length(sL),15,5),sL,
       xlab='F(x;15,5)', ylab='Sample (5000)')
abline(0,1, lty=2, col=2)


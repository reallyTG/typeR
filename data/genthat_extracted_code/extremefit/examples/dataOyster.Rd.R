library(extremefit)


### Name: dataOyster
### Title: High-frequency noninvasive valvometry data
### Aliases: dataOyster

### ** Examples


data("dataOyster")
Velocity <- dataOyster$data[, 3]
time <- dataOyster$data[, 1]
plot(time, Velocity, type = "l", xlab = "time (hour)",
      ylab = "Velocity (mm/s)")

Tgrid <- seq(0, 24, 0.05) 
#Grid with positive velocity
new.Tgrid <- dataOyster$Tgrid

X <- Velocity + (-min(Velocity)) #We shift the data to be positive

## Not run: 
##D  #For computing time purpose
##D #We find the h by minimizing the cross validation function 
##D 
##D hgrid <- bandwidth.grid(0.05, 0.5, 50, type = "geometric")
##D 
##D 
##D #H <- bandwidth.CV(X, time, new.Tgrid, hgrid,
##D #                 TruncGauss.kernel, kpar = c(sigma = 1),
##D #                 pcv = 0.99, CritVal = 3.4, plot = TRUE)
##D #hcv <- H$h.cv
##D 
##D hcv <- 0.2981812
##D #we use our method with the h found previously
##D TS.Oyster <- hill.ts(X, t = time, new.Tgrid, h = hcv, 
##D                    TruncGauss.kernel, kpar = c(sigma = 1),
##D                    CritVal = 3.4)
##D           
##D plot(time, Velocity, type = "l", ylim = c(-0.6, 1),
##D     main = "Extreme quantiles estimator",
##D     xlab = "Time (hour)", ylab = "Velocity (mm/s)")
##D pgrid <- c(0.999)
##D pred.quant.Oyster <- predict(TS.Oyster, newdata = pgrid, type = "quantile")
##D 
##D quant0.999 <- rep(0, length(Tgrid))
##D quant0.999[match(new.Tgrid, Tgrid)] <- 
##D           as.numeric(pred.quant.Oyster$y)-
##D           (-min(Velocity))
##D lines(Tgrid, quant0.999, col = "magenta")   
##D 
##D 
## End(Not run)




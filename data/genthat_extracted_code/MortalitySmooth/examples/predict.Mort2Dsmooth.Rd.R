library(MortalitySmooth)


### Name: predict.Mort2Dsmooth
### Title: Predict Method for 2D P-splines Fits
### Aliases: predict.Mort2Dsmooth
### Keywords: models regression smooth

### ** Examples

## computing confidence intervals
## selected data
years <- 1980:2006
ages <- 80:100
death <- selectHMDdata("Denmark", "Deaths", "Females",
                       ages = ages, years = years)
exposure <- selectHMDdata("Denmark", "Exposures", "Females",
                          ages = ages, years = years)
## fit
fit <- Mort2Dsmooth(x=ages, y=years, Z=death,
                    offset=log(exposure),
                    method=3, lambdas=c(100,500))

## predict and computing standard errors
pre <- predict(fit, se.fit=TRUE)

## plotting over ages and years 95% confidence intervals 
## !hard to distinguish between upper
## and lower confidence bounds
grid. <- expand.grid(x = ages, y = years, gr = 1:2)
grid.$lmx <- c(c(pre$fit - 2*pre$se.fit),
               c(pre$fit + 2*pre$se.fit))
wireframe(lmx ~ x * y, data = grid., groups = gr,
          scales = list(arrows = FALSE),
          drape = TRUE, colorkey = TRUE)

## plotting age 80 (first row)
plot(years, log(death[1,] / exposure[1,]),
     main="Mortality rates, log-scale.
           Danish females, age 80, 1980:2006")
lines(years, pre$fit[1,], lwd=2, col=2)
lines(years, pre$fit[1,] + 2*pre$se.fit[1,],
      lwd=2, col=2, lty=2)
lines(years, pre$fit[1,] - 2*pre$se.fit[1,],
      lwd=2, col=2, lty=2)

## forecasting example
newyears <- 1980:2020
newdata <- list(x=ages, y=newyears) 
pre.for <- predict(fit, newdata=newdata, se.fit=TRUE)

## plot fitted+forecast log-rates for all ages over years
matplot(years, t(log(death/exposure)), pch=1, cex=0.5,
        col=rainbow(length(ages)),
        xlim=range(newyears),
        ylim=range(pre.for$fit),
        ylab="log-mortality")
matlines(newyears, t(pre.for$fit), lty=1, lwd=2,
        col=rainbow(length(ages)))

## plot selected ages over years, with 95% confidence intervals
whiA <- c(1,6,11)
matplot(years, t(log(death[whiA,]/exposure[whiA,])),
        pch=1,
        xlim=range(newyears),
        ylim=c(-3.3, -1.5),
        ylab="log-mortality")
matlines(newyears, t(pre.for$fit[whiA,]), lty=1, lwd=2)
matlines(newyears, t(pre.for$fit[whiA,]+
                     2*pre.for$se.fit[whiA,]), lty=2)
matlines(newyears, t(pre.for$fit[whiA,]-
                     2*pre.for$se.fit[whiA,]), lty=2)


## interpolation example
## compute log-death rates for
## each calendar month and calendar ages
newyears12 <- seq(1990, 2000, length=11*11)
newages12 <- seq(90, 100, length=11*11)
newdata12 <- list(x=newages12, y=newyears12)
pre12 <- predict(fit, newdata=newdata12, se.fit=TRUE)

## death rates in June 1995 at age 95.5
which.age <- which(newages12==95.5)
which.year <- which(newyears12==1995.5)
exp(pre12$fit[which.age, which.year] +
    c(-2*pre12$se.fit[which.age, which.year],
      0, 2*pre12$se.fit[which.age, which.year]))




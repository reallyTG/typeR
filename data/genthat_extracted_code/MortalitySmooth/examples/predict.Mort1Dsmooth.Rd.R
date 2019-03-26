library(MortalitySmooth)


### Name: predict.Mort1Dsmooth
### Title: Predict Method for 1D P-splines Fits
### Aliases: predict.Mort1Dsmooth
### Keywords: models regression smooth

### ** Examples

## forecasting example
## selected data
years <- 1950:2006
death <- selectHMDdata("Denmark", "Deaths", "Females",
                       ages = 70, years = years)
exposure <- selectHMDdata("Denmark", "Exposures", "Females",
                          ages = 70, years = years)
## fit
fit <- Mort1Dsmooth(x=years, y=death,
                    offset=log(exposure))
## extrapolation
years.new <- 1950:2025
pred <- predict(fit, newdata=years.new,
                type="link", se.fit=TRUE) 
## plotting actual and fitted log-rates
## and 95% confidence interval
plot(years, log(death/exposure),
     xlim=range(years.new), ylim=range(pred$fit))
lines(years.new, pred$fit, lwd=2, col=2)
lines(years.new, pred$fit + 2*pred$se.fit, lty=2, col=2)
lines(years.new, pred$fit - 2*pred$se.fit, lty=2, col=2)

## interpolation+extrapolating example over years
## selected+summed data
years0 <- 1860:2004
death0 <- selectHMDdata("Sweden", "Deaths",
                        "Females", 50, years0)
death <- c(rowsum(death0, gl(length(death0),
                             5, length(death0))))
exposure0 <- selectHMDdata("Sweden", "Exposures",
                           "Females", 50, years0)
exposure <- c(rowsum(exposure0, gl(length(exposure0),
                                   5, length(exposure0))))
years <- seq(1862, 2002, 5)
## fit
fit <- Mort1Dsmooth(x=years, y=death, offset=log(exposure))
## predict the model for each year
pre <- predict(fit, newdata=years0,
               se.fit=TRUE)
## plot log-rates 
plot(years, log(death/exposure))
## add fitted log-rates from fit
## (every fifth year)
points(years, log(fit$fitted/exposure),
       pch=16, col=2)
## add to the plot fit and 95% confidence interval
## (every single year)
points(years0, pre$fit, col=4)
lines(years0, pre$fit + 2*pre$se, col=4)
lines(years0, pre$fit - 2*pre$se, col=4)

## interpolation+extrapolating example over ages
## selected+summed data
year <- 1965
death1.4 <- sum(selectHMDdata("Swi", "Deaths",
                              "Males", 1:4, year))
death5.99 <- colSums(matrix(selectHMDdata("Swi",
                                          "Deaths",
                                          "Males",
                                          5:99, year),
                            nrow=5))
death <- c(death1.4, death5.99)
exposure1.4 <- sum(selectHMDdata("Swi", "Exposures",
                                 "Males", 1:4, year))
exposure5.99 <- colSums(matrix(selectHMDdata("Swi",
                                             "Exposures",
                                             "Males",
                                             5:99, year),
                               nrow=5))
exposure <- c(exposure1.4, exposure5.99)
ages <- c(2.5, seq(7, 97, 5))

## fit
fit <- Mort1Dsmooth(x=ages, y=death, offset=log(exposure),
                    ndx=10)
## since the aim is to interpolate FEW data-points
## we use a large number of B-splines allows a precise,
## but not parsimonius, description

## predict the model for each age
newages <- 1:100
pre <- predict(fit, newdata=newages,
               se.fit=TRUE)
## plot log-rates 
plot(ages, log(death/exposure), pch=16)
## add fitted log-rates from fit
## (every fifth age)
points(ages, log(fit$fitted/exposure),
       pch=16, col=2)
## add to the plot fit and 95% confidence interval
## (every single year)
points(newages, pre$fit, col=4, t="o")
lines(newages, pre$fit + 2*pre$se, col=4)
lines(newages, pre$fit - 2*pre$se, col=4)




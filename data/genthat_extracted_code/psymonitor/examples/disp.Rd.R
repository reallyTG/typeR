library(psymonitor)


### Name: disp
### Title: Generate a table with identified bubble/crisis periods
### Aliases: disp

### ** Examples

data(spread)

y        <- spread$value[150:200]
obs      <- length(y)
swindow0 <- floor(obs*(0.01 + 1.8/sqrt(obs)))
dim      <- obs - swindow0 + 1
Tb       <- 24 + swindow0 - 1

# Estimate PSY statistics and CVs
bsadf          <- PSY(y, swindow0)
quantilesBsadf <- cvPSYwmboot(y, swindow0, Tb=Tb, nboot = 49, nCores = 2)
quantile95     <- quantilesBsadf %*% matrix(1, nrow = 1, ncol = dim)

# locate bubble/crisis dates
ind95        <- (bsadf > t(quantile95[2, ])) * 1
monitorDates <- spread$date[swindow0:obs]
OT           <- locate(ind95, monitorDates)

# Show bubble/crisis periods
disp(OT, obs)





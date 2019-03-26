library(ctmm)


### Name: uere
### Title: Estimate UERE from calibration data
### Aliases: uere uere.fit uere<- summary.UERE

### ** Examples

# Load package and data
library(ctmm)
data(turtle)

# the first two datasets are calibration data
names(turtle)

# estimate UERE from calibration data
UERE <- uere.fit(turtle[1:2])
# inspect UERE estimate
summary(UERE)

# assign UERE to entire dataset
uere(turtle) <- UERE

# calculate residuals of calibration data
RES <- lapply(turtle[1:2],residuals)

# scatter plot of residuals with 50% and 95% quantiles
plot(RES,col.DF=NA,level.UD=c(0.50,0.95))

# check calibration data for autocorrelation using fast=FALSE because samples are small
ACFS <- lapply(RES,function(R){correlogram(R,fast=FALSE,dt=10 %#% 'min')})

# pooling ACFs
ACF <- mean(ACFS)

plot(ACF)




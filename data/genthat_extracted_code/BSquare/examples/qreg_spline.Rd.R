library(BSquare)


### Name: qreg_spline
### Title: Quantile regression with splines.
### Aliases: qreg_spline

### ** Examples

data(airquality)
ozone=airquality[,1]
solar=airquality[,2]

#Remove missing observations
missing=is.na(ozone) | is.na(solar)
ozone=ozone[!missing]
solar=solar[!missing]

#Create design matrix.  First column must be all ones, others must be between -1 and 1
solar_std = 1.8 * (solar - min(solar))/(max(solar)-min(solar)) - 0.9
X = cbind(1,solar_std)

tau=seq(0.05,0.95,0.05)
#use longer chains in practice
fit<-qreg_spline(X,Y = ozone,iters = 1000, burn = 1000, knots_inter = c(.5))

qr_plot(fit,index=2, main = "Solar Effect")




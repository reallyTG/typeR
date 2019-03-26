library(activity)


### Name: fitact
### Title: Fit activity model to time-of-day data
### Aliases: fitact

### ** Examples

#Fit without confidence limits
data(BCItime)
tm <- 2*pi*subset(BCItime, species=="brocket")$time
mod1 <- fitact(tm)
plot(mod1)

#Fit with confidence limits (limited reps to speed up)
mod2 <- fitact(tm, sample="data", reps=10)
plot(mod2)

#Fit weighted function to correct for detection radius 1.2 times higher
#by day than by night, assuming day between pi/2 (6 am) and pi*2/3 (6 pm)
weight <- 1/ifelse(tm>pi/2 & tm<pi*3/2, 1.2, 1)
mod3 <- fitact(tm, wt=weight)
plot(mod3)
#Overplot unweighted version for comparison
plot(mod1, add=TRUE, tline=list(col=2))

#Fit truncated function to consider only night time records,
#assuming night between pi*3/2 (6 pm) and pi/3 (6 am)
mod4 <- fitact(tm, bounds=c(pi*3/2, pi/2))
plot(mod4, centre="night")




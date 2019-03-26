library(Hmisc)


### Name: plsmo
### Title: Plot smoothed estimates
### Aliases: plsmo panel.plsmo
### Keywords: smooth nonparametric hplot

### ** Examples

set.seed(1)
x <- 1:100
y <- x + runif(100, -10, 10)
plsmo(x, y, "supsmu", xlab="Time of Entry") 
#Use label(y) or "y" for ylab


plsmo(x, y, add=TRUE, lty=2)
#Add lowess smooth to existing plot, with different line type


age <- rnorm(500, 50, 15)
survival.time <- rexp(500)
sex <- sample(c('female','male'), 500, TRUE)
race <- sample(c('black','non-black'), 500, TRUE)
plsmo(age, survival.time < 1, fun=qlogis, group=sex) # plot logit by sex

#Bivariate Y
sbp <- 120 + (age - 50)/10 + rnorm(500, 0, 8) + 5 * (sex == 'male')
dbp <-  80 + (age - 50)/10 + rnorm(500, 0, 8) - 5 * (sex == 'male')
Y <- cbind(sbp, dbp)
plsmo(age, Y)
plsmo(age, Y, group=sex)


#Plot points and smooth trend line using trellis 
# (add type='l' to suppress points or type='p' to suppress trend lines)
require(lattice)
xyplot(survival.time ~ age, panel=panel.plsmo)


#Do this for multiple panels
xyplot(survival.time ~ age | sex, panel=panel.plsmo)

#Repeat this using equal sample size intervals (n=25 each) summarized by
#the median, then a proportion (mean of binary y)
xyplot(survival.time ~ age | sex, panel=panel.plsmo, type='l',
       method='intervals', mobs=25, ifun=median)
ybinary <- ifelse(runif(length(sex)) < 0.5, 1, 0)
xyplot(ybinary ~ age, groups=sex, panel=panel.plsmo, type='l',
       method='intervals', mobs=75, ifun=mean, xlim=c(0, 120))


#Do this for subgroups of points on each panel, show the data
#density on each curve, and draw a key at the default location
xyplot(survival.time ~ age | sex, groups=race, panel=panel.plsmo,
       datadensity=TRUE)
Key()


#Use wloess.noiter to do a fast weighted smooth
plot(x, y)
lines(wtd.loess.noiter(x, y))
lines(wtd.loess.noiter(x, y, weights=c(rep(1,50), 100, rep(1,49))), col=2)
points(51, y[51], pch=18)   # show overly weighted point
#Try to duplicate this smooth by replicating 51st observation 100 times
lines(wtd.loess.noiter(c(x,rep(x[51],99)),c(y,rep(y[51],99)),
      type='ordered all'), col=3)
#Note: These two don't agree exactly




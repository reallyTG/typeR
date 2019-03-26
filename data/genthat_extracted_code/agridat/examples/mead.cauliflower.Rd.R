library(agridat)


### Name: mead.cauliflower
### Title: Leaves for cauliflower plants at different times
### Aliases: mead.cauliflower
### Keywords: datasets

### ** Examples


data(mead.cauliflower)
dat <- mead.cauliflower

dat <- transform(dat, year=factor(year))

m1 <- glm(leaves ~ degdays + year, data=dat, family=poisson)
coef(m1)
## (Intercept)     degdays    year1957
##  3.49492453  0.08512651  0.21688760

dat$pred <- predict(m1, type="response")
require(lattice)
if(require(latticeExtra)){
xyplot(leaves~degdays, data=dat, groups=year, type=c('p'),
       auto.key=list(columns=2), main="mead.cauliflower - observed (symbol) & fitted (line)",
       xlab="degree days", ylab="Number of leaves", ) +
  xyplot(pred~degdays, data=dat, groups=year, type=c('l'), col="black")
}





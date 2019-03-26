library(agridat)


### Name: mead.germination
### Title: Seed germination with different temperatures/concentrations
### Aliases: mead.germination
### Keywords: datasets

### ** Examples


data(mead.germination)
dat <- mead.germination
dat <- transform(dat, concf=factor(conc))
require(lattice)
xyplot(germ~log(conc+.01)|temp, dat, layout=c(4,1),
       main="mead.germination", ylab="number of seeds germinating")

m1 <- glm(cbind(germ, seeds-germ) ~ 1, dat, family=binomial)
m2 <- glm(cbind(germ, seeds-germ) ~ temp, dat, family=binomial)
m3 <- glm(cbind(germ, seeds-germ) ~ concf, dat, family=binomial)
m4 <- glm(cbind(germ, seeds-germ) ~ temp + concf, dat, family=binomial)
m5 <- glm(cbind(germ, seeds-germ) ~ temp * concf, dat, family=binomial)
anova(m1,m2,m3,m4,m5)
##   Resid. Df Resid. Dev Df Deviance
## 1        63    1193.80
## 2        60     430.11  3   763.69
## 3        60     980.10  0  -549.98
## 4        57     148.11  3   831.99
## 5        48      55.64  9    92.46

# Show logit and fitted values.  T2 has highest germination
subset(cbind(dat, predict(m5), fitted(m5)), rep=="R1")





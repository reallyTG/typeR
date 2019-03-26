library(agridat)


### Name: heady.fertilizer
### Title: Yield of corn, alfalfa, clover with two fertilizers
### Aliases: heady.fertilizer
### Keywords: datasets

### ** Examples


data(heady.fertilizer)
dat <- heady.fertilizer

require(lattice)
xyplot(yield ~ P|crop, data=dat, scales=list(relation="free"),
       groups=factor(paste(dat$N,dat$K)), auto.key=list(columns=5),
       main="heady.fertilizer", xlab="Phosphorous")

# Corn. Matches Heady, p. 292
d1 <- subset(dat, crop=="corn")
m1 <- lm(yield ~ N + P + sqrt(N) + sqrt(P) + sqrt(N*P), data=d1)
summary(m1)


# Alfalfa. Matches Heady, p. 292.  Also Pesek equation 3, p. 241
d2 <- subset(dat, crop=="alfalfa")
m2 <- lm(yield ~ K + P + sqrt(K) + sqrt(P) + sqrt(K*P), data=d2)
summary(m2)
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)
## (Intercept)  1.8735521  0.1222501  15.326  < 2e-16 ***
## K           -0.0013943  0.0007371  -1.891 0.061237 .
## P           -0.0050195  0.0007371  -6.810 5.74e-10 ***
## sqrt(K)      0.0617458  0.0160142   3.856 0.000196 ***
## sqrt(P)      0.1735383  0.0160142  10.837  < 2e-16 ***
## sqrt(K * P) -0.0014402  0.0007109  -2.026 0.045237 *


# Clover. Matches Heady, p. 292.
d3 <- subset(dat, crop=="clover")
m3 <- lm(yield ~ P + sqrt(K) + sqrt(P) + sqrt(K*P), data=d3)
summary(m3)

# Corn with residual fertilizer. Matches Heady eq 56, p. 322.
d4 <- subset(dat, crop=="corn2")
m4 <- lm(yield ~ N + P + sqrt(N) + sqrt(P) + sqrt(N*P), data=d4)
summary(m4)

## Not run: 
##D   require(rgl)
##D   with(d1, plot3d(N,P,yield))
##D   with(d2, plot3d(K,P,yield))
##D   with(d3, plot3d(K,P,yield))
##D   with(d4, plot3d(N,P,yield)) # Mostly linear in both N and P
##D   rgl.close()
## End(Not run)





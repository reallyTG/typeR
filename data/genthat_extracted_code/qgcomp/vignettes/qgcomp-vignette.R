## ---- echo=TRUE, results='markup', message=FALSE-------------------------
library(qgcomp)
library(knitr)
data("metals", package="qgcomp")
head(metals)

## ---- results='markup', fig.show='hold', fig.height=7, fig.width=10, cache=FALSE----
# we save the names of the mixture variables in the variable "Xnm"
Xnm <- c(
    'arsenic','barium','cadmium','calcium','chloride','chromium','copper',
    'iron','lead','magnesium','manganese','mercury','selenium','silver',
    'sodium','zinc'
)
covars = c('nitrate','nitrite','sulfate','ph', 'total_alkalinity','total_hardness')



# Example 1: linear model
# Run the model and save the results "qc.fit"
system.time(qc.fit <- qgcomp.noboot(y~.,dat=metals[,c(Xnm, 'y')], family=gaussian()))
#   user  system elapsed 
#  0.011   0.002   0.018 

# contrasting other methods with computational speed
# WQS regression
#system.time(wqs.fit <- gwqs(y~NULL,mix_name=Xnm, data=metals[,c(Xnm, 'y')], family="gaussian"))
#   user  system elapsed 
# 35.775   0.124  36.114 

# Bayesian kernel machine regression (note that the number of iterations here would 
#  need to be >5,000, at minimum, so this underestimates the run time by a factor
#  of 50+
#system.time(bkmr.fit <- kmbayes(y=metals$y, Z=metals[,Xnm], family="gaussian", iter=100))
#   user  system elapsed 
# 81.644   4.194  86.520 


#first note that qgcomp is very fast

# View results: scaled coefficients/weights and statistical inference about
# mixture effect
qc.fit




## ---- results='markup', fig.show='hold', fig.height=7, fig.width=10, cache=FALSE----

qc.fit2 <- qgcomp.noboot(disease_state~., expnms=Xnm, 
          data = metals[,c(Xnm, 'disease_state')], family=binomial(), 
          q=4)
qcboot.fit2 <- qgcomp.boot(disease_state~., expnms=Xnm, 
          data = metals[,c(Xnm, 'disease_state')], family=binomial(), 
          q=4, B=10,# B should be 200-500+ in practice
          seed=125, rr=FALSE)
qcboot.fit2b <- qgcomp.boot(disease_state~., expnms=Xnm, 
          data = metals[,c(Xnm, 'disease_state')], family=binomial(), 
          q=4, B=10,# B should be 200-500+ in practice
          seed=125, rr=TRUE)


# Compare a qgcomp.noboot fit:
qc.fit2
# and a qgcomp.boot fit:
qcboot.fit2
# and a qgcomp.boot fit, where the risk/prevalence ratio is estimated, 
#  rather than the odds ratio:
qcboot.fit2b


## ---- results='markup', fig.show='hold', fig.height=7, fig.width=10, cache=FALSE----

qc.fit3 <- qgcomp.noboot(y ~ mage35 + arsenic + barium + cadmium + calcium + chloride + 
                           chromium + copper + iron + lead + magnesium + manganese + 
                           mercury + selenium + silver + sodium + zinc,
                         expnms=Xnm,
                         metals, family=gaussian(), q=4)
plot(qc.fit3)
qcboot.fit3 <- qgcomp.boot(y ~ mage35 + arsenic + barium + cadmium + calcium + chloride + 
                           chromium + copper + iron + lead + magnesium + manganese + 
                           mercury + selenium + silver + sodium + zinc,
                         expnms=Xnm,
                         metals, family=gaussian(), q=4, B=10,# B should be 200-500+ in practice
                         seed=125)
plot(qcboot.fit3)


## ---- results='markup', fig.show='hold', fig.height=7, fig.width=10, cache=FALSE----

qcboot.fit4 <- qgcomp(y~. + .^2,
                         expnms=Xnm,
                         metals[,c(Xnm, 'y')], family=gaussian(), q=4, B=10, seed=125)
plot(qcboot.fit4)

## ---- results='markup', fig.show='hold', fig.height=7, fig.width=10, cache=FALSE----

qcboot.fit5 <- qgcomp(y~. + .^2,
                         expnms=Xnm,
                         metals[,c(Xnm, 'y')], family=gaussian(), q=4, degree=2, B=10, seed=125)
plot(qcboot.fit5)


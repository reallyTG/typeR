library(nspmix)


### Name: cnmms
### Title: Maximum Likelihood Estimation of a Semiparametric Mixture Model
### Aliases: cnmms cnmpl cnmap
### Keywords: function

### ** Examples

## Compute the MLE of a finite mixture
x = rnpnorm(200, mu=c(0,4), pr=c(0.7,0.3), sd=1)
for(k in 1:6) plot(cnmms(x, kmax=k), x, add=(k>1), comp="null", col=k+1,
                   main="Finite Normal Mixtures")
legend("topright", 0.3, leg=paste0("k = ",1:6), lty=1, lwd=2, col=2:7)

## Compute a semiparametric MLE
# Common variance problem 
x = rcvps(k=100, ni=5:10, mu=c(0,4), pr=c(0.7,0.3), sd=3)
cnmms(x)            # CNM-MS algorithm
cnmpl(x)            # CNM-PL algorithm
cnmap(x)            # CNM-AP algorithm

# Logistic regression with a random intercept
x = rmlogit(k=100, gi=3:5, ni=6:10, pt=c(0,4), pr=c(0.7,0.3),
            beta=c(0,3))    
cnmms(x)


### Real-world data
# Random intercept logistic model
data(toxo)
cnmms(mlogit(toxo))

data(betablockers)
cnmms(mlogit(betablockers))

data(lungcancer)
cnmms(mlogit(lungcancer))




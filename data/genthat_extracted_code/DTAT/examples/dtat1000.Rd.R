library(DTAT)


### Name: dtat1000
### Title: Precomputed neutrophil-guided chemotherapy dose titration for
###   1000 simulated subjects.
### Aliases: dtat1000
### Keywords: datasets

### ** Examples


data(dtat1000)
# 1. Extract the N final doses, assuming convergence by the tenth course
MTD_i <- with(dtat1000, dose[time==27])
MTD_i <- MTD_i[MTD_i < 5000] # Exclude few outliers
# 2. Do a kernel density plot
library(Hmisc)
hist <- histogram(~MTD_i, breaks=c(0,100,200,300,400,600,900,1500,2500,4000,5000)
                  , xlab=expression(MTD[i]))
approx <- data.frame(mtd_i=seq(0, 5000, 10))
approx <- upData(approx,
                 gamma = dgamma(mtd_i, shape=1.75, scale=200))
dist <- xyplot(gamma ~ mtd_i, data=approx, type='l', col='black', lwd=2)
library(grid)
hist + dist
grid.text(expression(MTD[i] %~%
                     paste("Gamma(", alpha==1.75, ", ", beta==1/200,")"))
         , x=unit(0.5,"npc")
         , y=unit(0.75,"npc")
         )
## No test: 
# Demonstrate exact reproduction of this data set (the titration takes many minutes!)
set.seed(2016)
Onoue.Friberg(N=1000)
# This titration may take an hour to run ...
chemo <- titrate(doserange = 100,
                 dta=newton.raphson(dose1 = 100,
                                    omega = 0.75,
                                    slope1 = -2.0,
                                    slopeU = -0.2)
)

dtat1k <- upData(chemo$course
                , time = 3*(cycle-1)
                , labels = c(time="Time")
                , units = c(time="weeks")
                , print = FALSE)

stopifnot(identical(dtat1k, dtat1000))
## End(No test)





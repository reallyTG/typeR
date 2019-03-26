library(nspmix)


### Name: mlogit
### Title: Class 'mlogit'
### Aliases: mlogit rmlogit
### Keywords: class function

### ** Examples


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





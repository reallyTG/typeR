library(compute.es)


### Name: des
### Title: Mean Difference (d) to Effect size
### Aliases: des
### Keywords: arith

### ** Examples
 
# CALCULATE SEVERAL EFFECT SIZES BASED ON d STATISTIC: 

library(compute.es)
 
args(des)  # d STAT TO OTHER ES (INCLUDING HEDGES g)

# SCALAR
des(d=0.8, n.1=30, n.2=30)

## VECTOR OF d VALUES

# SAMPLE DATA
dat <- data.frame(id=1:30,
                  d=rnorm(30, 0.8, 0.1),
                  nT=round(rnorm(30, 30, 5), 0),
                  nC=round(rnorm(30, 30, 5), 0)
                  )
des(d=d, n.1=nT, n.2=nC, id=id, data=dat)

# TO EXTRACT JUST g AND var(g)
des(d=d, n.1=nT, n.2=nC, id=id, data=dat)[,13:14]





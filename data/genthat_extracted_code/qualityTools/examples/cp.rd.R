library(qualityTools)


### Name: cp
### Title: Process Capability Indices
### Aliases: cp
### Keywords: Process Capability Analysis Distribution Identification Six
###   Sigma

### ** Examples

x = rweibull(30, 2, 8) +100
#process capability for a weibull distribution
cp(x, "weibull", lsl = 100, usl = 117)

#box cox transformation and one sided
cp(x, boxcox = TRUE, lsl = 1)

#process capability assuming a normal distribution
cp(x, "normal", lsl = 0, usl = 17)

#process capability for a normal distribution and data in subgroups
#some artificial data with shifted means in subgroups
x = c(rnorm(5, mean = 1), rnorm(5, mean = 2), rnorm(5, mean = 0))

#grouping vector
group = c(rep(1,5), rep(2,5), rep(3,5))
                                                                    
#calculate process capability
cp(x, grouping = group) #compare to sd(x)





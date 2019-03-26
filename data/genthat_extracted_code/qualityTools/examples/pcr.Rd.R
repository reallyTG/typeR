library(qualityTools)


### Name: pcr
### Title: Process Capability Indices
### Aliases: pcr
### Keywords: Process Capability Analysis Distribution Identification Six
###   Sigma

### ** Examples

x = rweibull(30, 2, 8) +100
#process capability for a weibull distribution
pcr(x, "weibull", lsl = 100, usl = 117)

#box cox transformation and one sided
pcr(x, boxcox = TRUE, lsl = 1)

#boxcox with lambda=2
pcr(x, boxcox = 2, lsl = 1)

#process capability assuming a normal distribution
pcr(x, "normal", lsl = 0, usl = 17)

#process capability for a normal distribution and data in subgroups
#some artificial data with shifted means in subgroups
x = c(rnorm(5, mean = 1), rnorm(5, mean = 2), rnorm(5, mean = 0))

#grouping vector
group = c(rep(1,5), rep(2,5), rep(3,5))
                                                                    
#calculate process capability
pcr(x, grouping = group) #compare to sd(x)





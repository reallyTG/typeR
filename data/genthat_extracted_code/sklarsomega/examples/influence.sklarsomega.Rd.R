library(sklarsomega)


### Name: influence.sklarsomega
### Title: Compute DFBETAs for units and/or coders.
### Aliases: influence.sklarsomega

### ** Examples

## No test: 
# The following data were presented in Krippendorff (2013).

data = matrix(c(1,2,3,3,2,1,4,1,2,NA,NA,NA,
                1,2,3,3,2,2,4,1,2,5,NA,3,
                NA,3,3,3,2,3,4,2,2,5,1,NA,
                1,2,3,3,2,4,4,1,2,5,1,NA), 12, 4)
colnames(data) = c("c.1.1", "c.2.1", "c.3.1", "c.4.1")
fit = sklars.omega(data, level = "nominal", confint = "none")
summary(fit)
(inf = influence(fit, units = c(6, 11), coders = c(2, 3)))
## End(No test)




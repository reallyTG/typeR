library(HCT)


### Name: hct
### Title: Comparison of a single armed study to a collection of study
###   results from multiple previous clinical trials.
### Aliases: hct
### Keywords: models

### ** Examples

## No test: 
als=data.frame(estimate=c(3.5,2.6,2.3),SE=c(.4,.3,.6),N=c(100,150,76))
ts=hct(als,'estimate','SE','N')
print(ts)
us=ts$criteria(0.025,.3)
ts$power(us,5,.4)
## End(No test)




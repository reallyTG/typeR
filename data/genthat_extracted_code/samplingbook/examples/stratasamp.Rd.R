library(samplingbook)


### Name: stratasamp
### Title: Sample Size Calculation for Stratified Sampling
### Aliases: stratasamp

### ** Examples

#random proportional stratified sample
stratasamp(n=500, Nh=c(5234,2586,649,157))
stratasamp(n=500, Nh=c(5234,2586,649,157), Sh=c(251,1165,8035,24725), type='opt')




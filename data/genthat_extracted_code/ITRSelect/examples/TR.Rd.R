library(ITRSelect)


### Name: TR
### Title: Individualized treatment regime based on PAL or SAS.
### Aliases: TR
### Keywords: Individualized treatment regime

### ** Examples

## No test: 
## load simulated STARD data
data(SSTARD.twostage)
## estimate individualized treatment regime using SAS
result <- SAS(Y~X1|A1|X2|A2, data=SSTARD.twostage)
## make the recommendation 
TR(result, x1=SSTARD.twostage$X1, a1=SSTARD.twostage$A1, x2=SSTARD.twostage$X2, stage=2)
## End(No test)




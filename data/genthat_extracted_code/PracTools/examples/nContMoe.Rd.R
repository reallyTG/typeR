library(PracTools)


### Name: nContMoe
### Title: Compute a simple random sample size for an estimated mean of a
###   continuous variable based on margin of error
### Aliases: nContMoe
### Keywords: methods survey

### ** Examples

nContMoe(moe.sw=1, e=0.05, alpha=0.05, S2=2)
nContMoe(moe.sw=1, e=0.05, alpha=0.05, S2=2, N=200)
nContMoe(moe.sw=2, e=0.05, alpha=0.05, CVpop=2)
nContMoe(moe.sw=2, e=0.05, alpha=0.05, CVpop=2, N=200)
nContMoe(moe.sw=2, e=0.05, alpha=0.05, S2=4, ybarU=2)




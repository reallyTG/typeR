library(EurosarcBayes)


### Name: binom_one_alpha
### Title: Single arm, exact p-value calculator for single or multi-stage
###   binomial trials.
### Aliases: binom_one_alpha

### ** Examples

# Simon's two stage design
failure=c(0,3)
success=c(NA,4)
n=c(7,18)
p0=0.1

result.success=4
result.n=18

# without accounting for interim analysis when calculating 
# the p-value
1-pbinom(result.success-1,result.n,p0)
# account for interim analysis
binom_one_alpha(result.success,result.n,p0,failure,success,n)




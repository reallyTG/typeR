library(EurosarcBayes)


### Name: binom_one_power
### Title: Single arm, power calculator for single or multi-stage binomial
###   trials.
### Aliases: binom_one_power plot_binom_one_power

### ** Examples

# Simon's two stage design
failure=c(0,3)
success=c(NA,4)
n=c(7,18)
p0=0.1
p1=0.3

# power
binom_one_power(p1,failure,success,n)
# type 1 error (alpha)
binom_one_power(p0,failure,success,n)

# plot
plot_binom_one_power(failure,success,n,ndivisions=1000,p=c(p0,p1),
 alpha=0.1,power=0.8)




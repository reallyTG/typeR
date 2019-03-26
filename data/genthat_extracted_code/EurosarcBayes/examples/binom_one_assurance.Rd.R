library(EurosarcBayes)


### Name: binom_one_assurance
### Title: Single arm, assurance calculator for single or multi-stage
###   binomial trials.
### Aliases: binom_one_assurance plot_binomassurance

### ** Examples

# Simon's two stage design
failure=c(0,3)
success=c(NA,4)
n=c(7,18)
p0=0.1
p1=0.3

# continuous assurance distribution
ass.dist = function(p) dbeta(p,4,18)

# assurance
binom_one_assurance(failure,success,n,ass.dist)

# plot
plot_binomassurance(failure,success,n,ass.dist,ndivisions=1000)

# discrete assurance distribution
ass.dist = matrix(c(0.2,0.3,0.4,0.3,0.4,0.3),ncol=2)

# assurance
binom_one_assurance(failure,success,n,ass.dist,type="discrete")

# plot
plot_binomassurance(failure,success,n,ass.dist,type="discrete",
                    ndivisions=1000)




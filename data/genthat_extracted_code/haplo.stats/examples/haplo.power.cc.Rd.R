library(haplo.stats)


### Name: haplo.power.cc
### Title: Compute either power or sample size for haplotype associations
###   in a case-control study.
### Aliases: haplo.power.cc haplo.power.cc.ncp find.intercept.logistic
### Keywords: design

### ** Examples

haplo <- rbind(
               c(     1,    2,    2,    1,    2),
               c(     1,    2,    2,    1,    1),
               c(     1,    1,    2,    1,    1),
               c(     1,    2,    1,    1,    2),
               c(     1,    2,    2,    2,    1),
               c(     1,    2,    1,    1,    1),
               c(     1,    1,    2,    2,    1),
               c(     1,    1,    1,    1,    2),
               c(     1,    2,    1,    2,    1),
               c(     1,    1,    1,    2,    1),
               c(     2,    2,    1,    1,    2),
               c(     1,    1,    2,    1,    2),
               c(     1,    1,    2,    2,    2),
               c(     1,    2,    2,    2,    2),
               c(     2,    2,    2,    1,    2),
               c(     1,    1,    1,    1,    1),
               c(     2,    1,    1,    1,    1),
               c(     2,    1,    2,    1,    1),
               c(     2,    2,    1,    1,    1),
               c(     2,    2,    1,    2,    1),
               c(     2,    2,    2,    1,    1))
dimnames(haplo)[[2]] <- paste("loc", 1:ncol(haplo), sep=".")
haplo <- data.frame(haplo)

haplo.freq <- c(0.170020121, 0.162977867, 0.123742455, 0.117706237, 0.097585513, 0.084507042,
                0.045271630, 0.039235412, 0.032193159, 0.019114688, 0.019114688, 0.013078471,
                0.013078471, 0.013078471, 0.013078471, 0.006036217, 0.006036217, 0.006036217,
                0.006036217, 0.006036217, 0.006036217)

# define index for risk haplotypes (having alleles 1-1 at loci 2 and 3)
haplo.risk <- (1:nrow(haplo))[haplo$loc.2==1 & haplo$loc.3==1]

# define index for baseline haplotype
base.index <-  1

# specify OR for risk haplotypes
or <- 1.25

# determine beta regression coefficients for risk haplotypes

haplo.beta <- numeric(length(haplo.freq))
haplo.beta[haplo.risk] <-  log(or)

# Note that non-risk haplotypes have beta=0, as does the intercept
# (haplotype with base.index value). 

# Compute total sample size for given power

haplo.power.cc(haplo, haplo.freq, base.index, haplo.beta, case.frac=.5,
prevalence=.1, alpha=.05, power=.8)

# Compute power for given sample size

haplo.power.cc(haplo, haplo.freq, base.index, haplo.beta, case.frac=.5,
prevalence=.1, alpha=.05, sample.size=11978)




library(haplo.stats)


### Name: haplo.power.qt
### Title: Compute either power or sample size for haplotype associations
###   with a quantitative trait.
### Aliases: haplo.power.qt haplo.power.qt.ncp
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

haplo.freq <- c(0.170020121, 0.162977867, 0.123742455, 0.117706237,
0.097585513, 0.084507042, 0.045271630, 0.039235412, 0.032193159,
0.019114688, 0.019114688, 0.013078471, 0.013078471, 0.013078471,
0.013078471, 0.006036217, 0.006036217, 0.006036217,
0.006036217, 0.006036217, 0.006036217)

# define index for risk haplotypes (having alleles 1-1 at loci 2 and 3)
haplo.risk <- (1:nrow(haplo))[haplo$loc.2==1 & haplo$loc.3==1]

# define index for baseline haplotype
base.index <-  1

# Because it can be easier to speficy genetic effect size in terms of
# a regression model R-squared value (r2), we use an
# auxiliary function to set up haplo.beta based on a specifed r2 value:

tmp <- find.haplo.beta.qt(haplo,haplo.freq,base.index,haplo.risk,
r2=0.01, y.mu=0, y.var=1)

haplo.beta <- tmp$beta  

# Compute sample size for given power

haplo.power.qt(haplo, haplo.freq, base.index, haplo.beta, y.mu=0,
y.var=1, alpha=.05, power=.80) 

# Compute power for given sample size

haplo.power.qt(haplo, haplo.freq, base.index, haplo.beta, y.mu=0,
y.var=1, alpha=.05, sample.size = 2091)  




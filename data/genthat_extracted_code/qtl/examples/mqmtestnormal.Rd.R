library(qtl)


### Name: mqmtestnormal
### Title: Shapiro normality test used for MQM
### Aliases: mqmtestnormal
### Keywords: utilities

### ** Examples

data(multitrait)

# test normality of 7th phenotype
mqmtestnormal(multitrait, pheno.col=7)

# take log
multitrait <- transformPheno(multitrait, pheno.col=7, transf=log)

# test again
mqmtestnormal(multitrait, pheno.col=7)




library(mbmdr)


### Name: mbmdr
### Title: Model Based Multifactor Dimensionality Reduction
### Aliases: mbmdr print.mbmdr

### ** Examples


#---  Dicotomous outcome  -------------

# load example data
data(simSNP)

# MB-MDR analysis of all possible 2nd order interactions (it may take some time)
# The order of the interactions to be explored is specified by order=2
# fit <- mbmdr(y=simSNP$Y,data=simSNP[,3:12],order=2,family=binomial(link=logit))
# print(fit)

# MB-MDR analysis of the epistatic effect of SNP1 and SNP2 (Model 2 1)
# The specific model to be analyzed is specified by list.models=c(2,1)
fit <- mbmdr(y=simSNP$Y,data=simSNP[,3:12],order=2,list.models=c(2,1),
             family=binomial(link=logit),printStep1=TRUE)
print(fit)


# MB-MDR analysis of the epistatic effect of SNP1 and SNP2, adjusted for variable X
# The specific model to be analyzed is specified by list.models=c(2,1)
# The adjustment statement is specified by adjust="covariates"
fit <- mbmdr(y=simSNP$Y,data=simSNP[,3:12],order=2,list.models=c(2,1),
             covar=simSNP$X,adjust="covariates",family=binomial(link=logit))
print(fit)


# MB-MDR analysis of all 2nd order interactions restricted to a subset of snps 
# (all possible 2nd order interactions among SNP1, SNP2 and SNP3 are explored,
# it may take some time)
# SNP1, SNP2 and SNP3 are placed in columns 3 to 5 of simSNP. This is specified
# by data=simSNP[,3:5]
# fit <- mbmdr(y=simSNP$Y,data=simSNP[,3:5],order=2,family=binomial(link=logit),
#             printStep1=TRUE)
# print(fit)


# MB-MDR analysis of all possible 3rd order interactions (it may take some time)
# The order of the interactions to be explored is specified by order=3
# fit <- mbmdr(y=simSNP$Y,data=simSNP[,3:12],order=3,family=binomial(link=logit))
# print(fit)


# MB-MDR analysis of the 3rd order epistatic effect of SNP1, SNP2 and SNP3
# The specific model to be analyzed is specified by list.models=c(3,2,1)
# fit <- mbmdr(y=simSNP$Y,data=simSNP[,3:12],order=3,list.models=c(3,2,1),
#              family=binomial(link=logit),printStep1=TRUE)
# print(fit)


#---  Continuous outcome  --------------
# load example data
data(simSNPcont)

# MB-MDR analysis of all possible 2nd order interactions (it may take some time)
# The order of the interactions to be explored is specified by order=2
# fit <- mbmdr(y=simSNPcont$Y,data=simSNPcont[,2:11],order=2)
# print(fit)

# MB-MDR analysis of the epistatic effect of SNP1 and SNP2 (Model 2 1)
# The specific model to be analyzed is specified by list.models=c(2,1)
fit <- mbmdr(y=simSNPcont$Y,data=simSNPcont[,2:11],order=2,
	           list.models=c(2,1),printStep1=TRUE)
print(fit)






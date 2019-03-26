library(mratios)


### Name: ttestratio
### Title: t-test for the ratio of two means
### Aliases: ttestratio ttestratio.default ttestratio.formula
### Keywords: htest

### ** Examples


library(mratios)

####################################################

# ASAT values of female rats in a toxicity study
#     (Hauschke, 1999).

data(ASAT)
ASAT

ttestratio(ASAT~group, data=ASAT, alternative="less",
 base=1, rho=1.25, var.equal=TRUE)

######################################################

# Bodyweights of male rats in a toxicity study.
# Objective was to show equivalence between the high
# dose group (Dosis) and the control group (Kon).
# Equivalence margins are set to 0.8 and 1.25. The 
# type-I-error to show equivalence is set to alpha=0.05.

data(rat.weight)

# two one-sided tests:

ttestratio(weight~group, data=rat.weight, alternative="less",
 rho=1.25, var.equal=TRUE)

ttestratio(weight~group, data=rat.weight, alternative="greater",
 rho=0.8, var.equal=TRUE)



# For rho=1, ttestratio corresponds to a simple t.test
# with the difference of means under the null set to zero 
# (,i.e. mu=0).


ttestratio(ASAT~group, data=ASAT, alternative="less",
 rho=1, var.equal=TRUE)

t.test(ASAT~group, data=ASAT, alternative="less",
 mu=0, var.equal=TRUE)

# Ratio of means bewtween negative and positive control in the
# mutagenicity data set, allowing heterogeneous variances:

data(Mutagenicity)
DM<-subset(Mutagenicity, Treatment=="Vehicle"|Treatment=="Cyclo25")

# 95%-CI using the Fieller formula, Satterthwaite df with plug-in of 
# ratio estimate 

ttestratio(MN~Treatment, data=DM, alternative="two.sided",
 var.equal=FALSE, iterativeCI=FALSE)

# 95%-CI based on directly inverting Tamhane and Logans test 
# (Satterthwaite df, avoiding simple plug-in of the ratio estimate)

ttestratio(MN~Treatment, data=DM, alternative="two.sided",
 var.equal=FALSE, iterativeCI=TRUE)






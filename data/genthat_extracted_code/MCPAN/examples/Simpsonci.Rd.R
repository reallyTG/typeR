library(MCPAN)


### Name: Simpsonci
### Title: Confidence intervals for differences of Simpson indices
### Aliases: Simpsonci
### Keywords: htest

### ** Examples


data(HCD)

HCDcounts<-HCD[,-1]
HCDf<-HCD[,1]

# Rogers and Hsu (2001), Table 2:
# All pair wise comparisons:

Simpsonci(X=HCDcounts, f=HCDf, type = "Tukey",
 conf.level = 0.95, dist = "MVN")

# Rogers and Hsu (2001), Table 3:
# Comparison to the lower cretaceous:

Simpsonci(X=HCDcounts, f=HCDf, type = "Dunnett",
 alternative = "less", conf.level = 0.95, dist = "MVN")


# Note, that the confidence bounds here differ
# from the bounds in Rogers and Hsu (2001) 
# in the second digit, whenever the group Upper
# is involved in the comparison.


# Stepwise comparison between the strata:

SimpsonS<-Simpsonci(X=HCDcounts, f=HCDf, type = "Sequen",
 alternative = "greater", conf.level = 0.95, dist = "MVN")

SimpsonS
summary(SimpsonS)

plot(SimpsonS)

# # # Hell Creek Dinosaur data:
# Is there a downward trend in biodiversity during the 
# Creataceous period?

# A trend test based on multiple contrasts:

cmatTREND<-rbind(
"U-LM"=c(-0.5,-0.5,1),
"MU-L"=c(-1,0.5,0.5),
"U-L"=c(-1,0,1)
)

TrendCI<-Simpsonci(X=HCDcounts, f=HCDf, cmat=cmatTREND, 
 alternative = "greater", conf.level = 0.95, dist = "MVN")
TrendCI

plot(TrendCI)






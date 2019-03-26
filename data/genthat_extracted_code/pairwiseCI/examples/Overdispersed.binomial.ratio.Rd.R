library(pairwiseCI)


### Name: overdispersed.binomial.ratio
### Title: Confidence intervals for risk ratios of overdispersed binomial
###   data
### Aliases: Quasibin.ratio Betabin.ratio ODbin.ratio
### Keywords: htest

### ** Examples


# Toxicologoical data: Number of Pups alive four days after birth (16 litters of rats)
# Original source: Weil, 1970: Selection of valid number[...].
#  Food and Cosmetics, Toxicology, 8, 177-182.
# Cited from Zaihra and Paul(2010): Interval Estimation  of Some Epidemiological
# Measures of Association. Int. J Biostatistics, 6(1), Article 35.


mchem = c(12, 11, 10, 9, 11, 10, 10, 9, 9, 5, 9, 7, 10, 6, 10, 7)
xchem = c(12, 11, 10, 9, 10,  9,  9, 8, 8, 4, 7, 4,  5, 3,  3, 0)
dchem <- cbind("alive"=xchem, "dead"=mchem-xchem)

mcon = c(13, 12, 9, 9, 8, 8, 13, 12, 10, 10, 9, 13, 5, 7, 10, 10)
xcon = c(13, 12, 9, 9, 8, 8, 12, 11,  9,  9, 8, 11, 4, 5,  7,  7)
dcon <- cbind("alive"=xcon, "dead"=mcon-xcon)


# Zaihra and Paul report: MR2: [0.714; 1.034]
ODbin.ratio(x=dchem, y=dcon, CImethod="LOD", resbin=FALSE) 

# Zaihra and Paul report: MR4: [0.710; 1.029]
ODbin.ratio(x=dchem, y=dcon, CImethod="FOD", resbin=FALSE) 



Betabin.ratio(x=dchem, y=dcon, CImethod="FBB", iccpool=TRUE, resbin=TRUE) 

Quasibin.ratio(x=dchem, y=dcon)


# Solar protection data: intervention and control group (Mayer, 1997:)

# Number of children with adequate level of solar protection
# Source: Mayer, Slymen, Eckhardt et al.(1997): Reducing ultraviolat 
# radiation exposure in children. Preventive Medicine 26, 845-861. 
# Cited from: Lui et al. (2000)

mint=c(3,2,2,5,4,3,1,2,2,2,1,3,1,3,2,2,6,2,4,2,2,2,2,1,1,1,1,1,1)
xint=c(1,1,1,0,1,2,1,2,2,1,1,2,1,2,2,0,0,0,0,1,2,1,1,1,1,0,0,0,0)
dint <- cbind("adequate"=xint, "non-adequate"=mint-xint)

mcont=c(2,4,3,2,3,4,4,2,2,3,2,2,4,3,2,3,1,1,2,2,2,3,3,4,1,1,1,1,1)
xcont=c(0,0,2,2,0,4,2,1,1,3,2,1,1,3,2,3,1,0,1,2,1,1,2,4,1,1,1,0,0)
dcont <- cbind("adequate"=xcont, "non-adequate"=mcont-xcont)


# Lui et al.(2000) report for the Fieller-Bailey method
# with pooled ICC: 905% CI = [0.964; 2.281]
Betabin.ratio(x=dcont, y=dint, conf.level=0.95, alternative="two.sided",
 CImethod="FBB", iccpool=TRUE, resbin=FALSE) 

# and for the Log-scale delta method with pooled ICC:
# 95% CI = [0.954; 2.248]
Betabin.ratio(x=dcont, y=dint, conf.level=0.95, alternative="two.sided",
 CImethod="LBB", iccpool=TRUE, resbin=FALSE) 

ODbin.ratio(x=dcont, y=dint, conf.level=0.95, alternative="two.sided",
 CImethod="FOD", resbin=TRUE) 

Quasibin.ratio(x=dcont, y=dint, conf.level = 0.95, alternative = "two.sided")







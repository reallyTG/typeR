library(FamEvent)


### Name: simfam
### Title: Generate familial time-to-event data
### Aliases: simfam
### Keywords: Simulation

### ** Examples


## Example 1: simulate family data from population-based design using
#  a Weibull distribution for the baseline hazard and inducing 
#  residual familial correlation through a shared gamma frailty.

fam <- simfam(N.fam=100, design="pop+", variation="frailty", 
       base.dist="Weibull", frailty.dist="gamma", depend=1, 
       allelefreq=0.02, base.parms=c(0.01,3), vbeta=c(-1.13, 2.35))

head(fam) 

## Not run: 
##D    famID indID gender motherID fatherID proband generation majorgene secondgene
##D  1     1     1      1        0        0       0          1         2          0
##D  2     1     2      0        0        0       0          1         3          0
##D  3     1     3      0        2        1       1          2         2          0
##D  4     1     4      1        0        0       0          0         3          0
##D  5     1     7      0        3        4       0          3         2          0
##D  6     1     8      1        3        4       0          3         3          0
##D    ageonset currentage time status mgene relation fsize naff weight
##D  1       70         68   68      0     1        4    11    1      1
##D  2      110         68   68      0     0        4    11    1      1
##D  3       36         40   36      1     1        1    11    1      1
##D  4      212         50   50      0     0        6    11    1      1
##D  5       79         19   19      0     1        3    11    1      1
##D  6      169         16   16      0     0        3    11    1      1
## End(Not run)
summary(fam)

plot(fam, famid=c(1:2)) # pedigree plots for families with IDs=1 and 2

## Example 2: simulate family data from two stage design to include 
#  30% of high risk families in the sample. 

fam <- simfam(N.fam=100, design="twostage", variation="frailty", 
       base.dist="Weibull", frailty.dist="gamma", depend=1, hr=0.3,
       base.parms=c(0.01,3), vbeta=c(-1.13, 2.35), allelefreq=0.02)

summary(fam)





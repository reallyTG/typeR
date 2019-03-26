library(SCCS)


### Name: samplesize
### Title: Sample size calculation in SCCS
### Aliases: samplesize
### Keywords: Sample size

### ** Examples


# Sample size for exposure RI = 2.5 with 21 days risk period, 
# all cases exposed. The level of significance is 0.05 
# with 80% power. The sample size of when p=1 is: 

   ss1 <- samplesize(eexpo=2.5, risk=21, astart=366, aend=730,
                 p=1, alpha=0.05, power=0.8)

   ss1


# the sample size of events from cases exposed or not when 75% of the 
# population are exposed

   ss2 <- samplesize(eexpo=2.5, risk=21, astart=366, aend=730,
                 p=0.75, alpha=0.05, power=0.8)


   ss2

# Sample size when age effect is included and the proportions of the  
# target exposed population which are exposed in each age group
# are p=c(0.50,0.35,0.1,0.05): 

   ss3 <- samplesize(eexpo=2.5, risk=21, astart=366, aend=730,
                 p=c(0.50,0.35,0.1,0.05), alpha=0.05, power=0.8,
                 eage=c(1.2,1.6,2.0), agegrp=c(457,548,639))

   ss3
 
# Suppose that the sample is from the entire population with 75% exposed,
# then p=0.75*c(0.50,0.35,0.1,0.05)  

  ss4 <- samplesize(eexpo=2.5, risk=21, astart=366, aend=730,
                 p=0.75*c(0.50,0.35,0.1,0.05), alpha=0.05, power=0.8,
                 eage=c(1.2,1.6,2.0), agegrp=c(457,548,639)) 
  ss4 
 




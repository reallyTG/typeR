library(prop.comb.RR)


### Name: prop.comb
### Title: prop.comb
### Aliases: prop.comb

### ** Examples

# ONE PROPORTION
# Yu et al (2014) use a data set, which describes characteristics of some 
# American bridges. The objetive is to construct CIs for the proportion 
# of wood bridges.

prop.comb(x=16, n=109, alternative="two.sided", conf.level=0.95)

# DIFFERENCE OF TWO PROPORTION
# Rodary et al. (1989) studied the response to chemotherapy and radiation 
# therapy in a randomized clinical trial on nephroblastoma. 
# The main objetive is to contruct CIs about the difference of the response 
# and to contrast the homogeneity of proportions.

prop.comb(x=c(83,69), n=c(88,76), alternative="two.sided", conf.level=0.95)

# COMBINATION OF TWO PROPORTIONS
# Martin and Alvarez (2013) construct CIs about the parameter "loss associated
# with a diagnostic test" in the context of comparing two diagnostic tests 
# (Bloch, 1997) and use a data set by Hanley and McNeil (1983). 

prop.comb(x=c(44, 3), n=c(54, 58), a=c(-0.4, 0.6), 
alternative="two.sided", conf.level=0.95)

# Tebbs and Roths (2008) refer to data about a multicenter clinical trial whose
# aim was to evaluate the efficacy of a lowered salt regim in the treatment of male 
# infants with acute diarrhea. The objetive it to obtain a confidence interval about 
# the proportion of fever cases in South American area. 

prop.comb(x=c(32, 34), n=c(107, 92), a=c(107/199, 92/199), 
alternative="two.sided", conf.level=0.95)


# LINEAR COMBINATION OF K>3 PROPORTIONS
# Price and Bonett (2004) refer to a study by Cohen et al. (1991) in which 120 rats 
# were randomly assigned four diets (high or low fat and with or without fiber).
# The absence or presence of a tumor was recorded for each rat.
# The contrast of interest will evaluate the effects of study's variables.

# Data of diet and tumor study:
x <-c(20, 14, 27, 19); n <-c(30, 30, 30, 30)
a1 <-c(+1, -1, -1, +1); a2 <-c(+1, +1, -1, -1); a3 <-c(+1, -1, +1, -1)

prop.comb(x, n, a=a1); prop.comb(x, n, a=a2); prop.comb(x, n, a=a3)




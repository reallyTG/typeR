library(SCCS)


### Name: semisccs
### Title: Semiparametric self-controlled case series method
### Aliases: semisccs
### Keywords: Semi-parametric

### ** Examples


# Example 1
# Semiparametric model for the ITP and MMR vaccine data

itp.mod1 <- semisccs(event~mmr, indiv=case, astart=sta,
                      aend=end, aevent=itp, adrug=mmr, aedrug=mmr+42,
                      expogrp=c(0,15,29), data=itpdat)

itp.mod1


# Example 2
# Data on itp and mmr vaccine
# Sex and mmr interaction included 

itp.mod2 <- semisccs(event~factor(sex)*mmr, indiv=case,
                      astart=sta, aend=end, aevent=itp, adrug=mmr,
                      aedrug=mmr+42, expogrp=c(0,15,29), data=itpdat)


itp.mod2





library(gamlss.inf)


### Name: gen.Zadj
### Title: Functions to generate zero adjusted distributions from existing
###   continuous gamlss.family distributions defined on positve real line.
### Aliases: gen.Zadj Zadj.d Zadj.p Zadj.q Zadj.r plotZadj
### Keywords: distribution regression

### ** Examples

# 1.
gen.Zadj("BCT")

plotBCTZadj()
plotBCTZadj(mu=3,sigma=0.35,xi0=0.5)

# 2.
gen.Family("SST", "log")
gen.Zadj("logSST") 
 plotlogSSTZadj()





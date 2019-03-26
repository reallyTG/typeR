library(psych)


### Name: VSS
### Title: Apply the Very Simple Structure, MAP, and other criteria to
###   determine the appropriate number of factors.
### Aliases: vss VSS MAP nfactors
### Keywords: multivariate models

### ** Examples


#test.data <- Harman74.cor$cov
#my.vss <- VSS(test.data,title="VSS of 24 mental tests")      
#print(my.vss[,1:12],digits =2) 
#VSS.plot(my.vss, title="VSS of 24 mental tests")

#now, some simulated data with two factors
#VSS(sim.circ(nvar=24),fm="minres" ,title="VSS of 24 circumplex variables")
VSS(sim.item(nvar=24),fm="minres" ,title="VSS of 24 simple structure variables")




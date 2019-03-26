library(NPCD)


### Name: JMLE
### Title: Joint maximum likelihood estimation of item parameters and
###   examinee attribute profiles
### Aliases: JMLE

### ** Examples

data("Data.DINA")
JMLE.result <- JMLE(Data.DINA$response, Data.DINA$Q, model="DINA", conv.crit.par=0.001, 
conv.crit.att=0.001, max.ite=100)
print(JMLE.result)  # Print the estimated item parameters, standard errors, 
#and examinee attribute profiles
plot(JMLE.result, nperson=1)   # Plot the sorted loss function of different 
#attribute profiles for this examinee
ItemFit(JMLE.result)
ModelFit(JMLE.result)




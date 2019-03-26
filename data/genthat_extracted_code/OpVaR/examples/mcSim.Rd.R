library(OpVaR)


### Name: mcSim
### Title: Monte Carlo Simulation from opriskmodel objects for total loss
###   estimation
### Aliases: mcSim VaR

### ** Examples

## Not run: 
##D ### Load Example Data Set
##D data(lossdat)
##D 
##D ### Estimation of Complete Risk Model
##D opriskmodel1=list()
##D for(i in 1:length(lossdat)){
##D   opriskmodel1[[i]]=list()
##D   opriskmodel1[[i]]$freqdist=fitFreqdist(lossdat[[i]],"pois")
##D   opriskmodel1[[i]]$sevdist=fitPlain(lossdat[[i]],"lnorm")
##D }
##D 
##D ### Cell 1: Gumbel Copula, Cell 2: Independence, Cell 3: Frank Copula, Cell 4: Independence
##D opriskmodel1[[1]]$dependency=fitDependency(lossdat[[1]],6)
##D opriskmodel1[[3]]$dependency=fitDependency(lossdat[[3]],4)
##D 
##D ### Monte Carlo Simulation
##D mc_out=mcSim(opriskmodel1,100)
##D 
##D ### Evaluation of 95
##D VaR(mc_out,.95)
##D sla(opriskmodel1,.95)
##D 
##D ### Monte Carlo Simulation
##D mc_out=mcSim(opriskmodel1,100)
##D 
##D ### Evaluation of 95##D 
##D VaR(mc_out,.95)
## End(Not run)




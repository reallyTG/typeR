library(r4ss)


### Name: mcmc.out
### Title: Summarize, analyze and plot key MCMC output.
### Aliases: mcmc.out
### Keywords: hplot

### ** Examples


  ## Not run: 
##D       mcmc.df <- SSgetMCMC(dir="mcmcRun", writecsv=T,
##D                   keystrings = c("NatM", "R0", "steep", "Q_extraSD"),
##D                   nuisancestrings = c("Objective_function", "SPB_", "InitAge", "RecrDev"))
##D       mcmc.out("mcmcRun",run="",numparams=4,closeall=F)
##D 
##D   #Or for more control
##D       par(mar=c(5,3.5,0,0.5),oma=c(0,2.5,0.2,0))
##D       mcmc.out("mcmcRun",run="",numparams=1,closeall=F,new=F,colNames=c("NatM_p_1_Fem_GP_1"))
##D       mtext("M (natural mortality)",side=2,outer=T,line=1.5,cex=1.1)
##D   
## End(Not run)




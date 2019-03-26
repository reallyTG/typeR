library(mstate)


### Name: redrank
### Title: Reduced rank proportional hazards model for competing risks and
###   multi-state models
### Aliases: redrank
### Keywords: survival

### ** Examples

## Not run: 
##D     # This reproduces the results in Fiocco, Putter & van Houwelingen (2005)
##D     # Takes a while to run
##D     data(ebmt2)
##D     # transition matrix for competing risks
##D     tmat <- trans.comprisk(6,names=c("Relapse","GvHD","Bacterial","Viral","Fungal","Other"))
##D     # preparing long dataset
##D     ebmt2$stat1 <- as.numeric(ebmt2$status==1)
##D     ebmt2$stat2 <- as.numeric(ebmt2$status==2)
##D     ebmt2$stat3 <- as.numeric(ebmt2$status==3)
##D     ebmt2$stat4 <- as.numeric(ebmt2$status==4)
##D     ebmt2$stat5 <- as.numeric(ebmt2$status==5)
##D     ebmt2$stat6 <- as.numeric(ebmt2$status==6)
##D     covs <- c("dissub","match","tcd","year","age")
##D     ebmtlong <- msprep(time=c(NA,rep("time",6)),
##D                        stat=c(NA,paste("stat",1:6,sep="")),
##D                        data=ebmt2,keep=covs,trans=tmat)
##D 
##D     # The reduced rank 2 solution
##D     rr2 <- redrank(Surv(Tstart,Tstop,status) ~ dissub+match+tcd+year+age,
##D                    data=ebmtlong, R=2)
##D     rr3$Alpha; rr3$Gamma; rr3$Beta; rr3$loglik
##D     # The reduced rank 3 solution
##D     rr3 <- redrank(Surv(Tstart,Tstop,status) ~ dissub+match+tcd+year+age,
##D                    data=ebmtlong, R=3)
##D     rr3$Alpha; rr3$Gamma; rr3$Beta; rr3$loglik
##D     # The reduced rank 3 solution, with no reduction on age
##D     rr3 <- redrank(Surv(Tstart,Tstop,status) ~ dissub+match+tcd+year, full=~age,
##D                    data=ebmtlong, R=3)
##D     rr3$Alpha; rr3$Gamma; rr3$Beta; rr3$loglik
##D     # The full rank solution
##D     fullrank <- redrank(Surv(Tstart,Tstop,status) ~ dissub+match+tcd+year+age,
##D                         data=ebmtlong, R=6)
##D     fullrank$Beta; fullrank$loglik
## End(Not run)




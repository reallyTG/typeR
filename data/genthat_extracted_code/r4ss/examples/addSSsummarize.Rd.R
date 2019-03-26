library(r4ss)


### Name: addSSsummarize
### Title: Add a model to the list of models to compare
### Aliases: addSSsummarize
### Keywords: data list manip

### ** Examples


  ## Not run: 
##D   ######################################
##D   #DO NOT RUN
##D tinss1 <- list(npars=A$fit$npar,maxgrad=A$fit$maxgrad,nsexes=1,
##D                #note, there is an estimated parameter called sd_sbt,
##D                #      but it is a single value
##D                SpawnBio=data.frame(c(1964,1965,A$yrs),
##D                                    c(A$sbo,A$sbo,A$sbt)*1e6,0,
##D                                    qnorm(0.025,c(A$so,A$so,A$sbt)*1e6,0),
##D                                    qnorm(0.975,c(A$so,A$so,A$sbt)*1e6,0)),
##D                Bratio=data.frame(A$yrs,A$sbt/A$sbo,0,
##D                                  qnorm(0.025,A$sbt/A$sbo,0),
##D                                  qnorm(0.975,A$sbt/A$sbo,0)),
##D                SPRratio=data.frame(A$yr,A$spr,0,qnorm(0.025,A$spr,0),
##D                                    qnorm(0.975,A$spr,0)),
##D                recruits=data.frame(A$yr,A$nt[,1]*1e6,0,qnorm(0.025,A$nt[,1]*1e5,0),
##D                                    qnorm(0.975,A$nt[,1]*1e6,0)),
##D                #I'm not sure exactly what wt are,
##D                #   but it is important to line them up correctly
##D                recdevs=data.frame(A$recYrs,A$wt),  
##D                indices = data.frame(A$iyr,1e6*A$yt,1e6*A$qbt,
##D                                     rep(A$q,length(A$iyr)),rep(0.4,length(A$iyr)),
##D                                     rep(0,length(A$iyr)),rep(1,length(A$iyr)))
##D                )
##D   tinss <- list(tinss1,tinss1)   #can add more models here
##D 
##D 
##D   #add TINSS model to SS models already summarized                
##D   SSnTINSS <- addSSsummarize(models,tinss)
##D   mcmcInd <- seq(burnin+1,nrow(A$mc.sbt),thin)
##D   SSnTINSS$mcmc[[2]] <- data.frame(A$mc.sb0[mcmcInd],
##D                                    A$mc.sbt[mcmcInd,],
##D                                    A$mc.depl[mcmcInd,],
##D                                    A$mc.spr[mcmcInd,],
##D                                    A$mc.rt[mcmcInd,],
##D                                    log(A$mcmc[mcmcInd,"Ro"]*1e6),
##D                                    A$mcmc[mcmcInd,"msy"]*1e6)  
##D   names(SSnTINSS$mcmc[[2]]) <-
##D     c("SPB_Virgin",paste("SPB",A$yrs,sep="_"),
##D       paste("Bratio",A$yrs,sep="_"),
##D       paste("SPRratio",A$yr,sep="_"),
##D       paste("Recr",A$yr,sep="_"),"SR_R0","TotYield_MSY")
##D   modelnames <- c("SS", "TINSS","TINSS.MLE")
##D   
##D   SSplotComparisons(SSnTINSS, legendlabels=modelnames,
##D                     subplot=2,endyr=2011,mcmcVec=c(T,T,F))
##D   title(main="MCMC")
##D   SSplotComparisons(SSnTINSS, legendlabels=modelnames,
##D                     subplot=4,endyr=2011,mcmcVec=c(T,T,F))
##D   title(main="MCMC")
##D   ###############################################
##D   
## End(Not run)





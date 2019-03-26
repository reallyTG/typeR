library(r4ss)


### Name: SSplotRetroRecruits
### Title: Make squid plot of retrospectives of recruitment deviations.
### Aliases: SSplotRetroRecruits
### Keywords: hplot

### ** Examples


 ## Not run: 
##D  # run retrospective analysis
##D  SS_doRetro(olddir='2013hake_12',years=0:-10)
##D  # read in output
##D  retroModels <- SSgetoutput(dirvec=paste('retrospectives/retro',-10:0,sep=''))
##D  # summarize output
##D  retroSummary <- SSsummarize(retroModels)
##D 
##D  # set the ending year of each model in the set
##D  endyrvec <- retroModels[[1]]$endyr-10:0
##D  # make comparison plot
##D  pdf('retrospectives/retrospective_comparison_plots.pdf')
##D  SSplotComparisons(retroSummary,endyrvec=endyrvec,new=FALSE)
##D  dev.off()
##D 
##D  # make Squid Plot of recdev retrospectives 
##D  pdf('retrospectives/retrospective_dev_plots.pdf',width=7,height=10)
##D  par(mfrow=c(2,1))
##D  # first scaled relative to most recent estimate
##D  SSplotRetroRecruits(retroSummary, endyrvec=endyrvec, cohorts=1999:2012,
##D                      relative=TRUE, legend=FALSE)
##D  # second without scaling
##D  SSplotRetroDevs(retroSummary, endyrvec=endyrvec, cohorts=1999:2012,
##D                  relative=FALSE, legend=FALSE)
##D  dev.off()
##D  
## End(Not run)





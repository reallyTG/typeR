library(r4ss)


### Name: SS_doRetro
### Title: Run retrospective analyses
### Aliases: SS_doRetro
### Keywords: data manip

### ** Examples


  ## Not run: 
##D     # note: don't run this in your main directory--make a copy in case something goes wrong
##D     mydir <- "C:/Simple"
##D 
##D     ## retrospective analyses
##D     SS_doRetro(masterdir=mydir, oldsubdir="", newsubdir="retrospectives", years=0:-5)
##D     
##D     retroModels <- SSgetoutput(dirvec=file.path(mydir, "retrospectives",paste("retro",0:-5,sep="")))
##D     retroSummary <- SSsummarize(retroModels)
##D     endyrvec <- retroSummary$endyrs + 0:-5
##D     SSplotComparisons(retroSummary, endyrvec=endyrvec, legendlabels=paste("Data",0:-5,"years"))
##D   
## End(Not run)





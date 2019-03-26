library(Maeswrap)


### Name: maesparunall
### Title: Functions for MAESPA batch runs
### Aliases: maesparunall maestrarunall runmaespa runmaestra

### ** Examples

## Not run: 
##D 
##D #-1. Run the second row of some csv file, using only entries in
##D # columns 2, 3 and 4. Note that all column names in the .csv
##D # file must be documented in the definition file, and that the
##D # definition file must be in the current working directory!
##D runmaespa(2, runfile="runfiletest.csv", runit=FALSE, whichcols=2:4)
##D 
##D #-2. Run all rows and all parameters from a comma-separated file.
##D runresults <- maesparunall(runfile="runfiletest.csv")
##D 
##D #-3. Look at first run:
##D summary(runresults$daily[[1]])
##D 
##D #-4. Summarize across runs with statements like these.
##D # Sum net photosynthesis across runs:
##D sapply(runresults$daily, function(dfr)sum(dfr$netPs))
##D 
##D #-5. Or write all results to disk:
##D filenames <- paste("MaespaDailyresults",1:length(runresults$daily),".txt",sep="")
##D for(f in 1:length(filenames)){
##D     write.table(runresults$daily[[f]],filenames[f],sep=" ",row.names=FALSE)
##D }
##D 
##D #-6. Use different executable:
##D runmaespa(executable="othermaestra.exe")
##D 
##D #-7. Or set this other executable as the default for the rest of the session,
##D # so that you only need to set it once (until you restart R anyway).
##D formals(runmaespa)$executable <- "othermaestra.exe"
##D 
##D #-8. Specify additional output files to read and save:
##D myrun <- maestrarunall(runfile="myrunfile.csv", extrafiles=c("layflx.dat","resp.dat"))
##D # These two files are then available in the 'myrun' list by names 'layflx' and 'resp'.
##D 
## End(Not run)




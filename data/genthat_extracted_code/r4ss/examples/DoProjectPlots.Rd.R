library(r4ss)


### Name: DoProjectPlots
### Title: Make plots from Rebuilder program
### Aliases: DoProjectPlots
### Keywords: dplot hplot

### ** Examples


## Not run: 
##D # example with one file
##D  DoProjectPlots(dirn="c:/myfiles/", Plots=1:8,
##D                 Options=c(1,2,3,4,5,9), LegLoc="bottomleft")
##D 
##D # example with multiple files
##D  # Plots - set to get specific plots
##D  # Options - set to get specific strategies in the trajectory plots
##D 
##D  Titles <- c("Res1","Res2","Res3")
##D  Plots <- list(c(1:9),c(6:7))
##D  Options <- list(c(7:9,3),c(5,7))
##D  DoProjectPlots(fileN=c("res1.csv","res2.csv"),Titles=Titles,Plots=Plots,
##D                 Options=Options,LegLoc="bottomleft",yearmax=-1,
##D                 Outlines=c(2,2),OutlineMulti=c(3,3),AllTraj=c(1:4),
##D                 AllInd=c(1:7),BioType="Spawning numbers",BioUnit="(lb)",
##D                 BioScalar=1000,CatchUnit="(lb)",
##D                 ColorsUse=rep(c("red","blue"),5),
##D                 Labels=c("A","B","C","D","E","F"))
## End(Not run)





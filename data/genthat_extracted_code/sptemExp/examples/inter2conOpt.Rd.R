library(sptemExp)


### Name: inter2conOpt
### Title: Batch Interpolation of the Missing Values for Time Series Using
###   Constrained Optimization.
### Aliases: inter2conOpt
### Keywords: models parallel

### ** Examples


## No test: 
# Here is the sample for the first 500 locations.
# In practice, you may need more point locations and more cores.
data("allPre500","shdSeries2014")
# Get the temporal basis functions to be used in constrained optimization
season_trends=getTBasisFun(shdSeries2014,idStr="siteid",dateStr="date",
                           valStr="obs",df=10,n.basis=2,tbPath=NA)

#Constrained optimization
season_trends$tid=as.numeric(strftime(season_trends$date, format = "%j"))
allPre_part_filled=inter2conOpt(tarPDf=allPre500[c(1:6),],pol_season_trends=season_trends,ncore=2)
## End(No test)





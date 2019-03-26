library(psych)


### Name: sim.multilevel
### Title: Simulate multilevel data with specified within group and between
###   group correlations
### Aliases: sim.multilevel sim.multi
### Keywords: multivariate models

### ** Examples

#First, show a few results from sim.multi

x.df <- sim.multi()  #the default is 4 subjects for two variables 
#                     over 16 days measured 6 times/day 

#sb <- statsBy(x.df,group ="id",cors=TRUE)
#round(sb$within,2)  #show the within subject correlations

#get some parameters to simulate
data(withinBetween)
wb.stats <- statsBy(withinBetween,"Group")
rwg <- wb.stats$rwg
rbg <- wb.stats$rbg
eta <- rep(.5,9)

#simulate them.  Try this again to see how it changes
XY <- sim.multilevel(ncases=100,ngroups=10,rwg=rwg,rbg=rbg,eta=eta)
lowerCor(XY$wg)  #based upon 89 df
lowerCor(XY$bg)  #based upon 9 df   -- 




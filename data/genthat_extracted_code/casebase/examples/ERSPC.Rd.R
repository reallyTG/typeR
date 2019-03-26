library(casebase)


### Name: ERSPC
### Title: Data on the men in the European Randomized Study of Prostate
###   Cancer Screening
### Aliases: ERSPC
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D ###  cumulative incidence plots
##D library(survival)
##D library(casebase)
##D data("ERSPC")
##D KM = survfit(Surv(Follow.Up.Time,DeadOfPrCa) ~ ScrArm, data = ERSPC)
##D str(KM)
##D par(mfrow=c(1,1),mar = c(5,5,0.1,0.1))
##D plot(KM$time[    1: 1501], 1-KM$surv[   1:1501], type="s", col="red" ,
##D      ylab = "Risk", xlab="Years since Randomization")
##D lines(KM$time[1502: 2923], 1-KM$surv[1502: 2923], type="s", col="green" )
##D 
##D ###  PopulationTime plots
##D ds <- ERSPC
##D par(mfrow=c(1,1),mar = c(0.01,0.01,0.1,0.1))
##D 
##D plot(c(-0.5,15.75),c(-93000,80000), col="white" )
##D set.seed(7654321)
##D 
##D OFF = 2000
##D 
##D 
##D for(i in 0:1) {
##D     t=seq(0.01,14.9,0.01)
##D     S = function(x) sum(ds$Follow.Up.Time[ds$ScrArm==i] >= x)
##D     n = unlist(lapply(t,"S"))
##D     if(i==1) yy =  c(0,n,0) + OFF
##D     if(i==0) yy =  c(0,-n,0) - OFF
##D     polygon(c(0,t,14.9),yy,col="grey80",border=NA)
##D 
##D     t.d = ds$Follow.Up.Time[ds$ScrArm==i & ds$DeadOfPrCa==1]
##D 
##D     for( j in 1:length(t.d) ) {
##D         time.index =  ceiling(t.d[j]/0.01)
##D         nn   = n[ time.index ]
##D         if(i==1) h = runif(1,0.01*nn,0.99*nn)  + OFF
##D         if(i==0) h = runif(1,-0.99*nn,-0.01*nn) - OFF
##D         points(t.d[j],h, pch=19,cex=0.25,col="red")
##D     }
##D }
##D 
##D for (t in 1:15) text(t,0,toString(t), cex=0.75)
##D text(15.25,0,"Year", cex=0.75,adj=c(0,0.5))
##D 
##D for (n in seq(0,90000,10000)) {
##D     if(n> 0 & n < 80000) text(-0.1,n+OFF,format(n,big.mark=","), cex=0.75,adj=c(1,0.5))
##D     if(n> 0) text(-0.1,-n-OFF,format(n,big.mark=","), cex=0.75,adj=c(1,0.5))
##D     segments(-0.05,  n+OFF, 0, n+OFF , lwd=0.5)
##D     segments(-0.05, -n-OFF, 0, -n-OFF, lwd=0.5 )
##D 
##D }
##D text(4, 70000+OFF,"Screening Arm of ERSPC", cex=1,adj=c(0,0.5))
##D text(4,-85000-OFF,"No-Screening Arm", cex=1,adj=c(0,0.5))
##D 
##D text(-0.75,78000+OFF,"Number of
##D Men being Followed", cex=1,adj=c(0,0.5))
##D h = 50000+OFF
##D points(9.5,h, pch=19,cex=0.25,col="red")
##D text(9.6,h,"Death from Prostate Cancer", adj=c(0,0.5))
##D 
##D #The randomization of the Finnish cohorts were carried out on January 1 of
##D #each of the 4 years 1996 to 1999. This, coupled with the uniform December 31
##D #2006 censoring date, lead to large numbers of men with exactly 11, 10, 9 or 8
##D #years of follow-up.
##D 
##D #Tracked backwards in time (i.e. from right to left) , the PopulationTime
##D #plot shows the recruitment pattern from its beginning in 1991, and in
##D #particular the Jan 1 entries in successive years.
##D 
##D #Tracked forwards in time (i.e. from left to right), the plot for the first
##D #three years shows attrition due entirely to death (mainly from other causes).
##D #Since the Swedish and Belgian centres were the last to close their
##D #recruitment - in December 2003 - the minimum potential follow-up is three
##D #years. Tracked further forwards in time (i.e. after year 3) the attrition is
##D #a combination of deaths and staggered entries.
## End(Not run)






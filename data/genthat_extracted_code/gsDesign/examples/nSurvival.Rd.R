library(gsDesign)


### Name: nSurvival
### Title: 3.4: Time-to-event sample size calculation (Lachin-Foulkes)
### Aliases: nSurvival nEvents zn2hr hrn2z hrz2n print.nSurvival 'Survival
###   sample size'
### Keywords: design

### ** Examples


# consider a trial with 
# 2 year maximum follow-up
# 6 month uniform enrollment
# Treatment/placebo hazards = 0.1/0.2 per 1 person-year
# drop out hazard 0.1 per 1 person-year
# alpha = 0.025 (1-sided)
# power = 0.9 (default beta=.1)

ss <- nSurvival(lambda1=.2 , lambda2=.1, eta = .1, Ts = 2, Tr = .5,
                sided=1, alpha=.025)

#  group sequential translation with default bounds
#  note that delta1 is log hazard ratio; used later in gsBoundSummary summary
	x<-gsDesign(k = 5, test.type = 2, n.fix=ss$nEvents, nFixSurv=ss$n, 
      delta1=log(ss$lambda2/ss$lambda1))
# boundary plot
	plot(x)
# effect size plot
	plot(x, plottype = "hr")
# total sample size
   x$nSurv
# number of events at analyses
   x$n.I
# print the design
x
# overall design summary
cat(summary(x))
# tabular summary of bounds
gsBoundSummary(x,deltaname="HR",Nname="Events",logdelta=TRUE)



# approximate number of events required using Schoenfeld's method
# for 2 different hazard ratios
nEvents(hr=c(.5, .6), tbl=TRUE)
# vector output
nEvents(hr=c(.5, .6))

# approximate power using Schoenfeld's method
# given 2 sample sizes and hr=.6
nEvents(hr=.6, n=c(50, 100), tbl=TRUE)
# vector output
nEvents(hr=.6, n=c(50, 100))

# approximate hazard ratio corresponding to 100 events and z-statistic of 2
zn2hr(n=100,z=2)
# same when hr0 is 1.1
zn2hr(n=100,z=2,hr0=1.1)
# same when hr0 is .9 and hr1 is greater than hr0
zn2hr(n=100,z=2,hr0=.9,hr1=1)

# approximate number of events corresponding to z-statistic of 2 and 
# estimated hazard ratio of .5 (or 2)
hrz2n(hr=.5,z=2)
hrz2n(hr=2,z=2)

# approximate z statistic corresponding to 75 events
# and estimated hazard ratio of .6 (or 1/.6)
# assuming 2-to-1 randomization of experimental to control
hrn2z(hr=.6,n=75,ratio=2)
hrn2z(hr=1/.6,n=75,ratio=2)




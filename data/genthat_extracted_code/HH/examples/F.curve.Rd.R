library(HH)


### Name: F.curve
### Title: plot a chisquare or a F-curve.
### Aliases: chisq.curve chisq.observed chisq.setup F.curve F.observed
###   F.setup
### Keywords: aplot hplot distribution

### ** Examples

old.omd <- par(omd=c(.05,.88, .05,1))
chisq.setup(df=12)
chisq.curve(df=12, col='blue')
chisq.observed(22, df=12)
par(old.omd)

old.omd <- par(omd=c(.05,.88, .05,1))
chisq.setup(df=12)
chisq.curve(df=12, col='blue', alpha=c(.05, .05))
par(old.omd)

old.omd <- par(omd=c(.05,.88, .05,1))
F.setup(df1=5, df2=30)
F.curve(df1=5, df2=30, col='blue')
F.observed(3, df1=5, df2=30)
par(old.omd)

old.omd <- par(omd=c(.05,.88, .05,1))
F.setup(df1=5, df2=30)
F.curve(df1=5, df2=30, col='blue', alpha=c(.05, .05))
par(old.omd)





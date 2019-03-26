library(gmeta)


### Name: plot.gmeta
### Title: Plot For Model-Based and 2x2 Table-Based Meta-Analysis Result
### Aliases: plot.gmeta plot.gmeta.m plot.gmeta.e
### Keywords: meta-analysis

### ** Examples

#### gmeta: generalized meta-analysis approach ####

data(ulcer)
ulcer.o <- as.matrix(ulcer)

# impute 0.5
ulcer <- ifelse(ulcer.o == 0, 0.5, ulcer.o)
# summary statistics 
ulcer.theta <- log( (ulcer[,1]*ulcer[,4]) / (ulcer[,2]*ulcer[,3]) ) 
ulcer.sigma <- sqrt(1/ulcer[,1] + 1/ulcer[,2] + 1/ulcer[,3] + 1/ulcer[,4]) 
ulcer.pivots = data.frame(mns=ulcer.theta, sds=ulcer.sigma)

# fixed-effect model
gmo.mdlfx <- gmeta(ulcer.pivots, method='fixed-mle', gmo.xgrid=seq(from=-10,to=10,by=0.01))
summary(gmo.mdlfx)

# random-effects model, method of moments
gmo.mdlrm <- gmeta(ulcer.pivots, method='random-tau2', weight=rep(1,41), tau2=2, 
	gmo.xgrid=seq(from=-10,to=10,by=0.01)) 
summary(gmo.mdlrm)

# Forest plot of CDs
plot(gmo.mdlrm, studies=c(4,8,15,16,23,41)) # default: confidence-distribution-density
plot(gmo.mdlrm, studies=c(4,8,15,16,23,41), plot.option='cv') # using confidence-curve

# 2x2 table-based meta-analysis 
ulcer.2x2 <- cbind(ulcer[,1], ulcer[,1]+ulcer[,2], ulcer[,3], ulcer[,3]+ulcer[,4])
# Mantel-Haenszel odd-ratio
gmo.2x2MH <- gmeta(ulcer.2x2, gmi.type='2x2', method='MH', gmo.xgrid=seq(-5,5,by=0.001))
summary(gmo.2x2MH)
plot(gmo.2x2MH, studies=c(4,8,15,16,23,41))

# Peto's log-odds-ratio
gmo.2x2Pt <- gmeta(ulcer.2x2, gmi.type='2x2', method='Peto', gmo.xgrid=seq(-5,5,by=0.001))
summary(gmo.2x2Pt)
plot(gmo.2x2Pt, studies=c(4,8,15,16,23,41))

# Exact meta-analysis on log-odds-ratio based on Liu et al (2012) 
ulcer.exact <- cbind(ulcer.o[,1], ulcer.o[,1]+ulcer.o[,2], ulcer.o[,3], ulcer.o[,3]+ulcer.o[,4])
#gmo.exact1 <- gmeta(ulcer.exact, gmi.type='2x2', method='exact1',
#	gmo.xgrid=seq(-5,5,by=0.001), report.error=TRUE) 
#summary(gmo.exact1)
#plot(gmo.exact1, studies=c(4,8,15,16,23,41))

# Exact meta-analysis on risk difference based on Tian et al (2009)
#gmo.exact2 <- gmeta(ulcer.exact, gmi.type='2x2', method='exact2', 
#	gmo.xgrid=seq(-1,1,by=0.001), report.error=TRUE) 
#summary(gmo.exact2)
#plot(gmo.exact2, studies=c(4,8,15,16,23,41), plot.option='cv')




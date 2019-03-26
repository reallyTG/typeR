library(IPMpack)


### Name: sampleIPM
### Title: Builds list of IPMs or P matrices from list growth, survival,
###   fecundity and discreteTrans objects. It is helpful when building
###   multiple IPMs for study of parameter uncertainty or stochastic
###   dynamics.
### Aliases: sampleIPM '.makeListPmatrix '

### ** Examples

# ===========================================================================
# Sample Vital Rate Objects
	# Parametric bootstrap sample for a growth object 
		dff <- generateData(type='discrete')
		gr1 <- makeGrowthObj(dff)
		gr1List=sampleVitalRateObj(gr1,nSamp=9)

	# Parametric bootstrap sample for a survival object 
		sv1 <- makeSurvObj(dff)
		sv1List=sampleVitalRateObj(sv1,nSamp=9)

	# Parametric bootstrap sample for a fecundity object 
		fv1 <- makeFecObj(dff)
		fv1List=sampleVitalRateObj(
			fv1,nSamp=9,
			nDiscreteOffspringTransitions =100,
			nOffspring=100)

	# Parametric bootstrap sample for a discrete transition object 
		dt1 <- makeDiscreteTrans(dff)
		dt1List=sampleVitalRateObj(
			dt1,nSamp=9,
			nDiscreteGrowthTransitions=100)
# ===========================================================================
	# Make a list of growth/survival (P) matrices (omitting fecundity)
		Pmatrixlist=sampleIPM(
			growObjList=gr1List,
			survObjList=sv1List,
			fecObjList =NULL,
			nBigMatrix = 20, minSize = -5, maxSize = 20)
		# plot results
		par(mfrow=c(3,3))
		lapply(Pmatrixlist,image)

	# Combine the list of fecundity objects with a single survival 
	# and growth object in a list of IPMs to look at just the impact 
	# of uncertainty in fecundity parameter estimates on population growth rate
		IPMlist2=sampleIPM(
			growObjList=list(gr1),
			survObjList=list(sv1),
			fecObjList =fv1List,
			discreteTransList=list(dt1), 
			nBigMatrix = 20, minSize = -5, maxSize = 20)
		# plot results
		lapply(IPMlist2,image) 

	# Combine the lists of all vital rate objects in a list of IPMs to 
	# look at the impact of uncertainty in all parameters on 
	# population growth rate
		IPMlist3=sampleIPM(
			growObjList=gr1List,
			survObjList=sv1List,
			fecObjList =fv1List,
			discreteTransList=list(dt1),
			nBigMatrix = 20, minSize = -5, maxSize = 20)
		# plot results
		lapply(IPMlist3,image) 

# ===========================================================================
# Summarize the outputs	
	# Get uncertainty in passage time from the list of growth/survival matrices
		IPMout1=sampleIPMOutput(PMatrixList=Pmatrixlist)
		qLE=apply(IPMout1[['LE']],2,quantile,probs=c(.025,.5,.975))
		plot(IPMout1$meshpoints,qLE[2,],type='l',ylim=c(0,max(qLE)))
		lines(IPMout1$meshpoints,qLE[1,],type='l',lty=3)
		lines(IPMout1$meshpoints,qLE[3,],type='l',lty=3)

	# Get uncertainty in lambda from the list of IPMs where only fecundity 
	# varied
		IPMout2=sampleIPMOutput(IPMList=IPMlist2)
		qlambda=quantile(IPMout2[['lambda']],probs=c(.025,.5,.975))
		boxplot(IPMout2[['lambda']])
	
	# Get uncertainty in lambda and passage time from size 5 
	# to a series of size from the list of IPMs where all vital rates varied
		IPMout3=sampleIPMOutput(
			IPMList=IPMlist3,
			passageTimeTargetSize=c(10),
			sizeToAgeStartSize=c(5),
			sizeToAgeTargetSize=c(6,7,8,9,10))
		qlambda=quantile(IPMout3[['lambda']],probs=c(.025,.5,.975))
		boxplot(IPMout3[['resAge']])




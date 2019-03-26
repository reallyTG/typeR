library(geiger)


### Name: fitContinuous
### Title: model fitting for continuous comparative data
### Aliases: fitContinuous
### Keywords: arith models

### ** Examples


geo=get(data(geospiza))

tmp=treedata(geo$phy, geo$dat)
phy=tmp$phy
dat=tmp$data

#---- STORE RESULTS
brownFit <-  fitContinuous(phy, dat[,"wingL"], SE=NA, control=list(niter=50), ncores=2)

#---- PRINT RESULTS
print(names(brownFit))
print(brownFit)

## No test: 
#---- COMPUTE LIKELIHOOD
flik=brownFit$lik
print(argn(flik))

#---- CREATE a FUNCTION to COMPARE MODELS
fitGeospiza=function(trait=c("wingL","tarsusL","culmenL","beakD","gonysW")){

	trait=match.arg(trait, c("wingL","tarsusL","culmenL","beakD","gonysW"))

	# define set of models to compare
	models=c("BM", "OU", "EB", "white")
	summaries=c("diffusion", "Ornstein-Uhlenbeck", "early burst", "white noise")

	## ESTIMATING measurement error ##
	aic.se=numeric(length(models))
	lnl.se=numeric(length(models))

	for(m in 1:length(models)){
		cat("\n\n\n\n\t*** ", paste(toupper(summaries[m]),": fitting ", sep=""), models[m],
			" with SE *** \n", sep="")
		tmp=fitContinuous(phy,dat[,trait],SE=NA, model=models[m],
                                    bounds=list(SE=c(0,0.5)), ncores=2)
		print(tmp)
		aic.se[m]=tmp$opt$aicc
		lnl.se[m]=tmp$opt$lnL
	}


	## ASSUMING no measurement error ##
	aic=numeric(length(models))
	lnl=numeric(length(models))

	for(m in 1:length(models)){
		cat("\n\n\n\n\t*** ", paste(toupper(summaries[m]),": fitting ", sep=""), models[m],
			 " *** \n", sep="")
		tmp=fitContinuous(phy,dat[,trait],SE=0,model=models[m], ncores=2)
		print(tmp)
		aic[m]=tmp$opt$aicc
		lnl[m]=tmp$opt$lnL
	}

	## COMPARE AIC ##
	names(aic.se)<-names(lnl.se)<-names(aic)<-names(lnl)<-models
	delta_aic<-function(x) x-x[which(x==min(x))]

	# no measurement error
	daic=delta_aic(aic)
	cat("\n\n\n\t\t\t\t*** MODEL COMPARISON: ",trait," *** \n",sep="")
	cat("\tdelta-AIC values for models assuming no measurement error
    \t\t\t\t zero indicates the best model\n\n")
	print(daic, digits=2)

		# measurement error
	daic.se=delta_aic(aic.se)
	cat("\n\n\n\n\t\t\t\t*** MODEL COMPARISON: ",trait," ***\n",sep="")
	cat("\t\t   delta-AIC values for models estimating SE
    \t\t\t\t zero indicates the best model\n\n")
	print(daic.se, digits=2)
	cat("\n\n\n")

	res_aicc=rbind(aic, aic.se, daic, daic.se)
	rownames(res_aicc)=c("AICc","AICc_SE","dAICc", "dAICc_SE")

	return(res_aicc)
}

#---- COMPARE MODELS for WING LENGTH
res=fitGeospiza("wingL")
print(res)
## End(No test)




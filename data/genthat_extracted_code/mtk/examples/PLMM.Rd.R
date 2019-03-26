library(mtk)


### Name: PLMM
### Title: The 'PLMM' method for sensitivity analysis
### Aliases: plmm PLMM

### ** Examples


## Sensitivity analysis of the "Ishigami" model with the "PLMM" method 

#	Generates the factors
		data(Ishigami.factors)
		
# 	Builds the processes and workflow:

#   1) the experimental design process with the method "BasicMonteCarlo".
    exp1.designer  <- mtkNativeDesigner("BasicMonteCarlo", information=list(size=100))

#   2) the simulation process
		exp1.evaluator <- mtkNativeEvaluator(model="Ishigami") 

#   3) the analysis process 
		exp1.analyser <- mtkNativeAnalyser("PLMM", information = list(degree.pol=3,numY=1))

#   4) the workflow

		exp1 <- mtkExpWorkflow(expFactors=Ishigami.factors,
				 processesVector = c(design=exp1.designer,
		             				 evaluate=exp1.evaluator, 
		             				 analyze=exp1.analyser)
		             				 )

# 	Runs the workflow and reports the results.
		run(exp1)
		summary(exp1)
		summary(getProcess(exp1,name="analyze"), lang="fr")
		summary(getProcess(exp1,name="analyze"), lang="fr",
				 which="full", all=FALSE, digit=4)
		extractData(exp1,name="analyze")$best$call
		plot(getProcess(exp1,name="analysis"), lang="fr", legend.loc="topleft")
		plot(getProcess(exp1,name="analysis"), which="full",
			 all=FALSE, legend.loc="topright")
    
## 	Example II:  comparing metamodels of the WWDM model

#	Generates the factors
		data(WWDM.factors)
		
# 1) to create a sampler with the Monte-Carlo method

		sampler <- mtkNativeDesigner("BasicMonteCarlo", information = list(size=100) )

# 2) to create a simulator with the WWDM model 
		model <- mtkNativeEvaluator("WWDM" , information = list(year=3))

# 3) to create a partial workflow (design and evaluation)

		experience1 <- mtkExpWorkflow(expFactors=WWDM.factors, 
			processesVector=c(design=sampler, evaluate=model) )
		run(experience1)

# 4) to create an "analysor" with the Regression method 

		analyser1 <- mtkNativeAnalyser("Regression", information=list(nboot=20) )

# to add to the workflow the analyser "Regression"


		addProcess(experience1, p = analyser1, name = "analyze")
		run(experience1)

# 4bis) to create new analysers PLMM  and to add them to the workflow 

		experience2 <- experience1

		analyser2 <- mtkNativeAnalyser("PLMM")

		setProcess(experience2, p = analyser2, name = "analyze")
		run(experience2) ;

##	to comment out the following lines 	to compare others analysers 
## 	with 'analyser1' and 'analyser2'
#		experience4 <- experience3 <- experience2
#		analyser3 <- mtkNativeAnalyser("PLMM", information = list(degree.pol = 3))
#		analyser4 <- mtkNativeAnalyser("PLMM", 
#					information = list(degree.pol = 3, rawX = TRUE))
#		setProcess(experience3, p = analyser3, name = "analyze")
#		setProcess(experience4, p = analyser4, name = "analyze")	
#		run(experience3) ; run(experience4)

		summary(getProcess(experience1,name="analyze"))
  	    summary(getProcess(experience2,name="analyze"))
#		summary(getProcess(experience3,name="analyze"))
#		summary(getProcess(experience4,name="analyze"), digi=3)





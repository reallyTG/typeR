library(mtk)


### Name: WWDM
### Title: The 'WWDM' model
### Aliases: WWDM

### ** Examples

## Evaluation of the "WWDM" model

#	Example I: by using the class constructors: mtkWWDMEvaluator()

#	Generate the factors
		data(WWDM.factors)
		
# Build the workflow:
#   1) specify the design process
	designer <- mtkNativeDesigner("BasicMonteCarlo", information = list(size=50)  )

#   2) specify the evaluation process; 
	model <- mtkWWDMEvaluator(listParameters = list(year=3) )
  
#   3) specify the workflow with the processes defined previously

	exp <- mtkExpWorkflow( expFactors=WWDM.factors,
		    processesVector=c( design=designer, evaluate=model) )
# Run the workflow and report the results.
  run(exp)
  summary(exp)
  
# Personnalize the data reporting

  designData <-  extractData(exp,name="design")
  
  simulationData <- extractData(exp,name="evaluate")

  plot(designData$Eb, simulationData$Biomass, xlab="Eb",ylab="Biomass")
	
## Example II: by using the class constructor: mtkNativeEvaluator()

# Generate the input factors
	data(WWDM.factors)

# Build the workflow:
#   1) specify the design process
	designer <- mtkNativeDesigner("BasicMonteCarlo", information = list(size=20)  )

#   2) specify the evaluation process; 
	model <- mtkNativeEvaluator(model="WWDM", information=list(year=3)  )
  
#   3) specify the workflow with the processes defined previously

	exp <- mtkExpWorkflow(expFactors=WWDM.factors,
		    processesVector=c( design=designer, evaluate=model) )
        
# Run the workflow and report the results.
  run(exp)
  summary(exp)
  plot(exp)





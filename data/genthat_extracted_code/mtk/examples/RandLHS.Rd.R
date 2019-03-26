library(mtk)


### Name: RandLHS
### Title: The 'RandLHS' Method
### Aliases: RandLHS

### ** Examples

# uses the RandLHS method 
## Random Latin Hypercude draws for the "Ishigami" model 

#  Example I: by using the class constructors: mtkRandLHSDesigner()

#	Generate the factors
		data(Ishigami.factors)
		
# 	Build the processes and workflow:

#   1) the design process
		exp1.designer <- mtkRandLHSDesigner( listParameters = list(size=10) ) 
    
#   2) the workflow

  	exp1 <- mtkExpWorkflow(expFactors=Ishigami.factors,
	    processesVector = c(design=exp1.designer) )

# 	Run the workflow and reports the results.
    run(exp1)
    print(exp1)
    plot(exp1)




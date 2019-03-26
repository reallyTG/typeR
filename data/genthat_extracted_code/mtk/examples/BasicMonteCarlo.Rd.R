library(mtk)


### Name: BasicMonteCarlo
### Title: The 'BasicMonteCarlo' design method
### Aliases: BasicMonteCarlo

### ** Examples


## Experiments design with the "Basic Monte-Carlo" method for the "Ishigami" model

#	Example I: by using the class constructors: mtkBasicMonteCarloDesigner()

# 	1) Create a designer process based on the Basic Monte-Carlo method 
		MCdesign <- mtkBasicMonteCarloDesigner(listParameters = list(size=20))

# 	2) Import the input factors of the "Ishigami" model
		data(Ishigami.factors)

# 	3) Build and run the  workflow 
		exp1 <- mtkExpWorkflow(expFactors = Ishigami.factors,
	               processesVector = c(design=MCdesign)) 
		run(exp1)

# 	4) Report and plot the design
    		show(exp1)
    		plot(exp1)	
	
#	Example II: by using the class constructors: mtkNativeDesigner()

# 	1) Create a designer process based on the Basic Monte-Carlo method 
		MCdesign <- mtkNativeDesigner("BasicMonteCarlo", information = list(size=20))

# 	2) Import the input factors of the "Ishigami" model
		data(Ishigami.factors)

# 	3) Build and run the  workflow 
		exp1 <- mtkExpWorkflow(expFactors = Ishigami.factors,
	               processesVector = c(design=MCdesign)) 
		run(exp1)

# 	4) Print and plot the design
		print(exp1)
		plot(exp1)	




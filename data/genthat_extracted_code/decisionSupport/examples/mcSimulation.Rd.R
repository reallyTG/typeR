library(decisionSupport)


### Name: mcSimulation
### Title: Perform a Monte Carlo simulation.
### Aliases: mcSimulation

### ** Examples

 #############################################################
 # Example 1 (Creating the estimate from the command line):
 #############################################################
 # Create the estimate object:
 variable=c("revenue","costs")
 distribution=c("norm","norm")
 lower=c(10000,  5000)
 upper=c(100000, 50000)
 costBenefitEstimate<-as.estimate(variable, distribution, lower, upper)
 # (a) Define the model function without name for the return value:
 profit1<-function(x){
   x$revenue-x$costs
 }
 # Perform the Monte Carlo simulation:
 predictionProfit1<-mcSimulation( estimate=costBenefitEstimate, 
                                 model_function=profit1, 
                                 numberOfModelRuns=10000,
                                 functionSyntax="data.frameNames")
 # Show the simulation results:
 print(summary(predictionProfit1))
 hist(predictionProfit1,xlab="Profit")
 #############################################################
 # (b) Define the model function with a name for the return value:
 profit1<-function(x){
   list(Profit=x$revenue-x$costs)
 } 
 # Perform the Monte Carlo simulation:
 predictionProfit1<-mcSimulation( estimate=costBenefitEstimate, 
                                 model_function=profit1, 
                                 numberOfModelRuns=10000,
                                 functionSyntax="data.frameNames")
 # Show the simulation results:
 print(summary(predictionProfit1, classicView=TRUE))
 hist(predictionProfit1) 
 #########################################################
 # (c) Using plain names in the model function syntax
 profit1<-function(){
   list(Profit=revenue-costs)
 } 
 # Perform the Monte Carlo simulation:
 predictionProfit1<-mcSimulation( estimate=costBenefitEstimate, 
                                 model_function=profit1, 
                                 numberOfModelRuns=1000,
                                 functionSyntax="plainNames")
 # Show the simulation results:
 print(summary(predictionProfit1, probs=c(0.05,0.50,0.95)))
 hist(predictionProfit1) 
 #########################################################
 # (d) Using plain names in the model function syntax and
 #     define the model function without name for the return value:
 profit1<-function() revenue-costs
 # Perform the Monte Carlo simulation:
 predictionProfit1<-mcSimulation( estimate=costBenefitEstimate,
                                  model_function=profit1,
                                  numberOfModelRuns=1000,
                                  functionSyntax="plainNames")
 # Show the simulation results:
 print(summary(predictionProfit1, probs=c(0.05,0.50,0.95)))
 hist(predictionProfit1, xlab="Profit")
 #############################################################
 # Example 2(Reading the estimate from file):
 #############################################################
 # Define the model function:
 profit2<-function(x){
   Profit<-x[["sales"]]*(x[["productprice"]] - x[["costprice"]])
   list(Profit=Profit)
 }  
 # Read the estimate of sales, productprice and costprice from file:
 inputFileName=system.file("extdata","profit-4.csv",package="decisionSupport")
 parameterEstimate<-estimate_read_csv(fileName=inputFileName)
 print(parameterEstimate)
 # Perform the Monte Carlo simulation:
 predictionProfit2<-mcSimulation( estimate=parameterEstimate, 
                                 model_function=profit2, 
                                 numberOfModelRuns=10000,
                                 functionSyntax="data.frameNames")
 # Show the simulation results:
 print(summary(predictionProfit2))
 hist(predictionProfit2) 




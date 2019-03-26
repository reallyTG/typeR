library(decisionSupport)


### Name: welfareDecisionAnalysis
### Title: Analysis of the underlying welfare based decision problem.
### Aliases: welfareDecisionAnalysis

### ** Examples

#############################################################
# Example 1 (Creating the estimate from the command line):
#############################################################
# Create the estimate object:
variable=c("revenue","costs")
distribution=c("posnorm","posnorm")
lower=c(10000,  5000)
upper=c(100000, 50000)
costBenefitEstimate<-as.estimate(variable, distribution, lower, upper)
# (a) Define the welfare function without name for the return value:
profit<-function(x){
 x$revenue-x$costs
}
# Perform the decision analysis:
myAnalysis<-welfareDecisionAnalysis(estimate=costBenefitEstimate, 
                                    welfare=profit, 
                                    numberOfModelRuns=100000,
                                    functionSyntax="data.frameNames")
# Show the analysis results:
print(summary((myAnalysis)))
#############################################################
# (b) Define the welfare function with a name for the return value:
profit<-function(x){
 list(Profit=x$revenue-x$costs)
}
# Perform the decision analysis:
myAnalysis<-welfareDecisionAnalysis(estimate=costBenefitEstimate, 
                                    welfare=profit, 
                                    numberOfModelRuns=100000,
                                    functionSyntax="data.frameNames")
# Show the analysis results:
print(summary((myAnalysis)))
#############################################################
# (c) Two decsion variables:
welfareModel<-function(x){
 list(Profit=x$revenue-x$costs,
   Costs=-x$costs)
}
# Perform the decision analysis:
myAnalysis<-welfareDecisionAnalysis(estimate=costBenefitEstimate, 
                                    welfare=welfareModel, 
                                    numberOfModelRuns=100000,
                                    functionSyntax="data.frameNames")
# Show the analysis results:
print(summary((myAnalysis)))




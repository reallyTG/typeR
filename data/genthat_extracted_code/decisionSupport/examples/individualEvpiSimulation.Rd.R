library(decisionSupport)


### Name: individualEvpiSimulation
### Title: Individual Expected Value of Perfect Information Simulation
### Aliases: individualEvpiSimulation

### ** Examples

# Number of running the underlying welfare model:
n=10000
# Create the current estimate from text:
estimateText<-"variable,  distribution, lower, upper
               revenue1,  posnorm,      100,   1000
               revenue2,  posnorm,      50,    2000
               costs1,    posnorm,      50,    2000
               costs2,    posnorm,      100,   1000"
currentEstimate<-as.estimate(read.csv(header=TRUE, text=estimateText, 
                          strip.white=TRUE, stringsAsFactors=FALSE))
# The welfare function:
profitModel <- function(x){
 list(Profit=x$revenue1 + x$revenue2 - x$costs1 - x$costs2)
}
# Calculate the Individual EVPI:
individualEvpiResult<-individualEvpiSimulation(welfare=profitModel,
                                               currentEstimate=currentEstimate,
                                               numberOfModelRuns=n,
                                               functionSyntax="data.frameNames")
# Show the simulation results:
print(sort(summary(individualEvpiResult)),decreasing=TRUE,along="Profit")
hist(individualEvpiResult, breaks=100)




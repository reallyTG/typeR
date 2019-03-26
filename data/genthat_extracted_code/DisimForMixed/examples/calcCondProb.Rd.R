library(DisimForMixed)


### Name: calcCondProb
### Title: Calculate Conditional Probabilities.
### Aliases: calcCondProb

### ** Examples

QualiVars <- data.frame(Qlvar1 = c("A","B","A","C"), Qlvar2 = c("Q","Q","R","Q"))
CalcForQuali <- calcCondProb(QualiVars)
QuantVars <- data.frame(Qnvar1 = c(1.5,3.2,4.9,5), Qnvar2 = c(4.8,2,1.1,5.8))
Discretized <- discretizeQuant(QuantVars)
CalcForQuant <- calcCondProb(Discretized)
AllQualQuant <- data.frame(QualiVars, Discretized)
CalcForAll <- calcCondProb(AllQualQuant)




library(DisimForMixed)


### Name: signifOfQuantVars
### Title: Calculate Significance of Quantitative Attributes.
### Aliases: signifOfQuantVars

### ** Examples

QualiVars <- data.frame(Qlvar1 = c("A","B","A","C"), Qlvar2 = c("Q","Q","R","Q"))
QuantVars <- data.frame(Qnvar1 = c(1.5,3.2,4.9,5), Qnvar2 = c(4.8,2,1.1,5.8))
SigOfQuant <- signifOfQuantVars(QualiVars, QuantVars)




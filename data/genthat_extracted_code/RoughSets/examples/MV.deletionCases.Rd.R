library(RoughSets)


### Name: MV.deletionCases
### Title: Missing value completion by deleting instances
### Aliases: MV.deletionCases

### ** Examples

#############################################
## Example : Deletion Cases
#############################################
dt.ex1 <- data.frame(
     c("high", "very_high", NA, "high", "high", "normal", "normal", NA),
     c(NA, "yes", "no", "yes", NA, "yes", "no", "yes"),
     c("no", "yes", "no", "yes", "yes", "no", "yes", NA),
     c("yes", "yes", "no", "yes", "no", "no", "no", "yes"))
colnames(dt.ex1) <- c("Temp", "Headache", "Nausea", "Flu")
decision.table <- SF.asDecisionTable(dataset = dt.ex1, decision.attr = 4,
                                    indx.nominal = c(1:4))
indx = MV.deletionCases(decision.table)




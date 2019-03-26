library(RoughSets)


### Name: MV.missingValueCompletion
### Title: Wrapper function of missing value completion
### Aliases: MV.missingValueCompletion

### ** Examples

#############################################
## Example :
#############################################
dt.ex1 <- data.frame(
     c(100.2, 102.6, NA, 99.6, 99.8, 96.4, 96.6, NA),
     c(NA, "yes", "no", "yes", NA, "yes", "no", "yes"),
     c("no", "yes", "no", "yes", "yes", "no", "yes", NA),
     c("yes", "yes", "no", "yes", "no", "no", "no", "yes"))
colnames(dt.ex1) <- c("Temp", "Headache", "Nausea", "Flu")
decision.table <- SF.asDecisionTable(dataset = dt.ex1, decision.attr = 4,
                                    indx.nominal = c(2:4))
indx = MV.missingValueCompletion(decision.table, type.method = "deletionCases")

## generate new decision table
new.decTable <- SF.applyDecTable(decision.table, indx)




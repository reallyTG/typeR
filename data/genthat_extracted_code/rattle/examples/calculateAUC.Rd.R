library(rattle)


### Name: calculateAUC
### Title: Determine area under a curve (e.g. a risk or recall curve) of a
###   risk chart
### Aliases: calculateAUC
### Keywords: hplot

### ** Examples

## this is usually used in the context of the evaluateRisk function
## Not run: ev <- evaluateRisk(predicted, actual, risk)

## imitate this output here
ev <- data.frame(Caseload=c(1.0, 0.8, 0.6, 0.4, 0.2, 0),
                 Precision=c(0.15, 0.18, 0.21, 0.25, 0.28, 0.30),
                 Recall=c(1.0, 0.95, 0.80, 0.75, 0.5, 0.0),
                 Risk=c(1.0, 0.98, 0.90, 0.77, 0.30, 0.0))

## Calculate the areas unde the Risk and the Recall curves.
calculateAUC(ev$Caseload, ev$Risk)
calculateAUC(ev$Caseload, ev$Recall)





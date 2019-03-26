library(rattle)


### Name: plotRisk
### Title: Plot a risk chart
### Aliases: plotRisk
### Keywords: hplot

### ** Examples

## this is usually used in the context of the evaluateRisk function
## Not run: ev <- evaluateRisk(predicted, actual, risk)

## imitate this output here
ev <- NULL
ev$Caseload  <- c(1.0, 0.8, 0.6, 0.4, 0.2, 0)
ev$Precision <- c(0.15, 0.18, 0.21, 0.25, 0.28, 0.30)
ev$Recall    <- c(1.0, 0.95, 0.80, 0.75, 0.5, 0.0)
ev$Risk      <- c(1.0, 0.98, 0.90, 0.77, 0.30, 0.0)

## plot the Risk Chart
plotRisk(ev$Caseload, ev$Precision, ev$Recall, ev$Risk,
         chosen=60, chosen.label="Pr=0.45")

## Add a title
eval(parse(text=genPlotTitleCmd("Sample Risk Chart")))




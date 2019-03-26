library(mada)


### Name: forest
### Title: Forest plot for univariate measures
### Aliases: forest forestmada forest.madad forest.madauni
### Keywords: hplot

### ** Examples

data(AuditC)

## Forest plot of log DOR with random effects summary estimate
forest(madauni(AuditC))

## Forest plot of negative likelihood ratio (no log transformation)
## color of the polygon: light grey 
## draw the individual estimate as filled circles
forest(madauni(AuditC, type = "negLR"), 
       log = FALSE, polycol = "lightgrey", pch = 19)

## Paired forest plot of sensitivities and specificities
## Might look ugly if device region is too small
old.par <- par()
AuditC.d <- madad(AuditC)

plot.new()
par(fig = c(0, 0.5, 0, 1), new = TRUE)
forest(AuditC.d, type = "sens", xlab = "Sensitivity")
par(fig = c(0.5, 1, 0, 1),  new = TRUE)
forest(AuditC.d, type = "spec", xlab = "Specificity")

par(old.par)

## Including study names
## Using Letters as dummies
forest(AuditC.d, type = "spec",  xlab = "Specificity",
      snames = LETTERS[1:14])





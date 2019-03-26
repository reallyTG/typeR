library(Rcapture)


### Name: closedp.Mtb
### Title: Closed Population Capture-Recapture Model Mtb
### Aliases: closedp.Mtb print.closedp.Mtb
### Keywords: models

### ** Examples

data(hare)
closedp.Mtb(hare)

## Example producing an unstable estimate
data(mvole)
period4 <- mvole[, 16:20]
closedp.Mtb(period4)




library(sjPlot)


### Name: sjp.stackfrq
### Title: Plot stacked proportional bars
### Aliases: sjp.stackfrq

### ** Examples

# Data from the EUROFAMCARE sample dataset
library(sjmisc)
data(efc)
# recveive first item of COPE-index scale
start <- which(colnames(efc) == "c82cop1")
# recveive first item of COPE-index scale
end <- which(colnames(efc) == "c90cop9")
# auto-detection of labels
sjp.stackfrq(efc[, start:end])






library(Renext)


### Name: RLpar
### Title: Graphical parameters for Return Level plots
### Aliases: RLpar

### ** Examples

## change color for quantile curve and type for confidence
## limits #1 (with largest confidence level).
newRLpar <- RLpar(quant.col = "red", conf.conf1.lty = "dashed")
newRLpar$quant

## show the names of all possible editable parameters
names(unlist(RLpar()))







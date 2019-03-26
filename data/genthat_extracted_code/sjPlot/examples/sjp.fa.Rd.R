library(sjPlot)


### Name: sjp.fa
### Title: Plot FA results
### Aliases: sjp.fa

### ** Examples

library(GPArotation)
data(efc)
# recveive first item of COPE-index scale
start <- which(colnames(efc) == "c82cop1")
# recveive last item of COPE-index scale
end <- which(colnames(efc) == "c90cop9")

# use data frame as argument, let sjp.fa() compute FA
sjp.fa(efc[, start:end])
sjp.fa(efc[, start:end], type = "tile")





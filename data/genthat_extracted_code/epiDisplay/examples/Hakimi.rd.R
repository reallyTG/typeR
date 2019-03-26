library(epiDisplay)


### Name: Hakimi's data
### Title: Dataset on effect of training personnel on neonatal mortality
### Aliases: Hakimi
### Keywords: datasets

### ** Examples

data(Hakimi)
.data <- Hakimi
attach(.data)
cc(dead, treatment)
mhor(dead, treatment, malpres)
detach(.data)




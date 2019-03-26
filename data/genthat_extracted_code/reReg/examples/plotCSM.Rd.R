library(reReg)


### Name: plotCSM
### Title: Produce Cumulative Sample Mean Function Plots
### Aliases: plotCSM
### Keywords: Plots

### ** Examples

data(readmission, package = "frailtypack")
plotCSM(reSurv(t.stop, id, event, death) ~ 1, data = readmission)
plotCSM(reSurv(t.stop, id, event, death) ~ sex, data = readmission)
plotCSM(reSurv(t.stop, id, event, death) ~ sex, data = readmission, onePanel = TRUE)




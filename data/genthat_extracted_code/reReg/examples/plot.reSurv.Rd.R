library(reReg)


### Name: plot.reSurv
### Title: Produce Event Plot or Cumulative Sample Mean Function Plot
### Aliases: plot.reSurv
### Keywords: Plots

### ** Examples

data(readmission, package = "frailtypack")
reObj <- with(subset(readmission, id <= 10), reSurv(t.stop, id, event, death))

## Event plots:
## Default labels
plot(reObj)
plot(reObj, order = FALSE)
## User specified labels
plot(reObj, control = list(xlab = "User xlab", ylab = "User ylab", main = "User title"))

## With multiple hypothetical event types
set.seed(1)
reObj2 <- with(readmission, reSurv(t.stop, id, event * sample(1:3, 861, TRUE), death))
plot(reObj2)

## CSM plots
plot(reObj, CSM = TRUE)




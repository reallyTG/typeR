library(simone)


### Name: plot.simone
### Title: Graphical representation of SIMoNe outputs
### Aliases: plot.simone
### Keywords: hplot

### ** Examples

## data set and network generation
g    <- rNetwork(p=50, pi=50)
data <- rTranscriptData(300,g)
attach(data)

## running simone
res <- simone(X, type="steady-state")

## plotting the results: just the ROC curve
plot(res, output=c("ROC"), ref.graph=g$A)

## plotting the results: just the path as a function of the penalty
plot(res, output=c("path.penalty"), main="I want to put my own title")

## plotting the results: everything possible (the default)
plot(res)

detach(data)




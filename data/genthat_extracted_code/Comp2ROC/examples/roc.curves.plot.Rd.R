library(Comp2ROC)


### Name: roc.curves.plot
### Title: Plot ROC curves
### Aliases: roc.curves.plot
### Keywords: Plot ROC

### ** Examples

## No test: 
data(zhang)
moda1 = "modality1" 
moda2 = "modality2"
data = read.manually.introduced(zhang, moda1, TRUE, moda2, TRUE, "status", TRUE)

sim1.ind = unlist(data[1])
sim2.ind = unlist(data[2])  
sim1.sta = unlist(data[3])
sim2.sta = unlist(data[4])

sim1.pred = prediction(sim1.ind, sim1.sta)
sim2.pred = prediction(sim2.ind, sim2.sta)

sim1.curve = performance(sim1.pred, "tpr", "fpr")
sim2.curve = performance(sim2.pred, "tpr", "fpr")

roc.curves.plot(sim1.curve, sim2.curve, mod1=moda1, mod2=moda2)
## End(No test)




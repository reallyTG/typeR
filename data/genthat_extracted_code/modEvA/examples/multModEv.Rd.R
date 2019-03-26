library(modEvA)


### Name: multModEv
### Title: Multiple model evaluation
### Aliases: multModEv

### ** Examples

data(rotif.mods)

eval1 <- multModEv(models = rotif.mods$models[1:6], thresh = 0.5, 
bin.method = "n.bins", fixed.bin.size = TRUE)

head(eval1)


eval2 <- multModEv(models = rotif.mods$models[1:6], thresh = "preval", 
measures = c("AUC", "CCR", "Sensitivity", "TSS"))

head(eval2)


# you can also calculate evaluation measures for a set of 
# observed vs predicted data, rather than from model objects:

obses <- sapply(rotif.mods$models, `[[`, "y")
preds <- sapply(rotif.mods$models, `[[`, "fitted.values")

eval3 <- multModEv(obs.data = obses[ , 1:4], pred.data = preds[ , 1:4], 
thresh = "preval", bin.method = "prob.bins")

head(eval3)




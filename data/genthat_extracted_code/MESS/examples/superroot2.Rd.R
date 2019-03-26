library(MESS)


### Name: superroot2
### Title: Gene expression data from two-color dye-swap experiment
### Aliases: superroot2
### Keywords: datasets

### ** Examples


data(superroot2)
# Select one gene
g1 <- superroot2[superroot2$gene=="AT2G24000.1",]
model <- lm(log(signal) ~ plant + color + array, data=g1)
summary(model)





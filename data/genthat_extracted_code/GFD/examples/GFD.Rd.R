library(GFD)


### Name: GFD
### Title: Tests for General Factorial Designs
### Aliases: GFD

### ** Examples

GFD(weightgain ~ source * type, data = HSAUR::weightgain, nperm = 1000)

data(startup)
model <- GFD(Costs ~ company, data = startup, CI.method = "perm")
summary(model)





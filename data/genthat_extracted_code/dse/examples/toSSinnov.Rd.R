library(dse)


### Name: toSSinnov
### Title: Convert to State Space Innovations Model
### Aliases: toSSinnov
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(eg1.DSE.data.diff)
model <- toSSinnov(model)
summary(model)

model2 <- SS(F=diag(1,3), H=matrix(c(1,0,0,1,0,0),2,3),
   Q=diag(0.5, 3, 3), R=diag(1.1, 2,2),
    description="test model", output.names=c("output 1", "output 2"))
model2 <- toSSinnov(model2)
summary(model2)




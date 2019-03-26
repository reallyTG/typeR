library(OpenMx)


### Name: mxBootstrap
### Title: Repeatedly estimate model using resampling with replacement
### Aliases: mxBootstrap

### ** Examples

library(OpenMx)

data(multiData1)

manifests <- c("x1", "x2", "y")

biRegModelRaw <- mxModel(
  "Regression of y on x1 and x2",
  type="RAM",
  manifestVars=manifests,
  mxPath(from=c("x1","x2"), to="y", 
         arrows=1, 
         free=TRUE, values=.2, labels=c("b1", "b2")),
  mxPath(from=manifests, 
         arrows=2, 
         free=TRUE, values=.8, 
         labels=c("VarX1", "VarX2", "VarE")),
  mxPath(from="x1", to="x2",
         arrows=2, 
         free=TRUE, values=.2, 
         labels=c("CovX1X2")),
  mxPath(from="one", to=manifests, 
         arrows=1, free=TRUE, values=.1, 
         labels=c("MeanX1", "MeanX2", "MeanY")),
  mxData(observed=multiData1, type="raw"))

biRegModelRawOut <- mxRun(biRegModelRaw)

boot <- mxBootstrap(biRegModelRawOut, 10)   # start with 10
summary(boot)

# Looks good, now do the rest
## Not run: boot <- mxBootstrap(boot)
summary(boot)

# examine replication 3
boot3 <- mxBootstrap(boot, only=3)

print(coef(boot3))
print(boot$compute$output$raw[3,names(coef(boot3))])




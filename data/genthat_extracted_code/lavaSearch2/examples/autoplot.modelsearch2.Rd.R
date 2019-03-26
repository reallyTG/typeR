library(lavaSearch2)


### Name: autplot-modelsearch2
### Title: Display the Value of a Coefficient across the Steps.
### Aliases: autplot-modelsearch2 autoplot.modelsearch2

### ** Examples

## Not run: 
##D mSim <- lvm(Y~G+X1+X2+X3+X4+X5)
##D addvar(mSim) <- ~Z1+Z2
##D 
##D set.seed(10)
##D df.data <- lava::sim(mSim, 1e2)
##D 
##D mBase <- lvm(Y~G)
##D addvar(mBase) <- ~X1+X2+X3+X4+X5+Z1+Z2
##D e.lvm <- estimate(mBase, data = df.data)
##D res <- modelsearch2(e.lvm, method.p.adjust = "holm", alpha = 0.05)
##D autoplot(res, param = "Y~G")
##D autoplot(res, param = c("Y","Y~G"))
## End(Not run)




library(lavaSearch2)


### Name: getStep
### Title: Extract one Step From the Sequential Procedure
### Aliases: getStep getStep.modelsearch2

### ** Examples

## Not run: 
##D mSim <- lvm(Y~G+X1+X2)
##D addvar(mSim) <- ~Z1+Z2+Z3+Z4+Z5+Z6
##D df.data <- lava::sim(mSim, 1e2)
##D 
##D mBase <- lvm(Y~G)
##D addvar(mBase) <- ~X1+X2+Z1+Z2+Z3+Z4+Z5+Z6
##D e.lvm <- estimate(mBase, data = df.data)
##D res <- modelsearch2(e.lvm, method.p.adjust = "holm")
##D 
##D getStep(res)
##D getStep(res, slot = "sequenceTest")
##D getStep(res, step = 1)
## End(Not run)




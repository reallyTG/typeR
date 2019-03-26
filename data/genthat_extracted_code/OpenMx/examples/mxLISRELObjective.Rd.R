library(OpenMx)


### Name: mxLISRELObjective
### Title: Create MxLISRELObjective Object
### Aliases: mxLISRELObjective

### ** Examples

   
   #####------------------------------#####
   ##### Factor Model
   mLX <- mxMatrix("Full", values=c(.5, .6, .8, rep(0, 6), .4, .7, .5),
      name="LX", nrow=6, ncol=2,
      free=c(TRUE,TRUE,TRUE,rep(FALSE, 6),TRUE,TRUE,TRUE))
   mTD <- mxMatrix("Diag", values=c(rep(.2, 6)), name="TD", nrow=6, ncol=6,
      free=TRUE)
   mPH <- mxMatrix("Symm", values=c(1, .3, 1), name="PH", nrow=2, ncol=2,
      free=c(FALSE, TRUE, FALSE))
   
   # Create a LISREL objective with LX, TD, and PH matrix names
   objective <- mxLISRELObjective(LX="LX", TD="TD", PH="PH")
   
   testModel <- mxModel(model="testModel", mLX, mTD, mPH, objective)





library(DendroSync)


### Name: sync.plot
### Title: Plot within- and between-group synchrony
### Aliases: sync.plot

### ** Examples

## Plot homoscedastic narrow evaluation (mNE) and unstructured model (mUN)
 # synchronies for conifersIP data:
 data(conifersIP)
     
 ##Fit the homoscedastic set of varcov models (mBE, mNE, mCS, mUN)
 # using geographic grouping criteria (ie. Region)
 ModHm <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Region", 
                        data = conifersIP, homoscedastic = TRUE)
 
 sync.plot(sync(ModHm, modname = "mNE"))
 sync.plot(sync(ModHm, modname = "mUN"))






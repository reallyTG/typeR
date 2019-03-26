library(phangorn)


### Name: modelTest
### Title: ModelTest
### Aliases: modelTest AICc
### Keywords: cluster

### ** Examples


## Not run: 
##D     
##D example(NJ)
##D (mT <- modelTest(Laurasiatherian, tree))
##D 
##D # some R magic
##D env <- attr(mT, "env")
##D ls(env=env)
##D (F81 <- get("F81+G", env)) # a call  
##D eval(F81, env=env)
##D 
##D data(chloroplast)
##D (mTAA <- modelTest(chloroplast, model=c("JTT", "WAG", "LG")))
##D 
##D # test all available amino acid models
##D (mTAA_all <- modelTest(chloroplast, model="all", multicore=TRUE, mc.cores=2))
## End(Not run)





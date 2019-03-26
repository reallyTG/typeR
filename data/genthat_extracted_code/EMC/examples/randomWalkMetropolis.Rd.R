library(EMC)


### Name: randomWalkMetropolis
### Title: The Random Walk Metropolis algorithm
### Aliases: randomWalkMetropolis
### Keywords: methods

### ** Examples

## Not run: 
##D samplerObj <-
##D     with(CigarShapedFuncGenerator1(-13579),
##D          randomWalkMetropolis(nIters         = 5000,
##D                               startingVal    = c(0, 0),
##D                               logTarDensFunc = logTarDensFunc,
##D                               propNewFunc    = propNewFunc,
##D                               verboseLevel   = 1))
##D print(samplerObj)
##D print(names(samplerObj))
##D with(samplerObj,
##D  {
##D      print(detailedAcceptRatios)
##D      print(dim(draws))
##D      plot(draws,
##D           xlim = c(-3, 5),
##D           ylim = c(-3, 4),
##D           pch  = '.',
##D           ask  = FALSE,
##D           main = as.expression(paste('# draws:', nIters)),
##D           xlab = as.expression(substitute(x[xii], list(xii = 1))),
##D           ylab = as.expression(substitute(x[xii], list(xii = 2))))    
##D  })
##D 
##D 
##D samplerObj <-
##D     with(threeDimNormalFuncGenerator(-13579),
##D      {
##D          randomWalkMetropolis(nIters          = 5000,
##D                               startingVal     = c(0, 0, 0),         
##D                               logTarDensFunc  = logTarDensFunc,     
##D                               propNewFunc     = propNewFunc,        
##D                               MHBlocks        = list(c(1, 2), 3),   
##D                               verboseLevel    = 1)                  
##D      })
##D print(samplerObj)
##D print(names(samplerObj))
##D with(samplerObj,
##D  {
##D      print(detailedAcceptRatios)
##D      print(dim(draws))
##D      pairs(draws,
##D            pch    = '.',                                                    
##D            ask    = FALSE,                                                  
##D            main = as.expression(paste('# draws:', nIters)),
##D            labels = c(as.expression(substitute(x[xii], list(xii = 1))), 
##D                       as.expression(substitute(x[xii], list(xii = 2))), 
##D                       as.expression(substitute(x[xii], list(xii = 3)))))
##D  })
## End(Not run)




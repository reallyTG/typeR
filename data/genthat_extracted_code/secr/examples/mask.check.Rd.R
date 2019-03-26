library(secr)


### Name: mask.check
### Title: Mask Diagnostics
### Aliases: mask.check
### Keywords: manip

### ** Examples


## Not run: 
##D 
##D ## from a capthist object, specifying almost everything
##D mask.check (possumCH, spacings = c(20, 30), buffers =c(200, 300),
##D     realpar = list(g0 = 0.2, sigma = 50), CL = TRUE)
##D 
##D ## from a fitted model, using defaults
##D mask.check (stoat.model.HN)
##D ## LL did not change with varying buffer (rows) or spacing (cols):
##D ##         78.125  58.59375   39.0625
##D ## 1000 -144.0015 -144.0015 -144.0015
##D ## 1500 -144.0017 -144.0017 -144.0017
##D ## 2000 -144.0017 -144.0017 -144.0017
##D 
##D ## fit new models for each combination of buffer & spacing,
##D ## and save fitted models to a file
##D mask.check (stoat.model.HN, buffers = 1500, spacings =
##D     c(40,60,80), LLonly = FALSE, file = "test", CL = TRUE)
##D 
##D ## look in more detail at the preceding fits
##D ## restores objects `mask.check.output' and `mask.check.fit'
##D load("test.RData")  
##D lapply(mask.check.fit, predict)
##D lapply(mask.check.fit, derived)
##D 
##D ## multi-session data
##D mask.check(ovenbird.model.1, session = c("2005","2009"))
##D 
##D ## clipping mask
##D olddir <- setwd(system.file("extdata", package = "secr"))
##D possumarea <- read.table("possumarea.txt", header = TRUE)
##D setwd(olddir)
##D data (possum)
##D mask.check (possum.model.0, spacings = c(20, 30), buffers =
##D     c(200, 300), poly = possumarea, LLonly = FALSE,
##D     file = "temp", CL = TRUE)
##D 
##D ## review fitted models
##D load ("temp.RData")
##D par(mfrow = c(2,2), mar = c(1,4,4,4))
##D for (i in 1:4) {
##D     plot(traps(mask.check.fit[[i]]$capthist), border = 300,
##D         gridlines = FALSE)
##D     plot(mask.check.fit[[i]]$mask, add = TRUE)
##D     lines(possumarea)
##D     text ( 2698618, 6078427, names(mask.check.fit)[i])
##D     box()
##D }
##D par(mfrow = c(1,1), mar = c(5,4,4,2) + 0.1)    ## defaults
##D 
## End(Not run)





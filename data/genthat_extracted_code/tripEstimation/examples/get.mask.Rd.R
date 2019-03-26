library(tripEstimation)


### Name: get.mask
### Title: Create, access and manipulate spatial masks
### Aliases: get.mask mkSmall set.mask<- mkMaskObject
### Keywords: manip

### ** Examples

      
      data(volcano)
      d <- list(x = seq(-10, 10, length = nrow(volcano)), 
                y = seq(-5, 5, length = ncol(volcano)),
                z = array(0, c(nrow(volcano), ncol(volcano), 2)) )
      mv <- min(volcano)
      
      for (i in 0:61) {
        blk <- (i %/% 31) + 1
        bit <- (i - 1) %% 31
        bits(d$z[,,blk], bit) <- volcano > (mv + i*1.6 )
      }
      for (i in 0:61) image(get.mask(d, i))
      
      ## an object with 62 masks is only twice the size of the source data
      object.size(d) / object.size(volcano)
      
      ## Not run: 
##D       ## plot a smaller version
##D       image(get.mask(d, 20), 5)
##D       
##D        ## pretend we have only one masks
##D       lookup <- mkLookup(get.mask(d, 30), by.segment = FALSE)
##D       
##D       ## interactive to show use of lookup function
##D       image(get.mask(d, 30), main = "Click on the red (FALSE) and cream (TRUE) areas")
##D       for (i in 1:10) {x <- matrix(unlist(locator(1)), ncol = 2);text(x[1], x[2], lookup(x) > 0)}
##D       
## End(Not run)
      




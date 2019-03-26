library(ff)


### Name: ff
### Title: ff classes for representing (large) atomic data
### Aliases: ff ff_pointer
### Keywords: IO array attribute classes package

### ** Examples

  message("make sure you understand the following ff options 
    before you start using the ff package!!")
  oldoptions <- options(fffinalizer="deleteIfOpen", fffinonexit="TRUE", fftempdir=tempdir())
  message("an integer vector")
  ff(1:12)                  
  message("a double vector of length 12")
  ff(0, 12)
  message("a 2-bit logical vector of length 12 (vmode='boolean' has 1 bit)")
  ff(vmode="logical", length=12)
  message("an integer matrix 3x4 (standard colwise physical layout)")
  ff(1:12, dim=c(3,4))
  message("an integer matrix 3x4 (rowwise physical layout, but filled in standard colwise order)")
  ff(1:12, dim=c(3,4), dimorder=c(2,1))
  message("an integer matrix 3x4 (standard colwise physical layout, but filled in rowwise order
aka matrix(, byrow=TRUE))")
  ff(1:12, dim=c(3,4), bydim=c(2,1))
  gc()
  options(oldoptions)

  if (ffxtensions()){
     message("a 26-dimensional boolean array using 1-bit representation
      (file size 8 MB compared to 256 MB int in ram)")
     a <- ff(vmode="boolean", dim=rep(2, 26))
     dimnames(a) <- dummy.dimnames(a)
     rm(a); gc()
  }

  ## Not run: 
##D 
##D      message("This 2GB biglm example can take long, you might want to change
##D        the size in order to define a size appropriate for your computer")
##D      require(biglm)
##D 
##D      b <- 1000
##D      n <- 100000
##D      k <- 3
##D      memory.size(max = TRUE)
##D      system.time(
##D      x <- ff(vmode="double", dim=c(b*n,k), dimnames=list(NULL, LETTERS[1:k]))
##D      )
##D      memory.size(max = TRUE)
##D      system.time(
##D      ffrowapply({
##D         l <- i2 - i1 + 1
##D         z <- rnorm(l)
##D         x[i1:i2,] <- z + matrix(rnorm(l*k), l, k)
##D      }, X=x, VERBOSE=TRUE, BATCHSIZE=n)
##D      )
##D      memory.size(max = TRUE)
##D 
##D      form <- A ~ B + C
##D      first <- TRUE
##D      system.time(
##D      ffrowapply({
##D         if (first){
##D           first <- FALSE
##D           fit <- biglm(form, as.data.frame(x[i1:i2,,drop=FALSE]))
##D         }else
##D           fit <- update(fit, as.data.frame(x[i1:i2,,drop=FALSE]))
##D      }, X=x, VERBOSE=TRUE, BATCHSIZE=n)
##D      )
##D      memory.size(max = TRUE)
##D      first
##D      fit
##D      summary(fit)
##D      rm(x); gc()
##D   
## End(Not run)




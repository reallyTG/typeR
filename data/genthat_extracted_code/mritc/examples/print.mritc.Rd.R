library(mritc)


### Name: print.mritc
### Title: Print Method for Class "mritc"
### Aliases: print.mritc
### Keywords: methods

### ** Examples

  T1 <- readMRI(system.file("extdata/t1.rawb.gz", package="mritc"),
                c(91,109,91), format="rawb.gz")
  mask <-readMRI(system.file("extdata/mask.rawb.gz", package="mritc"),
                 c(91,109,91), format="rawb.gz")
  tc.icm <- mritc(T1, mask, method="ICM")
  tc.icm




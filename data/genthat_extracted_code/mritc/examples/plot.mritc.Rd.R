library(mritc)


### Name: plot.mritc
### Title: Plot Method for Class "mritc"
### Aliases: plot.mritc
### Keywords: methods

### ** Examples

  T1 <- readMRI(system.file("extdata/t1.rawb.gz", package="mritc"),
                c(91,109,91), format="rawb.gz")
  mask <-readMRI(system.file("extdata/mask.rawb.gz", package="mritc"),
                 c(91,109,91), format="rawb.gz")
  tc.icm <- mritc(T1, mask, method="ICM")
  plot(tc.icm)




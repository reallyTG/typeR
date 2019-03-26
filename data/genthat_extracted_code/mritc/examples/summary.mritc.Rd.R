library(mritc)


### Name: summary.mritc
### Title: Summary Method for Class "mritc"
### Aliases: summary.mritc
### Keywords: methods

### ** Examples

  T1 <- readMRI(system.file("extdata/t1.rawb.gz", package="mritc"),
                c(91,109,91), format="rawb.gz")
  mask <-readMRI(system.file("extdata/mask.rawb.gz", package="mritc"),
                 c(91,109,91), format="rawb.gz")
  tc.icm <- mritc(T1, mask, method="ICM")
  summary(tc.icm)




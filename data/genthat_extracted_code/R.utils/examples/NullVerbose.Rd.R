library(R.utils)


### Name: NullVerbose
### Title: A Verbose class ignoring everything
### Aliases: NullVerbose
### Keywords: classes programming IO

### ** Examples

verbose <- Verbose()
cat(verbose, "A verbose messages")

verbose <- NullVerbose()
cat(verbose, "A verbose messages")   # Ignored




library(BaTFLED3D)


### Name: safe_log
### Title: Take logarithm avoiding underflow
### Aliases: safe_log

### ** Examples

log(c(1e-323, 1e-324))      # gives -Inf for the second value
safe_log(c(1e-323, 1e-324)) # gives the minimum value of -744.4401




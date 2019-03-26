library(VGAM)


### Name: Rcim
### Title: Mark the Baseline of Row and Column on a Matrix data
### Aliases: Rcim

### ** Examples

(alcoff.e <- moffset(alcoff, roffset = "6", postfix = "*"))
(aa <- Rcim(alcoff,    rbaseline = "11", cbaseline = "Sun"))
(bb <- moffset(alcoff,             "11",             "Sun", postfix = "*"))
aa - bb  # Note the difference!




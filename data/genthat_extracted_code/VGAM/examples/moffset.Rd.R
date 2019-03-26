library(VGAM)


### Name: moffset
### Title: Matrix Offset
### Aliases: moffset

### ** Examples

moffset(alcoff, 3, 2, "*")  # Some day's data is moved to previous day.
Rcim(alcoff, 3 + 1, 2 + 1)  # Data does not move as much.
alcoff  # Original data
moffset(alcoff, 3, 2, "*") - Rcim(alcoff, 3+1, 2+1)  # Note the differences

# An 'effective day' data set:
alcoff.e <- moffset(alcoff, roffset = "6", postfix = "*")
fit.o <- rcim(alcoff)    # default baselines are first row and col
fit.e <- rcim(alcoff.e)  # default baselines are first row and col

## Not run: 
##D  par(mfrow = c(2, 2), mar = c(9, 4, 2, 1))
##D plot(fit.o, rsub = "Not very interpretable", csub = "Not very interpretable")
##D plot(fit.e, rsub = "More interpretable", csub = "More interpretable")
## End(Not run)

# Some checking
all.equal(moffset(alcoff), alcoff)  # Should be no change
moffset(alcoff, 1, 1, "*")
moffset(alcoff, 2, 3, "*")
moffset(alcoff, 1, 0, "*")
moffset(alcoff, 0, 1, "*")
moffset(alcoff, "6", "Mon", "*")  # This one is good

# Customise row and column baselines
fit2 <- rcim(Rcim(alcoff.e, rbaseline = "11", cbaseline = "Mon*"))




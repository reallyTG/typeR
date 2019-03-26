library(randomizeBE)


### Name: runs.pvalue
### Title: 2-sided p-value of the runs test
### Aliases: runs.pvalue

### ** Examples

# alternating sequence 1,2,1,2 ...
# maybe seen as numeric representation of 'TR','RT' ...
# and is used in that way here in this package
x <- rep(c(1, 2), 6)
runs.pvalue(x, pmethod="normal")
# should give 0.002464631
# exact p-value
runs.pvalue(x, pmethod="exact")
# should give 0.004329004
# 
# same for 3 numbers (numeric representation of 3 sequences)
x <- rep(c(1, 2, 3),4)
runs.pvalue(x, pmethod="normal")
# should give 0.2502128
# i.e. is seen as compatible with a random sequence!
# exact p-value, default i.e. must not given exolicitely
runs.pvalue(x)
# should give 0.3212121
# i.e. is seen even more as compatible with a random sequence!




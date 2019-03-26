library(dplR)


### Name: write.compact
### Title: Write DPL Compact Format Ring Width File
### Aliases: write.compact
### Keywords: IO

### ** Examples
library(utils)
data(co021)
fname <- write.compact(rwl.df = co021,
                       fname = tempfile(fileext=".rwl"),
                       append = FALSE, prec = 0.001)
print(fname) # tempfile used for output

unlink(fname) # remove the file




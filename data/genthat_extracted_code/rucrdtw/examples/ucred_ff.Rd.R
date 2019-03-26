library(rucrdtw)


### Name: ucred_ff
### Title: UCR ED Algorithm file-file method
### Aliases: ucred_ff

### ** Examples

#locate example data file
dataf <- system.file("extdata/col_sc.txt", package="rucrdtw")
#locate example query file
queryf <- system.file("extdata/mid_sc.txt", package="rucrdtw")
#determine length of query file
qlength <- length(scan(queryf))
#run query
ucred_ff(dataf, queryf, qlength)




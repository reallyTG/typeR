library(rucrdtw)


### Name: ucrdtw_ff
### Title: UCR DTW Algorithm file-file method
### Aliases: ucrdtw_ff

### ** Examples

#locate example data file
dataf <- system.file("extdata/col_sc.txt", package="rucrdtw")
#locate example query file
queryf <- system.file("extdata/mid_sc.txt", package="rucrdtw")
#determine length of query file
qlength <- length(scan(queryf))
#run query
ucrdtw_ff(dataf, queryf, qlength, 0.05)




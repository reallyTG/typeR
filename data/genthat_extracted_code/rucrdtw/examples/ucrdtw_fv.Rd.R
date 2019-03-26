library(rucrdtw)


### Name: ucrdtw_fv
### Title: UCR DTW Algorithm file-vector method
### Aliases: ucrdtw_fv

### ** Examples

#locate example data file
dataf <- system.file("extdata/col_sc.txt", package="rucrdtw")
#load example data set
data("synthetic_control")
#extract first row as query
query <- synthetic_control[1,]
#run query
ucrdtw_fv(dataf, query, 0.05)




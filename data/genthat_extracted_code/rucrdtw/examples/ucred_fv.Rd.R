library(rucrdtw)


### Name: ucred_fv
### Title: UCR ED Algorithm file-vector method
### Aliases: ucred_fv

### ** Examples

#locate example data file
dataf <- system.file("extdata/col_sc.txt", package="rucrdtw")
#read example query file into vector
query <- scan(system.file("extdata/mid_sc.txt", package="rucrdtw"))
#run query
ucred_fv(dataf, query)




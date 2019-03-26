library(rucrdtw)


### Name: ucred_vv
### Title: UCR ED Algorithm vector-vector method
### Aliases: ucred_vv

### ** Examples

#read example file into vector
dataf <- scan(system.file("extdata/col_sc.txt", package="rucrdtw"))
#read example query file into vector
query <- scan(system.file("extdata/mid_sc.txt", package="rucrdtw"))
#run query
ucred_vv(dataf, query)




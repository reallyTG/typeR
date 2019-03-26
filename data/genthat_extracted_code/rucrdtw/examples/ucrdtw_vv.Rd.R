library(rucrdtw)


### Name: ucrdtw_vv
### Title: UCR DTW Algorithm vector-vector method
### Aliases: ucrdtw_vv

### ** Examples

#read example data into vector
datav <- scan(system.file("extdata/col_sc.txt", package="rucrdtw"))
#read example query into vector
query <- scan(system.file("extdata/first_sc.txt", package="rucrdtw"))
#execute query
ucrdtw_vv(datav, query, 0.05)




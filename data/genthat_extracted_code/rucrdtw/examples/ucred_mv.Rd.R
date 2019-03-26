library(rucrdtw)


### Name: ucred_mv
### Title: UCR ED Algorithm matrix-vector method
### Aliases: ucred_mv

### ** Examples

#load example data matrix
data("synthetic_control")
#use on arbitrary row as query
query <- synthetic_control[5,]
#run query
ucred_mv(synthetic_control, query, byrow=TRUE)




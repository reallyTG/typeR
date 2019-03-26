library(BioGeoBEARS)


### Name: nullsym_to_NA
### Title: Convert a specified null range code to NA
### Aliases: nullsym_to_NA

### ** Examples

testval=1
mat = matrix(c("-",1,1,1,"-",1,1,1,"-"), nrow=3)
mat
mat2 = nullsym_to_NA(mat, nullsym="-")
mat2




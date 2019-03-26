library(DySeq)


### Name: LastOccur
### Title: LastOccur
### Aliases: LastOccur

### ** Examples

# Example 1: Small artificial data

 my.data<-matrix(c(1,0,1,1,
                   0,0,1,0,
                   1,0,0,0,
                   0,0,0,1),4,4, TRUE) # create data

 my.data # inspect sampe data
 LastOccur(my.data,1) # last Occurence of one
 LastOccur(my.data,0) # last Occurence of zero


# Example 2: Real data

 data(CouplesCope)
 LastOccur(CouplesCope[,2:49],1)





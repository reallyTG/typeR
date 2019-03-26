library(agricolae)


### Name: delete.na
### Title: Omitting the rows or columns with missing observations of a
###   matrix (NA)
### Aliases: delete.na
### Keywords: manip

### ** Examples

library(agricolae)
x<-c(2,5,3,7,5,NA,8,0,4,3,NA,NA)
dim(x)<-c(4,3)
x
#     [,1] [,2] [,3]
#[1,]    2    5    4
#[2,]    5   NA    3
#[3,]    3    8   NA
#[4,]    7    0   NA

delete.na(x,"less")
#     [,1]
#[1,]    2
#[2,]    5
#[3,]    3
#[4,]    7

delete.na(x,"greater")
#     [,1] [,2] [,3]
#[1,]    2    5    4





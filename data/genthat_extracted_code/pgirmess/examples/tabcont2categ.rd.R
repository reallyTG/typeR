library(pgirmess)


### Name: tabcont2categ
### Title: Convert a contingency table (data.frame) into a presence/absence
###   table of categories
### Aliases: tabcont2categ
### Keywords: array

### ** Examples

mydata<-as.data.frame(matrix(rpois(9,5),nr=3,nc=3))
names(mydata)<-LETTERS[1:3]
row.names(mydata)<-letters[1:3]

tabcont2categ(mydata)




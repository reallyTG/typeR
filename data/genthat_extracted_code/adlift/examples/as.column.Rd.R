library(adlift)


### Name: as.column
### Title: as.column
### Aliases: as.column
### Keywords: manip

### ** Examples

vector<-1:8
#
vector          
#
#...vector has no dimension attributes
# 
as.column(vector)        
#
#...gives output dimension of (8,1)
#
F<-matrix(c(6,2,2,10,6,17),3,2)
#
#
as.column(F)

#
#the function has no effect on F
#
F<-t(F)
F
#now has dimension (2,3)...
#
as.column(F)
#
#the output is made to have more rows than columns





library(OSDR)


### Name: matlist
### Title: From list of feasible assignments to cost matrix.
### Aliases: matlist
### Keywords: ~ assignment cost matrix ~ assignment problem

### ** Examples

# a list of feasible applicants for five jobs	
M1<-c("A","B","C")
M2<-c("A","C")
M3<-c("B")
M4<-c("A","C")
M5<-c("A","D")
M  <-list(M1,M2,M3,M4,M5)
M

# the corresponding cost matrix
m<-listmat(M)

# back to the list
l<-matlist(m)





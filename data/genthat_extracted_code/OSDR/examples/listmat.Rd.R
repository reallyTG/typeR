library(OSDR)


### Name: listmat
### Title: From cost matrix to list of feasible assignments.
### Aliases: listmat
### Keywords: ~list of feasible assignments ~assignment problem

### ** Examples

# a list of feasible applicants for five jobs	
M1<-c("A","B","C")
M2<-c("A","C")
M3<-c("B")
M4<-c("A","C")
M5<-c("A","D")
M  <-list(M1,M2,M3,M4,M5)
M

# list --> cost matrix
m <- listmat(M)

# cost matrix --> list
l <- matlist(m)




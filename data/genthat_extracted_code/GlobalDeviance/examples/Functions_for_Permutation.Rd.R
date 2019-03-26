library(GlobalDeviance)


### Name: Functions_for_Permutation
### Title: Helper Functions for Permutation
### Aliases: Functions_for_Permutation .mchoose .nPermsG .nPerms .allpermsG
###   .allperms

### ** Examples

## Not run: 
##D ### Examples
##D # Number of permutations
##D .mchoose(1:3)               # or choose(sum(1:3), 1) * choose(sum(2:3), 2)
##D 
##D # Number of permutations for multiple groups
##D .nPermsG(1:3, c(1, 1, 2))
##D 
##D # Number of permutations from the designmatrix
##D D.full<-t(matrix(c(1:9, 1:3), 3, 4))
##D model.dat<-matrix(c(1,0,0,1,0,1,0,0), 4, 2)
##D colnames(model.dat)<-c("A", "B")
##D formula.full<-~A+B
##D .nPerms(D.full, model.dat, formula.full)
##D 
##D # All permutations for the multiple-group case
##D .allpermsG(c(2, 1, 2), c(1, 1, 2)) 
##D 
##D # All permutations for the continuos case
##D .allperms(1:3)
## End(Not run)




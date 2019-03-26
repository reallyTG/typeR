library(NCmisc)


### Name: list.to.env
### Title: Create variables from a list
### Aliases: list.to.env

### ** Examples

list.to.env(list(myChar="a string", myNum=1234, myList=list("list within a list",c(1,2,3))))
print(myChar)
print(myNum)
print(myList)
two.arg.return <- function(X) { return(list(Y=X+1,Z=X*10)) } 
result <- two.arg.return(11) # function returns list with 2 variables
list.to.env(result)
print(Y); print(Z)




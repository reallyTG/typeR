library(CorReg)


### Name: recursive_tree
### Title: decision tree in a recursive way
### Aliases: recursive_tree

### ** Examples

   ## Not run: 
##D    data<-mtcars
##D    require(CorReg)
##D main="Regression tree of cars consumption (in mpg)"
##D   mytree=recursive_tree(data = data,Y ="mpg" ,main=main)
##D    #want to try without cylinder and disp
##D   mytree2=recursive_tree(data = data,Y ="mpg" ,kill=c("cyl","disp"),modele=mytree$modele,main=main)
##D   
##D     
## End(Not run)




library(fBasics)


### Name: Ids
### Title: Set and Retrieve Column/Row Names
### Aliases: Ids colIds rowIds colIds<- rowIds<-
### Keywords: math

### ** Examples

## pascal -
   # Create Pascal Matrix:
   P = pascal(3)
   P
 
## rownames -  
   rownames(P) <- letters[1:3]
   P   
   
## colIds<- -  
   colIds(P) <- as.character(1:3)
   P                            




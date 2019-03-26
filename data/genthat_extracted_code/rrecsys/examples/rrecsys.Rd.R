library(rrecsys)


### Name: rrecsys
### Title: Create a recommender system.
### Aliases: rrecsys rrecsys,_ds-method rrecsysRegistry

### ** Examples

myratings <- matrix(sample(c(0:5), size = 200, replace = TRUE, 
        prob = c(.6,.08,.08,.08,.08,.08)), nrow = 20, byrow = TRUE)

myratings <- defineData(myratings)

r <- rrecsys(myratings, alg = "funkSVD", k = 2)

r2 <- rrecsys(myratings, alg = "IBKNN", simFunct = "cos", neigh = 5)

rrecsysRegistry$get_entries()


 



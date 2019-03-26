library(linprog)


### Name: print.solveLP
### Title: Print Objects of Class solveLP
### Aliases: print.solveLP
### Keywords: optimize

### ** Examples


## example of Steinhauser, Langbehn and Peters (1992)
## Not run: library( linprog )

## Production activities
cvec <- c(1800, 600, 600)  # gross margins
names(cvec) <- c("Milk","Bulls","Pigs")

## Constraints (quasi-fix factors)
bvec <- c(40, 90, 2500)  # endowment
names(bvec) <- c("Land","Stable","Labor")

## Needs of Production activities
Amat <- rbind( c(  0.7,   0.35,   0 ),
               c(  1.5,   1,      3 ),
               c( 50,    12.5,   20 ) )

## Maximize the gross margin
res <- solveLP( cvec, bvec, Amat, TRUE )

## print the results
print( res )




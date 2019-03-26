library(linprog)


### Name: summary.solveLP
### Title: Summary Results for Objects of Class solveLP
### Aliases: summary.solveLP print.summary.solveLP
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

## prepare and print the summary results
summary( res )




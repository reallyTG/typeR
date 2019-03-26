library(linprog)


### Name: solveLP
### Title: Solve Linear Programming / Optimization Problems
### Aliases: solveLP
### Keywords: optimize

### ** Examples


## example of Steinhauser, Langbehn and Peters (1992)
## Production activities
cvec <- c(1800, 600, 600)  # gross margins
names(cvec) <- c("Cows","Bulls","Pigs")

## Constraints (quasi-fix factors)
bvec <- c(40, 90, 2500)  # endowment
names(bvec) <- c("Land","Stable","Labor")

## Needs of Production activities
Amat <- rbind( c(  0.7,   0.35,   0 ),
               c(  1.5,   1,      3 ),
               c( 50,    12.5,   20 ) )

## Maximize the gross margin
solveLP( cvec, bvec, Amat, TRUE )


## example 1.1.3 of Witte, Deppe and Born (1975)
## Two types of Feed
cvec <- c(2.5, 2 )  # prices of feed
names(cvec) <- c("Feed1","Feed2")

## Constraints (minimum (<0) and maximum (>0) contents)
bvec <- c(-10, -1.5, 12)
names(bvec) <- c("Protein","Fat","Fibre")

## Matrix A
Amat <- rbind( c( -1.6,  -2.4 ),
               c( -0.5,  -0.2 ),
               c(  2.0,   2.0 ) )

## Minimize the cost
solveLP( cvec, bvec, Amat )

# the same optimisation using argument const.dir
solveLP( cvec, abs( bvec ), abs( Amat ), const.dir = c( ">=", ">=", "<=" ) )


## There are also several other ways to put the data into the arrays, e.g.:
bvec <- c( Protein = -10.0,
           Fat     =  -1.5,
           Fibre   =  12.0 )
cvec <- c( Feed1 = 2.5,
           Feed2 = 2.0 )
Amat <- matrix( 0, length(bvec), length(cvec) )
rownames(Amat) <- names(bvec)
colnames(Amat) <- names(cvec)
Amat[ "Protein", "Feed1" ] <-  -1.6
Amat[ "Fat",     "Feed1" ] <-  -0.5
Amat[ "Fibre",   "Feed1" ] <-   2.0
Amat[ "Protein", "Feed2" ] <-  -2.4
Amat[ "Fat",     "Feed2" ] <-  -0.2
Amat[ "Fibre",   "Feed2" ] <-   2.0
solveLP( cvec, bvec, Amat )




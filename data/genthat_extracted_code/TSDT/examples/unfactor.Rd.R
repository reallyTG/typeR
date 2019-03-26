library(TSDT)


### Name: unfactor
### Title: unfactor
### Aliases: unfactor

### ** Examples

## Generate example data.frame of factors with factor levels of numeric,
## character and mixed data types.
N <- 20
ex1 <- data.frame( factor( sample( c(0,1,NA), size = N, prob = c(0.4,0.3,0.3),
                           replace = TRUE ) )  )
names( ex1 ) <- "num"
ex1$char <- factor( sample( c("Control","Experimental", NA ), size = N,
                    prob = c(0.4,0.3,0.3), replace = TRUE ) )
ex1$mixed <- factor( sample( c(10,'A',NA), size = N, prob = c(0.4,0.3,0.3),
                     replace = TRUE ) )

## Initially the data type of all variables in ex1 is factor
ex1
class( ex1$num )   #factor
class( ex1$char )  #factor
class( ex1$mixed ) #factor

## Now convert all factor variables to numeric or character
ex2 <- unfactor( ex1 )
ex2

## The data types are now numeric or character
class( ex2$num )   # numeric
class( ex2$char )  # character
class( ex2$mixed ) # character

## The <NA> notation for missing factor values that have been converted to
## character can be changed to an empty string for easier reading by use of
## the function na2empty().
ex2$char <- na2empty( ex2$char )
ex2$mixed <- na2empty( ex2$mixed )
ex2




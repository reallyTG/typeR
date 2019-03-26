library(PRROC)


### Name: print.PRROC
### Title: printing PRROC objects
### Aliases: print.PRROC
### Keywords: print

### ** Examples

# create artificial scores as random numbers
x <- rnorm( 1000 );
y <- rnorm( 1000, -1 );
# compute area under PR curve
pr <- pr.curve( x, y );
print( pr );

# compute area under ROC curve
roc <- roc.curve( x, y );
print( roc );




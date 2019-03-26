library(dparser)


### Name: dparse
### Title: Create R-based Dparser tree walking function based on grammar
### Aliases: dparse

### ** Examples

## No test: 
## This creates the R based parsing function.  It requires
## compilation and runs on most OSes, with the exception of solaris.
## Windows requires Rtools to be installed.
f <- dparse(system.file("tran.g", package = "dparser"),children_first=FALSE);

## Once created, you may then use this function to parse an
## arbitrary syntax file.  For example:
f("
b       = -1
d/dt(X) = a*X + Y*Z;
d/dt(Y) = b*(Y - Z);
d/dt(Z) = -X*Y + c*Y - Z
if (t < 0.02 | t > 99.98){
    print
}
", function(name, value, pos, depth){
    ## This prints the name, value, position and depth passed to the
    ##parsing function.
    cat(sprintf("name:%s;value:%s;pos:%s;depth:%s\n", name, value, pos,
                 depth));
})

## You could use a better R parsing function; You could also use
## this as a starting place for your own C-based parser
## End(No test)




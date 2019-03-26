library(berryFunctions)


### Name: getColumn
### Title: get column from data.frame
### Aliases: getColumn

### ** Examples

head(stackloss)
getColumn(Air.Flow, stackloss)
getColumn("Air.Flow", stackloss)
getColumn(2, stackloss)
getColumn("2",  stackloss) # works too...

# useful warnings:
getColumn(1, stackloss[0,])
getColumn(1, data.frame(AA=rep(NA,10)) )

# Code returning a character works as well:
getColumn(c("Air.Flow","Acid.Conc")[1],  stackloss)

# Can be used in functions to get useful messages:
upper <- function(x, select) getColumn(x, stackloss[select,])
upper(Water.Temp)
upper(2)
upper(2, select=0)

checkerr <- function(x) invisible(is.error(x, force=TRUE, tell=TRUE))

# Pitfall lexical scoping: R only goes up until it finds things:
upper2 <- function(xx) {xx <- "Timmy!"; getColumn(xx, stackloss)} # breaks!
checkerr( upper2(Water.Temp) ) # Column "Timmy" does not exist
# If possible, use "colname" with quotation marks.
# This also avoids the CRAN check NOTE "no visible binding for global variable"
upper3 <- function(char=TRUE)
{
Sepal.Length <- stackloss
if(char) head(getColumn("Sepal.Length", iris), 10)
else     head(getColumn( Sepal.Length,  iris), 10)
}
checkerr( upper3(char=FALSE) )
upper3(char=TRUE) # use string "Sepal.Length" and it works fine.


# The next examples all return informative errors:
checkerr( upper(Water) ) #  partial matching not supported by design
checkerr( getColumn("dummy", stackloss)) # no NULL for nonexisting columns
checkerr( getColumn(2,  stackloss[,0]) ) # error for empty dfs
checkerr( getColumn(Acid, stackloss)   ) # no error-prone partial matching
checkerr( getColumn(2:3,  stackloss)   ) # cannot be a vector
checkerr( getColumn(c("Air.Flow","Acid.Conc"),  stackloss) )


#getColumn("a", tibble::tibble(a=1:7, b=7:1)) # works but warns with tibbles

# Pitfall numerical column names:
df <- data.frame(1:5, 3:7)
colnames(df) <- c("a","1") # this is a bad idea anyways
getColumn("1", df) # will actually return the first column, not column "1"
getColumn("1", df, convnum=FALSE)  # now gives second column
# as said, don't name column 2 as "1" - that will confuse people

# More on scoping and code yielding a column selection:
upp1 <- function(coln, datf) {getColumn(substitute(coln), datf)[1:5]}
upp2 <- function(coln, datf) {getColumn(           coln,  datf)[1:5]}
upp1(Sepal.Length, iris)
upp2(Sepal.Length, iris)
upp1("Sepal.Length", iris)
upp2("Sepal.Length", iris)
vekt <- c("Sepal.Length","Dummy")
upp1(vekt[1], iris)
upp2(vekt[1], iris)





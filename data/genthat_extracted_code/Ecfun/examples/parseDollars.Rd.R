library(Ecfun)


### Name: parseDollars
### Title: Convert character string with Dollar signs and commas to
###   numerics
### Aliases: parseDollars
### Keywords: manip

### ** Examples

##
## 1.  a character vector
##
X2 <- c('-$2,500', '$5,000.50')
x2 <- parseDollars(X2)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(x2, c(-2500, 5000.5))
## Don't show: 
)
## End(Don't show)

##
## A data.frame
##
chDF <- data.frame(let=letters[1:2], Dol=X2, dol=x2)
numDF <- parseCommas(chDF)

chkDF <- chDF
chkDF$Dol <- x2
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(numDF, chkDF)
## Don't show: 
)
## End(Don't show)




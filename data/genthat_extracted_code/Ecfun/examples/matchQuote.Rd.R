library(Ecfun)


### Name: matchQuote
### Title: Match isolated quotes across records
### Aliases: matchQuote
### Keywords: manip

### ** Examples

chvec <- c('abc', 'de"f', ' ', '",', 'g"h', 'matched"quotes"', '')
ch. <- matchQuote(chvec)

# check 
chv. <- c('abc', 'de"f ",', 'g"h', 'matched"quotes"', '')
attr(chv., 'unmatchedQuotes') <- c(2, 4, 5)
attr(chv., 'blankLinesDropped') <- 3
attr(chv., 'quoteLinesAppended') <- 4
attr(chv., 'ncharsAppended') <- 2 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(ch., chv.)
## Don't show: 
)
## End(Don't show)




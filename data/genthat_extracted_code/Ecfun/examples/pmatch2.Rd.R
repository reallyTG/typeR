library(Ecfun)


### Name: pmatch2
### Title: Value matching or partial matching
### Aliases: pmatch2
### Keywords: manip

### ** Examples

##
## 1.  common examples 
##
x2match <- c('Pete', 'Peter', 'Ma', 'Mo', 'Paul', 
             'Cardenas')

tbl <- c('Peter', 'Mary', 'Martha', 'John Paul', 'Peter', 
         'Cardenas', 'Cardenas') 

x2mtchd <- pmatch2(x2match, tbl) 

# answer
x2mtchd. <- list(Pete=c(1, 5), Peter=c(1, 5), Ma=2:3, 
    Mo=integer(0), Paul=4, Cardenas=6:7)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(x2mtchd, x2mtchd.)
## Don't show: 
)
## End(Don't show)
##
## 2.  strange cases that caused errors and are now warnings
##
huh <- pmatch2("(7", tbl)

# answer 
huh. <- list("(7"=integer(0))
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(huh, huh.)
## Don't show: 
)
## End(Don't show)





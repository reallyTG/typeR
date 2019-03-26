library(Ecfun)


### Name: USsenateClass
### Title: Election Class given state and surname of a US Senator
### Aliases: USsenateClass
### Keywords: manip

### ** Examples

tst <- data.frame(Office=factor(c("House", "Senate", "Senate", 'Senate')),
                  state=factor(c('SC', 'SC', 'SC', 'NY')),
                  surname=c("Jones", "DeMint", "Graham", 'Smith'),
                  district=c("9", NA, NA, NA),
                  stringsAsFactors=FALSE)
if(!fda::CRAN()){                  
tst. <- USsenateClass(tst)

chk <- data.frame(incumbent=c(NA, FALSE, TRUE, FALSE),
                  district=c("9", "3", "2", "1 or 3"),
                  stringsAsFactors=FALSE)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst., chk)
## Don't show: 
)
## End(Don't show)

##
## test with names different from the default
##
tst2 <- tst
names(tst2) <- letters[1:4]
tst2. <- USsenateClass(tst2, Office='a',
           state='b', surname='c', district='d')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst., tst2.)
## Don't show: 
)
## End(Don't show)
}




library(Ecfun)


### Name: recode2
### Title: bivariate recode
### Aliases: recode2
### Keywords: manip

### ** Examples

contrib <- c(-1, 0, 0, 1)
contrib0 <- c(FALSE, FALSE, TRUE, FALSE)

contribCodes <- recode2(contrib>0, contrib0,
   c('returned', 'received', '0', 'ERR') )

cC <- c('returned', 'returned', '0', 'received')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(contribCodes, cC)
## Don't show: 
)
## End(Don't show)





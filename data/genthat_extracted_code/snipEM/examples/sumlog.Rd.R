library(snipEM)


### Name: sumlog
### Title: Log-sum from log data
### Aliases: sumlog

### ** Examples

## Not run: 
##D # complete underflow without sumlog 
##D x <- c(-750,-752)
##D log(sum(exp(x)))
##D sumlog(x)
##D 
##D # imprecise sum 
##D x <- c(-745,-752)
##D log(sum(exp(x)))
##D sumlog(x)
##D 
##D # no issues 
##D x <- c(log(3),log(2))
##D log(5)
##D log(sum(exp(x)))
##D sumlog(x)
## End(Not run)



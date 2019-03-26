library(mirtCAT)


### Name: generate.mirt_object
### Title: Generate a mirt object from population parameters
### Aliases: generate.mirt_object

### ** Examples

## Not run: 
##D 
##D ### build a unidimensional test with all 3PL items
##D 
##D nitems <- 50
##D a1 <- rlnorm(nitems, .2,.2)
##D d <- rnorm(nitems)
##D g <- rbeta(nitems, 20, 80)
##D 
##D pars <- data.frame(a1=a1, d=d, g=g)
##D head(pars)
##D 
##D obj <- generate.mirt_object(pars, '3PL')
##D coef(obj, simplify = TRUE)
##D plot(obj, type = 'trace')
##D 
##D ### build a two-dimensional test  
##D ## all graded items with 5 response categories
##D 
##D nitems <- 30
##D as <- matrix(rlnorm(nitems*2, .2, .2), nitems)
##D diffs <- t(apply(matrix(runif(nitems*4, .3, 1), nitems), 1, cumsum)) 
##D diffs <- -(diffs - rowMeans(diffs)) 
##D ds <- diffs + rnorm(nitems)
##D pars2 <- data.frame(as, ds)
##D colnames(pars2) <- c('a1', 'a2', paste0('d', 1:4))
##D head(pars2)
##D 
##D obj <- generate.mirt_object(pars2, 'graded')
##D coef(obj, simplify = TRUE)
##D 
##D ### unidimensional mixed-item test
##D 
##D library(plyr)
##D pars3 <- rbind.fill(pars, pars2) #notice the NA's where parameters do not exist
##D obj <- generate.mirt_object(pars3, itemtype = c(rep('2PL', 50), rep('graded', 30)))
##D coef(obj)
##D itemplot(obj, 51)
##D itemplot(obj, 1, drop.zeros=TRUE)
##D 
## End(Not run)




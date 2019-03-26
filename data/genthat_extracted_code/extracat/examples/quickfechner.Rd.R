library(extracat)


### Name: quickfechner
### Title: fechnerian scaling
### Aliases: quickfechner

### ** Examples

data(olives)
#not a distance matrix, but a similarity matrix in some sense
cx <- 1-abs(cor(olives[-c(1,2,11)]))

cx2 <- quickfechner(cx)

rownames(cx2) <- names(olives)[-c(1,2,11)]
plot(hclust(as.dist(cx2)))

dm <- matrix(runif(100),10,10)
dm <- dm+t(dm)
diag(dm) <- 0
dm2 <- quickfechner(dm)

dmS <- 1-dm/max(dm)
dmS2 <- quickfechner(dmS, x.type="sim", path.op = "*")

## Not run: 
##D # check triangular inequality:
##D 	extracat:::trinq(dm)
##D 	extracat:::trinq(dm2)
##D 	extracat:::trinq(dmS2)
## End(Not run)




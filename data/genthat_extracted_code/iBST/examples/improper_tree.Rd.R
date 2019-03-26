library(iBST)


### Name: improper_tree
### Title: imprper survival tree
### Aliases: improper_tree
### Keywords: documentation tree multivariate survival

### ** Examples

## Not run: 
##D  data(burn)
##D  myarg = list(cp = 0, maxcompete = 0, maxsurrogate = 0, maxdepth = 3)
##D  Y.names = c("T3" ,"D3")
##D  P.names = 'Z2'
##D  T.names = c("Z1", paste("Z", 3:11, sep = ''))
##D  burn.tree <- improper_tree(burn, Y.names, P.names, T.names, method = "R2", args.rpart = myarg)
##D  plot(burn.tree)
##D  text(burn.tree, cex = .7)
##D  
## End(Not run)




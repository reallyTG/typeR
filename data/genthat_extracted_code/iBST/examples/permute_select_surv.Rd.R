library(iBST)


### Name: permute_select_surv
### Title: permutation variable selection
### Aliases: permute_select_surv
### Keywords: documentation tree multivariate survival nonparametric

### ** Examples

## Not run: 
##D  myarg = list(cp = 0, maxcompete = 0, maxsurrogate = 0, maxdepth = 2)
##D  Y.names = c("T3" ,"D3")
##D  P.names = 'Z2'
##D  T.names = c("Z1", paste("Z", 3:11, sep = ''))
##D  mybag = 40
##D  set.seed(5000)
##D  
##D  data(burn)
##D  resperm0 <- permute_select_surv(xdata = burn, Y.names, P.names, T.names, method = "LR", 
##D         Bag = mybag, args.rpart = myarg, args.parallel = list(numWorkers = 1), nperm = 150)
##D  
## End(Not run)




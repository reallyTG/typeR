library(MLCIRTwithin)


### Name: search.model_between
### Title: Search for the global maximum of the log-likelihood of
###   between-item muldimensional models
### Aliases: search.model_between
### Keywords: maximum likelihood estimation Expectation-Maximization
###   algorithm

### ** Examples


## Not run: 
##D # Fit a Graded response model with two latent variables (free discrimination
##D # and difficulty parameters; two latent classes):
##D data(SF12_nomiss)
##D S = SF12_nomiss[,1:12]
##D X = SF12_nomiss[,13]
##D multi0 = rbind(c(1:5, 8), c(6:7,9:12))
##D out1 = search.model_between(S=S,kv=1:3,X=X,link="global",disc=TRUE,
##D                                multi=multi0,fort=TRUE,disp=TRUE,out_se=TRUE) 
##D 
##D # Display output
##D out1$lkv
##D out1$bicv
##D 
##D # Display output with 2 classes:
##D out1$out.single[[2]]
##D out1$out.single[[2]]$lktrace
##D out1$out.single[[2]]$Th
##D out1$out.single[[2]]$piv
##D out1$out.single[[2]]$gac
##D out1$out.single[[2]]$Bec
##D 
## End(Not run)





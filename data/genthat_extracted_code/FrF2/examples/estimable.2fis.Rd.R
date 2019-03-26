library(FrF2)


### Name: estimable.2fis
### Title: Statistical and algorithmic aspects of requesting 2-factor
###   interactions to be estimable in FrF2
### Aliases: estimable.2fis
### Keywords: array design

### ** Examples

########## usage of estimable ###########################
  ## design with all 2fis of factor A estimable on distinct columns in 16 runs
  FrF2(16, nfactors=6, estimable = rbind(rep(1,5),2:6), clear=FALSE)
  FrF2(16, nfactors=6, estimable = c("AB","AC","AD","AE","AF"), clear=FALSE)
  FrF2(16, nfactors=6, estimable = formula("~A+B+C+D+E+F+A:(B+C+D+E+F)"), 
       clear=FALSE)
            ## formula would also accept self-defined factor names
            ## from factor.names instead of letters A, B, C, ...
            
  ## estimable does not need any other input
  FrF2(estimable=formula("~(A+B+C)^2+D+E"))

  ## estimable with factor names 
  ## resolution three must be permitted, as FrF2 first determines that 8 runs 
  ##     would be sufficient degrees of freedom to estimate all effects 
  ##     and then tries to accomodate the 2fis from the model clear of aliasing in 8 runs
  FrF2(estimable=formula("~one+two+three+four+two:three+two:four"), 
       factor.names=c("one","two","three","four"), res3=TRUE)
  ## clear=FALSE allows to allocate all effects on distinct columns in the 
  ##     8 run MA resolution IV design
  FrF2(estimable=formula("~one+two+three+four+two:three+two:four"), 
       factor.names=c("one","two","three","four"), clear=FALSE)

  ## 7 factors instead of 6, but no requirements for factor G
  FrF2(16, nfactors=7, estimable = formula("~A+B+C+D+E+F+A:(B+C+D+E+F)"), 
       clear=FALSE)
  ## larger design for handling this with all required effects clear
  FrF2(32, nfactors=7, estimable = formula("~A+B+C+D+E+F+A:(B+C+D+E+F)"), 
       clear=TRUE)
  ## 16 run design for handling this with required 2fis clear, but main effects aliased
  ## (does not usually make sense)
  FrF2(16, nfactors=7, estimable = formula("~A+B+C+D+E+F+A:(B+C+D+E+F)"), 
       clear=TRUE, res3=TRUE)

## example for necessity of perms for the clear=FALSE case
## based on Wu and Chen Example 1
  ## Not run: 
##D   ## runs per default about max.time=60 seconds, before throwing error with 
##D   ##        interim results
##D   ## results could be used in select.catlg and perm.start for restarting with 
##D   ##       calculation of further possibilities
##D   FrF2(32, nfactors=11, estimable = formula("~(A+B+C+D+E+F)^2"), clear=FALSE)
##D   ## would run for a long long time (I have not yet been patient enough)
##D   FrF2(32, nfactors=11, estimable = formula("~(A+B+C+D+E+F)^2"), clear=FALSE, 
##D        max.time=Inf)
##D   
## End(Not run)
  ## can be easily done with perms, 
  ## as only different subsets of six factors are non-isomorphic
  perms.6 <- combn(11,6)
  perms.full <- matrix(NA,ncol(perms.6),11)
  for (i in 1:ncol(perms.6))
     perms.full[i,] <- c(perms.6[,i],setdiff(1:11,perms.6[,i]))
  ## function compromise will calculate the necessary perms entries automatically
  compromise(11,1:6)$perms.full
  FrF2(32, nfactors=11, estimable = formula("~(A+B+C+D+E+F)^2"), clear=FALSE, 
      perms = perms.full )




library(GDINA)


### Name: itemfit
### Title: Item fit statistics
### Aliases: itemfit extract.itemfit summary.itemfit

### ** Examples

## Not run: 
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D 
##D mod1 <- GDINA(dat = dat, Q = Q, model = "GDINA")
##D mod1
##D itmfit <- itemfit(mod1)
##D 
##D # Print "test-level" item fit statistics
##D # p-values are adjusted for multiple comparisons
##D # for proportion correct, there are J comparisons
##D # for log odds ratio and transformed correlation,
##D # there are J*(J-1)/2 comparisons
##D 
##D itmfit
##D 
##D # The following gives maximum item fit statistics for
##D # each item with item level p-value adjustment
##D # For each item, there are J-1 comparisons for each of
##D # log odds ratio and transformed correlation
##D summary(itmfit)
##D 
##D # use extract to extract various components
##D extract(itmfit,"r")
##D 
##D mod2 <- GDINA(dat,Q,model="DINA")
##D itmfit2 <- itemfit(mod2)
##D #misfit heatmap
##D plot(itmfit2)
##D itmfit2
## End(Not run)




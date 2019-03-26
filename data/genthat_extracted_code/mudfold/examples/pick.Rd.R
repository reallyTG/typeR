library(mudfold)


### Name: pick
### Title: Transform items to preference binary data.
### Aliases: pick

### ** Examples

## Not run: 
##D  
##D ### simulate some data with 3 discrete variables with three levels
##D ### and 1 variable with 4 levels
##D d1 <- cbind(sample(1:3,20,replace = TRUE),
##D             sample(1:3,20,replace = TRUE,prob = c(0.3,0.3,0.4)),
##D             sample(1:3,20,replace = TRUE,prob = c(0.2,0.4,0.4)),
##D             sample(1:4,20,replace = TRUE,prob = c(.1,.3,.4,.2)))
##D 
##D 
##D ### apply pick on d1 ###  
##D # binarize at the mean of 
##D # each row and column
##D d1_rowmean <- pick(d1)
##D d1_colmean <- pick(d1,byItem = TRUE)
##D 
##D # binarize at the cutoff=2 
##D d1_cut <- pick(d1,cutoff = 2,byItem = TRUE)
##D 
##D # binarize at different cutoffs (per row) 
##D # for example at the median of each row
##D med_cuts <- apply(d1,1,median)
##D d1_cuts <- pick(d1,cutoff = med_cuts)
##D 
##D # binarize at different cutoffs (per column) 
##D # for example at the median of each column
##D med_cuts_col <- apply(d1,2,median)
##D d1_cuts_col <- pick(d1,cutoff = med_cuts_col,byItem = TRUE)
##D 
##D 
##D # binarize at the k=2 higher values
##D # per row and column
##D d1_krow <- pick(d1,k = 2)
##D d1_kcol <- pick(d1,k = 2,byItem = TRUE)
## End(Not run)




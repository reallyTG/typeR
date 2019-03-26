library(emIRT)


### Name: dwnom
### Title: Poole-Rosenthal DW-NOMINATE data and scores, 80-110 U.S. Senate
### Aliases: dwnom
### Keywords: datasets

### ** Examples


### Real data example of US Senate 80-110 (not run)
### Based on voteview.com example of DW-NOMINATE (ftp://voteview.com/dw-nominate.htm)
### We estimate a hierarchical model without noise and a linear time covariate
### This model corresponds very closely to the DW-NOMINATE model

## Not run: 
##D data(dwnom)
##D 
##D ## This takes about 10 minutes to run on 8 threads
##D ## You may need to reduce threads depending on what your machine can support
##D lout <- hierIRT(.data = dwnom$data.in,
##D                     .starts = dwnom$cur,
##D                     .priors = dwnom$priors,
##D                     .control = {list(
##D                     threads = 8,
##D                     verbose = TRUE,
##D                     thresh = 1e-4,
##D 				    maxit=200,
##D 				    checkfreq=1
##D                         )})
##D 
##D ## Bind ideal point estimates back to legislator data
##D final <- cbind(dwnom$legis, idealpt.hier=lout$means$x_implied)
##D 
##D ## These are estimates from DW-NOMINATE as given on the Voteview example
##D ## From file "SL80110C21.DAT"
##D nomres <- dwnom$nomres
##D 
##D ## Merge the DW-NOMINATE estimates to model results by legislator ID
##D ## Check correlation between hierIRT() and DW-NOMINATE scores
##D res <- merge(final, nomres, by=c("senate","id"),all.x=TRUE,all.y=FALSE)
##D cor(res$idealpt.hier, res$dwnom1d)
##D 
## End(Not run)




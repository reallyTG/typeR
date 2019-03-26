library(PivotalR)


### Name: madlib.lda
### Title: Wrapper for MADlib's Latent Dirichilet Allocation
### Aliases: madlib.lda
### Keywords: madlib

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D dat <- db.data.frame("__madlib_pivotalr_lda_data__", conn.id = cid,
##D   verbose = FALSE)
##D 
##D output.db <- madlib.lda(dat, 2,0.1,0.1, 50)
##D 
##D perplexity.db <- perplexity.lda.madlib(output.db)
##D print(perplexity.db)
##D 
##D ## Run LDA multiple times and get the best one
##D output.db <- madlib.lda(dat, 2,0.1,0.1, 50, nstart=2)
##D perplexity.db <- perplexity.lda.madlib(output.db)
##D print(perplexity.db)
##D 
##D ## Run LDA multiple times and keep all models
##D output.db <- madlib.lda(dat, 2,0.1,0.1, 50, nstart=2, best=FALSE)
##D 
##D perplexity.db <- perplexity.lda.madlib(output.db[[1]])
##D print(perplexity.db)
##D 
##D perplexity.db <- perplexity.lda.madlib(output.db[[2]])
##D print(perplexity.db)
##D 
##D db.disconnect(cid)
## End(Not run)




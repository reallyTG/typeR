library(OpenRepGrid)


### Name: statsElements
### Title: Descriptive statistics for constructs and elements of a grid.
### Aliases: statsElements statsConstructs statsConstructs

### ** Examples

## Not run: 
##D 
##D    statsConstructs(fbb2003)
##D    statsConstructs(fbb2003, trim=10)
##D    statsConstructs(fbb2003, trim=10, index=F)
##D 
##D    statsElements(fbb2003)
##D    statsElements(fbb2003, trim=10)
##D    statsElements(fbb2003, trim=10, index=F)
##D 
##D    # save the access the results
##D    d <- statsElements(fbb2003)
##D    d
##D    d["mean"]
##D    d[2, "mean"]  # mean rating of 2nd element
##D  
##D    d <- statsConstructs(fbb2003)
##D    d
##D    d["sd"]
##D    d[1, "sd"]   # sd of ratings on first construct
## End(Not run)





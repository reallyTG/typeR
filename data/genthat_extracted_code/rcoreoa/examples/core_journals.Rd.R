library(rcoreoa)


### Name: core_journals
### Title: Get journal via its ISSN
### Aliases: core_journals core_journals_ core_repos_

### ** Examples

## Not run: 
##D core_journals(id = '2167-8359')
##D 
##D ids <- c("2167-8359", "2050-084X")
##D res <- lapply(ids, core_journals)
##D vapply(res, "[[", "", c("data", "title"))
##D 
##D # just http request, get text back
##D core_journals_('2167-8359')
##D 
##D # post request, ideal for lots of ISSNs
##D if (requireNamespace("rcrossref", quietly = TRUE)) {
##D  library(rcrossref)
##D  res <- lapply(c("bmc", "peerj", "elife", "plos", "frontiers"), function(z)
##D     cr_journals(query = z))
##D  ids <- na.omit(unlist(lapply(res, function(b) b$data$issn)))
##D  out <- core_journals(ids, method = "POST")
##D  head(out)
##D }
##D 
## End(Not run)




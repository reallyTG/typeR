library(rcrossref)


### Name: cr_citation_count
### Title: Get a citation count via CrossRef OpenURL
### Aliases: cr_citation_count

### ** Examples

## Not run: 
##D cr_citation_count(doi="10.1371/journal.pone.0042793")
##D cr_citation_count(doi="10.1016/j.fbr.2012.01.001")
##D ## many
##D dois <- c("10.1016/j.fbr.2012.01.001", "10.1371/journal.pone.0042793")
##D cr_citation_count(doi = dois)
##D # DOI not found
##D cr_citation_count(doi="10.1016/j.fbr.2012")
##D 
##D # asyc
##D dois <- c("10.1016/j.fbr.2012.01.001", "10.1371/journal.pone.0042793", 
##D  "10.1016/j.fbr.2012", "10.1109/tsp.2006.874779", "10.1007/bf02231542", 
##D  "10.1007/s00277-016-2782-z", "10.1002/9781118339893.wbeccp020", 
##D  "10.1177/011542659200700105", "10.1002/chin.197444438", 
##D  "10.1002/9781118619599.ch4", "10.1007/s00466-012-0724-8", 
##D  "10.1017/s0376892900029477", "10.1167/16.12.824")
##D res <- cr_citation_count(doi = dois, async = TRUE)
##D ## verbose curl
##D res <- cr_citation_count(doi = dois, async = TRUE, verbose = TRUE)
##D res
##D ## time comparison
##D system.time(cr_citation_count(doi = dois, async = TRUE))
##D system.time(cr_citation_count(doi = dois, async = FALSE))
##D 
##D # from a set of random DOIs
##D cr_citation_count(cr_r(50), async = TRUE)
## End(Not run)




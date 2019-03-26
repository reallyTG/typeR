library(oai)


### Name: get_records
### Title: Get records
### Aliases: get_records

### ** Examples

## Not run: 
##D get_records("oai:oai.datacite.org:32255")
##D 
##D ids <- c("oai:oai.datacite.org:32255", "oai:oai.datacite.org:32325")
##D (res <- get_records(ids))
##D lapply(res, "[[", "header")
##D lapply(res, "[[", "metadata")
##D do.call(rbind, lapply(res, "[[", "header"))
##D do.call(rbind, lapply(res, "[[", "metadata"))
##D 
##D # Get raw text
##D get_records("oai:oai.datacite.org:32255", as = "raw")
##D 
##D # from arxiv.org
##D get_records("oai:arXiv.org:0704.0001", url = "http://export.arxiv.org/oai2")
##D 
##D # GBIF - http://www.gbif.org
##D get_records(
##D   c("816f4734-6b49-41ab-8a1d-1b21e6b5486d",
##D   "95e3042f-f48d-4a04-8251-f755bebeced6"),
##D   url = "http://api.gbif.org/v1/oai-pmh/registry")
##D 
##D # oai_datacite
##D get_records(ids="oai:zenodo.org:159890", prefix="oai_datacite",
##D   url = "https://zenodo.org/oai2d")
##D 
##D get_records(ids="oai:oai.datacite.org:32255", prefix="oai_datacite")
## End(Not run)




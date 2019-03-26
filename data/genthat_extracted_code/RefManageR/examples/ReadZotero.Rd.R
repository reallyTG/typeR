library(RefManageR)


### Name: ReadZotero
### Title: Get Bibliography Information From a Zotero Library.
### Aliases: ReadZotero
### Keywords: database

### ** Examples

## Not run: 
##D ## first two entries in library with bayesian in title
##D ReadZotero(user = "1648676", .params = list(q = "bayesian",
##D   key = "7lhgvcwVq60CDi7E68FyE3br", limit=2))
##D 
##D ## Search specific collection
##D ## collection key can be found by reading uri when collection is selected in Zotero
##D ReadZotero(user = "1648676", .params=list(q = "yu", key = "7lhgvcwVq60CDi7E68FyE3br",
##D   collection = "3STEQRNU"))
##D 
##D ## Search by tag
##D ## Notice the issue with how Zotero uses a TechReport entry for arXiv manuscripts
##D ## This is one instance where the added fields of BibLaTeX are useful
##D ReadZotero(user = "1648676", .params=list(key = "7lhgvcwVq60CDi7E68FyE3br",
##D   tag = "Statistics - Machine Learning"))
##D 
##D ## To read these in you must set check.entries to FALSE or "warn"
##D old.opts <- BibOptions(check.entries = FALSE)
##D length(ReadZotero(user = "1648676", .params = list(key = "7lhgvcwVq60CDi7E68FyE3br",
##D   tag = "Statistics - Machine Learning")))
##D 
##D ## Example using groups
##D ReadZotero(group = "13495", .params = list(q = "Schmidhuber",
##D   collection = "QU23T27Q"))
##D BibOptions(old.opts)
## End(Not run)




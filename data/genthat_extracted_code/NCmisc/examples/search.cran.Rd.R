library(NCmisc)


### Name: search.cran
### Title: Search all CRAN packages for those containing keyword(s).
### Aliases: search.cran

### ** Examples

repos <- "http://cran.ma.imperial.ac.uk/" # OR: repos <- getOption("repos")
# setRepositories(ind=1:2) # for the session will by default search bioconductor packages too
search.cran("useful",repos)
search.cran(c("hmm","markov","hidden"),repos=repos)
require(BiocInstaller)
search.cran(c("snpStats","genoset","limma"),all.repos=TRUE)




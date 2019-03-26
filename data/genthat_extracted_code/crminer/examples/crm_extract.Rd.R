library(crminer)


### Name: crm_extract
### Title: Extract text from a single pdf document
### Aliases: crm_extract

### ** Examples

path <- system.file("examples", "MairChamberlain2014RJournal.pdf",
   package = "crminer")
(res <- crm_extract(path))
res$info
res$text
# with newlines, pretty print
cat(res$text)

# another example
path <- system.file("examples", "ChamberlainEtal2013Ecosphere.pdf",
   package = "crminer")
(res <- crm_extract(path))
res$info
cat(res$text)

# with raw pdf bytes
path <- system.file("examples", "raw-example.rds", package = "crminer")
rds <- readRDS(path)
class(rds)
crm_extract(raw = rds)




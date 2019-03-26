library(provSummarizeR)


### Name: prov.summarize
### Title: Provenance summarization functions
### Aliases: prov.summarize prov.summarize.file prov.summarize.run

### ** Examples

## Not run: prov.summarize ()
testdata <- system.file("testdata", "prov.json", package = "provSummarize")
prov.summarize.file (testdata)
## Not run: 
##D testdata <- system.file("testdata", "Console.R", package = "provSummarize")
##D prov.summarize.run (testdata)
## End(Not run)




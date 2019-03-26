library(textmining)


### Name: make_tabled
### Title: Function to create tmWordCountsTable object from tmParsed
### Aliases: make_tabled

### ** Examples

corp <- tmCorpus(c("This is first document", "This is second"))
parsed <- parse(corp)
tabled <- make_tabled(parsed)
content(tabled)





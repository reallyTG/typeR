library(OAIHarvester)


### Name: verb
### Title: OAI-PMH Verb Functions
### Aliases: oaih_get_record oaih_identify oaih_list_identifiers
###   oaih_list_metadata_formats oaih_list_records oaih_list_sets

### ** Examples

## Harvest ePubWU metadata.
baseurl <- "http://epub.wu.ac.at/cgi/oai2"
## Identify.
oaih_identify(baseurl)
## List metadata formats.
oaih_list_metadata_formats(baseurl)
## List sets.
sets <- oaih_list_sets(baseurl)
sets
## List records in the 'theses' set.
spec <- unlist(sets[sets[, "setName"] == "Type = Thesis", "setSpec"])
x <- oaih_list_records(baseurl, set = spec)
## Drop deleted records and extract the metadata.
m <- x[, "metadata"]
m <- oaih_transform(m[lengths(m) > 0L])
## Find the most frequent keywords.
sep <- "[[:space:]]*/[[:space:]]*"
keywords <- unlist(strsplit(unlist(m[, "subject"]), sep))
head(sort(table(keywords), decreasing = TRUE))




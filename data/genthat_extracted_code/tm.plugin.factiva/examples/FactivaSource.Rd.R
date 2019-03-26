library(tm.plugin.factiva)


### Name: FactivaSource
### Title: Factiva Source
### Aliases: FactivaSource getElem.FactivaSource eoi.FactivaSource

### ** Examples

## Not run: 
##D     ## For an XML file
##D     library(tm)
##D     file <- system.file("texts", "reut21578-factiva.xml",
##D                         package = "tm.plugin.factiva")
##D     source <- FactivaSource(file)
##D     corpus <- Corpus(source, readerControl = list(language = NA))
##D 
##D     # See the contents of the documents
##D     inspect(corpus)
##D 
##D     # See meta-data associated with first article
##D     meta(corpus[[1]])
## End(Not run)

    ## For an HTML file
    library(tm)
    file <- system.file("texts", "factiva_test.html", 
                        package = "tm.plugin.factiva")
    source <- FactivaSource(file)
    corpus <- Corpus(source, readerControl = list(language = NA))

    # See the contents of the documents
    inspect(corpus)

    # See meta-data associated with first article
    meta(corpus[[1]])

    ## Don't show: 
    # Check that texts with non-ASCII characters are properly marked as UTF-8,
    # as bugs in XML have created issues in the past
    stopifnot(all(Encoding(content(corpus[[1]])[1]) == "UTF-8"))
    
## End(Don't show)




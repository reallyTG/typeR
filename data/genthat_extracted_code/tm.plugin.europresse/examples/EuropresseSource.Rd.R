library(tm.plugin.europresse)


### Name: EuropresseSource
### Title: Europresse Source
### Aliases: EuropresseSource getElem.EuropresseSource eoi.EuropresseSource

### ** Examples

    library(tm)
    file <- system.file("texts", "europresse_test2.html",
                        package = "tm.plugin.europresse")
    corpus <- Corpus(EuropresseSource(file))

    # See the contents of the documents
    inspect(corpus)

    # See meta-data associated with first article
    meta(corpus[[1]])

    ## Don't show: 
    file <- system.file("texts", "europresse_test1.html",
                        package = "tm.plugin.europresse")
    corpus <- Corpus(EuropresseSource(file))
    
## End(Don't show)




library(tm.plugin.alceste)


### Name: AlcesteSource
### Title: Alceste Source
### Aliases: AlcesteSource getElem.AlcesteSource eoi.AlcesteSource

### ** Examples

    library(tm)
    file <- system.file("texts", "alceste_test.txt", 
                        package = "tm.plugin.alceste")
    corpus <- Corpus(AlcesteSource(file))

    # See the contents of the documents
    inspect(corpus)

    # See meta-data associated with first article
    meta(corpus[[1]])




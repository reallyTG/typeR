library(tm.plugin.lexisnexis)


### Name: LexisNexisSource
### Title: LexisNexis Source
### Aliases: LexisNexisSource getElem.LexisNexisSource eoi.LexisNexisSource

### ** Examples

    library(tm)
    file <- system.file("texts", "lexisnexis_test_en.html",
                        package = "tm.plugin.lexisnexis")
    corpus <- Corpus(LexisNexisSource(file))

    # See the contents of the documents
    inspect(corpus)

    # See meta-data associated with first article
    meta(corpus[[1]])




library(meta)


### Name: Fleiss93
### Title: Aspirin after Myocardial Infarction
### Aliases: Fleiss93
### Keywords: datasets

### ** Examples

data(Fleiss93)
metabin(event.e, n.e, event.c, n.c,
        data=Fleiss93,
        studlab=paste(study, year),
        sm="OR", comb.random=FALSE)




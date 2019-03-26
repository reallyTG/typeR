library(meta)


### Name: Fleiss93cont
### Title: Mental Health Treatment
### Aliases: Fleiss93cont
### Keywords: datasets

### ** Examples

data(Fleiss93cont)
metacont(n.e, mean.e, sd.e,
         n.c, mean.c, sd.c,
         data=Fleiss93cont,
         studlab=paste(study, year),
         comb.random=FALSE)




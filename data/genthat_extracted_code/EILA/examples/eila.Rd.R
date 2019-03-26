library(EILA)


### Name: eila
### Title: A function to infer local ancestry
### Aliases: eila
### Keywords: local ancestry quantile regression k-means

### ** Examples

## Two ancestries
data(ceuyri)
res.eila <- eila(admixed  = ceuyri$admixed,
                 position = ceuyri$position,
                 anc1     = ceuyri$anc1,
                 anc2     = ceuyri$anc2)
cat("Overall accuracy:", mean((res.eila$local.ancestry ==
                  ceuyri$true.local.ancestry), na.rm=TRUE),"\n")

## Three ancestries
## Not run: 
##D data(ceuchdyri)
##D res.eila <- eila(admixed  = ceuchdyri$admixed,
##D                  position = ceuchdyri$position,
##D                  anc1     = ceuchdyri$anc1,
##D                  anc2     = ceuchdyri$anc2,
##D                  anc3     = ceuchdyri$anc3)
##D cat("Overall accuracy:", mean(res.eila$local.ancestry ==
##D            ceuchdyri$true.local.ancestry),"\n")
## End(Not run)




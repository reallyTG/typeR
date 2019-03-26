library(manifestoR)


### Name: mp_corpus
### Title: Get documents from the Manifesto Corpus Database
### Aliases: mp_corpus

### ** Examples

## Not run: 
##D corpus <- mp_corpus(party == 61620 & rile > 10)
##D 
##D wanted <- data.frame(party=c(41320, 41320), date=c(200909, 201309))
##D mp_corpus(wanted)
##D 
##D mp_corpus(subset(mp_maindataset(), countryname == "France"))
##D 
##D partially_available <- data.frame(party=c(41320, 41320), date=c(200909, 200509))
##D mp_corpus(partially_available)
## End(Not run)




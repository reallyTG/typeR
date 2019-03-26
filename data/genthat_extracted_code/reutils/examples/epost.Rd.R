library(reutils)


### Name: epost
### Title: epost - uploading UIDs to Entrez
### Aliases: epost

### ** Examples

## post a list of protein GIs to the Entrez History server
gi <- c("194680922", "50978626", "28558982", "9507199", "6678417")
p <- epost(gi, "protein")
p




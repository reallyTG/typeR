library(BradleyTerry2)


### Name: citations
### Title: Statistics Journal Citation Data from Stigler (1994)
### Aliases: citations
### Keywords: datasets

### ** Examples


##  Data as a square table, as in Agresti p448
citations

##
## Convert frequencies to success/failure data:
##
citations.sf <- countsToBinomial(citations)
names(citations.sf)[1:2] <- c("journal1", "journal2")

## Standard Bradley-Terry model fitted to these data
citeModel <-  BTm(cbind(win1, win2), journal1, journal2,
                  data = citations.sf)





library(ade4)


### Name: syndicats
### Title: Two Questions asked on a Sample of 1000 Respondents
### Aliases: syndicats
### Keywords: datasets

### ** Examples

data(syndicats)
par(mfrow = c(1,2))
dudi1 <- dudi.coa(syndicats, scan = FALSE)
score (dudi1, 1, TRUE)
score (dudi1, 1, FALSE)




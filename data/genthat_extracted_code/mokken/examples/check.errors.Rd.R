library(mokken)


### Name: check.errors
### Title: Check the number of Guttman errors (Gplus) and the number of
###   infrequent scores (Oplus) for each respondent
### Aliases: check.errors
### Keywords: restscore

### ** Examples

data(acl)
Communality <- acl[,1:10]
Gplus <- check.errors(Communality, TRUE, FALSE)$Gplus
Oplus <- check.errors(Communality, FALSE, TRUE)$Oplus

hist(Gplus, breaks = 0:max(Gplus))




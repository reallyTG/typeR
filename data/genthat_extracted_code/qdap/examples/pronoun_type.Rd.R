library(qdap)


### Name: pronoun_type
### Title: Count Object/Subject Pronouns Per Grouping Variable
### Aliases: pronoun_type
### Keywords: pronouns

### ** Examples

## Not run: 
##D dat <- pres_debates2012
##D dat <- dat[dat$person %in% qcv(ROMNEY, OBAMA), ]
##D (out <- pronoun_type(dat$dialogue, dat$person))
##D plot(out)
##D plot(out, 2)
##D plot(out, 3)
##D plot(out, 3, ncol=2)
##D 
##D scores(out)
##D counts(out)
##D proportions(out)
##D preprocessed(out)
##D 
##D plot(scores(out))
##D plot(counts(out))
##D plot(proportions(out))
##D 
##D (out2 <- pronoun_type(hamlet$dialogue, hamlet$person))
##D plot(out2, 3, ncol=7)
## End(Not run)




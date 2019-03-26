library(qdap)


### Name: object_pronoun_type
### Title: Count Object Pronouns Per Grouping Variable
### Aliases: object_pronoun_type
### Keywords: pronouns

### ** Examples

## Not run: 
##D dat <- pres_debates2012
##D dat <- dat[dat$person %in% qcv(ROMNEY, OBAMA), ]
##D (out <- object_pronoun_type(dat$dialogue, dat$person))
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
## End(Not run)




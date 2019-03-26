library(quanteda)


### Name: textmodel_affinity
### Title: Class affinity maximum likelihood text scaling model
### Aliases: textmodel_affinity
### Keywords: experimental textmodel

### ** Examples

(af <- textmodel_affinity(data_dfm_lbgexample, y = c("L", NA, NA, NA, "R", NA)))
predict(af)
predict(af, newdata = data_dfm_lbgexample[6, ])

## Not run: 
##D # compute bootstrapped SEs
##D bs_dfm <- bootstrap_dfm(data_corpus_dailnoconf1991, n = 10, remove_punct = TRUE)
##D textmodel_affinity(bs_dfm, y = c("Govt", "Opp", "Opp", rep(NA, 55)))
## End(Not run)




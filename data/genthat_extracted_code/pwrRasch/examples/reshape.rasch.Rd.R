library(pwrRasch)


### Name: reshape.rasch
### Title: Reshape data frame in wide format into a long format
### Aliases: reshape.rasch

### ** Examples

## Not run: 
##D 
##D # simulate Rasch model based data
##D # 100 persons, 20 items,
##D dat <- simul.rasch(100, items = seq(-3, 3, length.out = 20))
##D # reshape simulated data into 'long' format with balanced assignment
##D # of testees into two subgroups.
##D dat.long <- reshape.rasch(dat, group = rep(0:1, each = nrow(dat) / 2))
##D head(dat.long)
##D 
##D # extract variable names of items
##D vnames <- grep("it", names(aid_st2), value = TRUE)
##D # reshape aid subtest 2 data into 'long' format with split criterium sex
##D aid_long.sex <- reshape.rasch(aid_st2[, vnames], group = aid_st2[, "sex"])
## End(Not run)




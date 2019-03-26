library(pwrRasch)


### Name: aov.rasch
### Title: Three-Way Analysis of Variance with Mixed Classification for
###   Testing the Rasch Model
### Aliases: aov.rasch

### ** Examples

## Not run: 
##D 
##D # simulate Rasch model based data
##D # 100 persons, 20 items,
##D dat <- simul.rasch(100, items = seq(-3, 3, length.out = 20))
##D # reshape simulated data into 'long' format with balanced assignment
##D # of testees into two subgroups
##D dat.long <- reshape.rasch(dat, group = rep(0:1, each = nrow(dat) / 2))
##D # apply three-way analysis of variance with mixed classification for testing the Rasch model
##D aov.rasch(dat.long)
##D 
##D # extract variable names of items
##D vnames <- grep("it", names(aid_st2), value = TRUE)
##D # reshape aid subtest 2 data into 'long' format with split criterium sex
##D aid_long.sex <- reshape.rasch(aid_st2[, vnames], group = aid_st2[, "sex"])
##D # apply three-way analysis of variance with mixed classification for testing the Rasch model
##D aov.rasch(aid_long.sex)
## End(Not run)




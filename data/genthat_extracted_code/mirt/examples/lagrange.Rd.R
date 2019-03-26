library(mirt)


### Name: lagrange
### Title: Lagrange test for freeing parameters
### Aliases: lagrange
### Keywords: Lagrange test

### ** Examples


## Not run: 
##D dat <- expand.table(LSAT7)
##D mod <- mirt(dat, 1, 'Rasch')
##D (values <- mod2values(mod))
##D 
##D #test all fixed slopes individually
##D parnum <- values$parnum[values$name == 'a1']
##D lagrange(mod, parnum)
##D 
##D # compare to LR test for first two slopes
##D mod2 <- mirt(dat, 'F = 1-5
##D                    FREE = (1, a1)', 'Rasch')
##D coef(mod2, simplify=TRUE)$items
##D anova(mod, mod2)
##D 
##D mod2 <- mirt(dat, 'F = 1-5
##D                    FREE = (2, a1)', 'Rasch')
##D coef(mod2, simplify=TRUE)$items
##D anova(mod, mod2)
##D 
##D mod2 <- mirt(dat, 'F = 1-5
##D                    FREE = (3, a1)', 'Rasch')
##D coef(mod2, simplify=TRUE)$items
##D anova(mod, mod2)
##D 
##D # test slopes first two slopes and last three slopes jointly
##D lagrange(mod, list(parnum[1:2], parnum[3:5]))
##D 
##D # test all 5 slopes and first + last jointly
##D lagrange(mod, list(parnum[1:5], parnum[c(1, 5)]))
##D 
## End(Not run)




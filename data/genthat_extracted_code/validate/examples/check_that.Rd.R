library(validate)


### Name: check_that
### Title: Simple data validation interface
### Aliases: check_that

### ** Examples


cf <- check_that(women, height>0, height/weight < 0.5)
cf
summary(cf)
barplot(cf)


## Not run: 
##D # this works only after loading the 'magrittr' package
##D women %>% 
##D   check_that(height>0, height/weight < 0.5) %>%
##D   summary()
## End(Not run)





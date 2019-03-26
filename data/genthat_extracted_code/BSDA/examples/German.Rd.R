library(BSDA)


### Name: German
### Title: Number of errors in copying a German passage before and after an
###   experimental course in German
### Aliases: German
### Keywords: datasets

### ** Examples


t.test(errors ~ when, data = German, paired = TRUE)
wilcox.test(errors ~ when, data = German)

## Not run: 
##D T8 <- tidyr::spread(German, when, errors) %>%
##D mutate(di = After - Before, adi = abs(di), rk = rank(adi), srk = sign(di)*rk)
##D T8
##D qqnorm(T8$di)
##D qqline(T8$di)
##D t.test(T8$srk)
## End(Not run)





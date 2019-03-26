library(BSDA)


### Name: Fitness
### Title: Number of sit-ups before and after a physical fitness course
### Aliases: Fitness
### Keywords: datasets

### ** Examples


t.test(number ~ test, data = Fitness, alternative = "greater", paired = TRUE)
## Not run: 
##D Wide <- tidyr::spread(Fitness, test, number) %>%
##D mutate(diff = After - Before)
##D Wide
##D qqnorm(Wide$diff)
##D qqline(Wide$diff)
##D t.test(Wide$diff, alternative = "greater")
## End(Not run)





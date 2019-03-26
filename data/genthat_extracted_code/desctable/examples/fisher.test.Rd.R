library(desctable)


### Name: fisher.test
### Title: Fisher's Exact Test for Count Data
### Aliases: fisher.test fisher.test.default fisher.test.formula

### ** Examples

## Not run: 
##D ## Agresti (1990, p. 61f; 2002, p. 91) Fisher's Tea Drinker
##D ## A British woman claimed to be able to distinguish whether milk or
##D ##  tea was added to the cup first.  To test, she was given 8 cups of
##D ##  tea, in four of which milk was added first.  The null hypothesis
##D ##  is that there is no association between the true order of pouring
##D ##  and the woman's guess, the alternative that there is a positive
##D ##  association (that the odds ratio is greater than 1).
##D TeaTasting <-
##D matrix(c(3, 1, 1, 3),
##D        nrow = 2,
##D        dimnames = list(Guess = c("Milk", "Tea"),
##D                        Truth = c("Milk", "Tea")))
##D fisher.test(TeaTasting, alternative = "greater")
##D ## => p = 0.2429, association could not be established
##D 
##D ## Fisher (1962, 1970), Criminal convictions of like-sex twins
##D Convictions <-
##D matrix(c(2, 10, 15, 3),
##D        nrow = 2,
##D        dimnames =
##D        list(c("Dizygotic", "Monozygotic"),
##D             c("Convicted", "Not convicted")))
##D Convictions
##D fisher.test(Convictions, alternative = "less")
##D fisher.test(Convictions, conf.int = FALSE)
##D fisher.test(Convictions, conf.level = 0.95)$conf.int
##D fisher.test(Convictions, conf.level = 0.99)$conf.int
##D 
##D ## A r x c table  Agresti (2002, p. 57) Job Satisfaction
##D Job <- matrix(c(1,2,1,0, 3,3,6,1, 10,10,14,9, 6,7,12,11), 4, 4,
##D dimnames = list(income = c("< 15k", "15-25k", "25-40k", "> 40k"),
##D                 satisfaction = c("VeryD", "LittleD", "ModerateS", "VeryS")))
##D fisher.test(Job)
##D fisher.test(Job, simulate.p.value = TRUE, B = 1e5)
##D 
##D ###
## End(Not run)




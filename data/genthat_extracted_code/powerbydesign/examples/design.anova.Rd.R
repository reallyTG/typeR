library(powerbydesign)


### Name: design.anova
### Title: Define an ANOVA Design
### Aliases: design.anova

### ** Examples

## Not run: 
##D design <- design.anova(
##D    between = list(age = c("young","old"),
##D                   sex = c("male","female")),
##D    within = list(condition = c("cond1","cond2","cond3")),
##D    default_within_correlation = 0.7,
##D    save_input_as = "myexp1",
##D    silent_load = T
##D )
## End(Not run)





library(BSDA)


### Name: Stress
### Title: Short-term memory test scores on 12 subjects before and after a
###   stressful situation
### Aliases: Stress
### Keywords: datasets

### ** Examples


diff <- Stress$prestress - Stress$poststress
qqnorm(diff)
qqline(diff)
t.test(diff)
t.test(Stress$prestress, Stress$poststress, paired = TRUE)
## Not run: 
##D wilcox.test(Stress$prestress, Stress$poststress, paired = TRUE)
## End(Not run)





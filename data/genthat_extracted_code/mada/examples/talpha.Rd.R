library(mada)


### Name: talpha
### Title: The t_alpha transformation as a link function for binary GLMs.
### Aliases: talpha

### ** Examples

canonical <- binomial(link = talpha(1)) # logit-link
talpha_fam <- function(alpha)binomial(link = talpha(alpha)) # talpha family
## A call to glm might look like this: glm(formula, family = talpha_fam(1.5))




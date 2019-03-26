library(solarius)


### Name: transformTrait
### Title: Transform a trait.
### Aliases: transformTrait

### ** Examples

library(plyr)
library(ggplot2)

data(dat30)
dat <- mutate(dat30,
   inormal_trait1 = transformTrait(trait1, "inormal"))

ggplot(dat, aes(trait1)) + geom_histogram()
ggplot(dat, aes(inormal_trait1)) + geom_histogram()




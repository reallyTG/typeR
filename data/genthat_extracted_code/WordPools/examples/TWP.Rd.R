library(WordPools)


### Name: TWP
### Title: The Toronto Word Pool
### Aliases: TWP
### Keywords: datasets

### ** Examples

data(TWP)
str(TWP)
summary(TWP)
# quick view of distributions
boxplot(scale(TWP[, 3:9]))

plotDensity(TWP, "imagery")
plotDensity(TWP, "concreteness")
plotDensity(TWP, "frequency")

# select low imagery, concreteness and frequency words
R <- list(imagery=c(1,5), concreteness=c(1,4), frequency=c(0,30))
pickList(TWP, R)

# dplyr now makes this much more flexible
if (require(dplyr)) {
  # select items within given ranges
  selected <- TWP %>%	
  	filter( canadian == 0) %>%              # remove Canadian spellings
  	filter( imagery <= 5, concreteness <= 4, frequency <= 30) %>%
  	select(word, imagery:frequency )
  	
  str(selected)
  
  # get random samples of selected items
  nitems <- 5
  nlists <- 2
  lists <- selected %>%
  	sample_n( nitems*nlists, replace=FALSE) %>%
  	mutate(list = rep(1:nlists, each=nitems))
  
  str(lists)
  lists
}





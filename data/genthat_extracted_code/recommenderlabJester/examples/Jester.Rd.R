library(recommenderlabJester)


### Name: Jester
### Title: Jester Dataset
### Aliases: Jester Jester_text
### Keywords: datasets

### ** Examples

data(Jester)
Jester

hist(getRatings(Jester), main="Distribution of ratings")

# what is the best joke? (highest average rating)
data(Jester_text)
best <- which.max(colMeans(Jester))
cat(Jester_text[best])





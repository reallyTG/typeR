library(PROscorerTools)


### Name: rerange
### Title: Change the range of an item or score
### Aliases: rerange rerange100

### ** Examples

qol_score <- c(0:4)

# Default is to rerange to c(0, 100)
rerange(qol_score, old = c(0, 4))
# Below gives same result as above
rerange100(qol_score, 0, 4)

# These two lines are different ways to rerange and reverse code at same time
rerange(qol_score, old = c(0, 4), new = c(0, 100), rev = TRUE)
rerange(qol_score, old = c(0, 4), new = c(100, 0))




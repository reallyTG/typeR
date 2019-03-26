library(vote)


### Name: count.votes
### Title: Count Votes
### Aliases: count.votes invalid.votes valid.votes
### Keywords: tools

### ** Examples

# Example using the IMS Council dataset modified for score voting
data(ims_score)
# should recognize that it is a dataset with score voting data
count.votes(ims_score, max.score = 9, larger.wins = FALSE)

# All records with score larger than 8 are excluded 
res <- count.votes(ims_score, method = "score", max.score = 8)
head(invalid.votes(res))

summary(res)




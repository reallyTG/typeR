library(vote)


### Name: score
### Title: Score Vote Count
### Aliases: score summary.vote.score view.vote.score
###   print.summary.vote.score vote.score
### Keywords: tools

### ** Examples

# Example using the IMS Council dataset modified for score voting
data(ims_score)
score.ims <- score(ims_score, max.score = 9)
summary(score.ims)




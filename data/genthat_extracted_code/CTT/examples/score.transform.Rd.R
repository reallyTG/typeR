library(CTT)


### Name: score.transform
### Title: Function for transforming scores onto different scales
### Aliases: score.transform
### Keywords: misc

### ** Examples


# Example data provided with package
data(CTTdata)
data(CTTkey)

# Data scored to demonstrate function
scores <- score(CTTdata,CTTkey)$score # obtain the scores

# the targeted mean=3, standard deviation=1

score.transform(scores,3,1)

# the score should be transformed by normalized precentile
score.transform(scores,3,1,TRUE)




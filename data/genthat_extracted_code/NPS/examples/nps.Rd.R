library(NPS)


### Name: nps
### Title: Calculate a Net Promoter Score
### Aliases: nps

### ** Examples

# This will generate 1000 dummy Likelihood to Recommend reponses
x <- sample(0:10, prob=c(0.02, 0.01, 0.01, 0.01, 0.01, 0.03, 0.03, 0.09,
    0.22, 0.22, 0.35), 1000, replace=TRUE)

# Here are the proportions of respondents giving each Likelihood to
# Recommend response
prop.table(table(x))

# Here's a histrogram of the scores
hist(x, breaks=-1:10, col=c(rep("red",7), rep("yellow",2), rep("green", 2)))

# Here's a barplot. It's very similar, though for categorical responses
# it's often slightly easier to interpret.
barplot(
    prop.table(table(x)),
     col=c(rep("red",7), rep("yellow",2), rep("green", 2))
     )

# Here's the nps
nps(x)

#You can round it if you like
round(nps(x)) ; round(nps(x),1)




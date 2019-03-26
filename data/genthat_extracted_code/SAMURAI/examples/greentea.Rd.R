library(SAMURAI)


### Name: greentea
### Title: The effect of green tea on weight loss.
### Aliases: greentea
### Keywords: datasets

### ** Examples

data(greentea)
greentea

forestsens(greentea, binary=FALSE, mean.sd=TRUE, higher.is.better=FALSE)

# To fix the random number seed to make the results reproducible. 
forestsens(greentea, binary=FALSE, mean.sd=TRUE, higher.is.better=FALSE, random.number.seed=52)

# To modify the outlooks of all unpublished studies to, say, "negative". 
forestsens(greentea, binary=FALSE,mean.sd=TRUE,higher.is.better=FALSE,random.number.seed=52,
  outlook="negative")

# To modify the outlooks of all unpublished studies to, say, "negative", and 
# overruling the default standardized mean difference (SMD) assigned to "negative". 
# (In this case, for a negative outlook we might assign a positive SMD, which corresponds to 
# having weight loss under green tea treatment less than weight loss under control treatment, 
# i.e. the green tea treatment is less effective at achieving weight loss than control treatment.
forestsens(greentea, binary=FALSE, mean.sd=TRUE, higher.is.better=FALSE,random.number.seed=52,
  outlook="negative", smd.neg=0.4)

# To generate a forest plot for each of the ten default outlooks defined by forestsens().
forestsens(greentea, binary=FALSE, mean.sd=TRUE, higher.is.better=FALSE, random.number.seed=52,
  all.outlooks=TRUE)




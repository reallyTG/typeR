library(SAMURAI)


### Name: Hpylori
### Title: Healing of duodenal ulcers by Helicobacter pylori eradication
###   therapy
### Aliases: Hpylori
### Keywords: datasets

### ** Examples

data(Hpylori)
Hpylori

forestsens(table=Hpylori, binary=TRUE, higher.is.better=FALSE, scale=0.8)

# To fix the random number seed to make the results reproducible.
forestsens(table=Hpylori, binary=TRUE, higher.is.better=FALSE, scale=0.8, 
  random.number.seed=106)

# To modify the outlooks of all unpublished studies to, say, "very negative". 
forestsens(table=Hpylori, binary=TRUE, higher.is.better=FALSE, scale=0.8, 
  random.number.seed=106, outlook="very negative")

# To modify the outlooks of all unpublished studies to, say, "very negative", 
# and overruling the default relative risk assigned to "very negative".
forestsens(table=Hpylori, binary=TRUE, higher.is.better=FALSE, scale=0.8, 
  random.number.seed=106, outlook="very negative", rr.vneg=2.5)

# To generate a forest plot for each of the ten default outlooks 
# defined by forestsens().
forestsens(table=Hpylori, binary=TRUE, higher.is.better=FALSE, scale=0.8, 
  random.number.seed=106, all.outlooks=TRUE)




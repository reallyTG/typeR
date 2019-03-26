library(betareg)


### Name: betatree
### Title: Beta Regression Trees
### Aliases: betatree plot.betatree print.betatree predict.betatree
###   sctest.betatree
### Keywords: tree

### ** Examples

options(digits = 4)

## data with two groups of dyslexic and non-dyslexic children
data("ReadingSkills", package = "betareg")
## additional random noise (not associated with reading scores)
set.seed(1071)
ReadingSkills$x1 <- rnorm(nrow(ReadingSkills))
ReadingSkills$x2 <- runif(nrow(ReadingSkills))
ReadingSkills$x3 <- factor(rnorm(nrow(ReadingSkills)) > 0)

## fit beta regression tree: in each node
##   - accurcay's mean and precision depends on iq
##   - partitioning is done by dyslexia and the noise variables x1, x2, x3
## only dyslexia is correctly selected for splitting
bt <- betatree(accuracy ~ iq | iq, ~ dyslexia + x1 + x2 + x3,
  data = ReadingSkills, minsize = 10)
plot(bt)

## inspect result
coef(bt)
summary(bt, node = 2)
summary(bt, node = 3)
library("strucchange")
sctest(bt)

## add a numerical variable with relevant information for splitting
ReadingSkills$x4 <- rnorm(nrow(ReadingSkills), c(-1.5, 1.5)[ReadingSkills$dyslexia])

bt2 <- betatree(accuracy ~ iq | iq, ~ x1 + x2 + x3 + x4,
  data = ReadingSkills, minsize = 10)
plot(bt2)

## inspect result
coef(bt2)
sctest(bt2)
summary(bt2, node = 2)
summary(bt2, node = 3)




## ----setup, include=FALSE, message = FALSE-------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(FFTrees)
options(digits = 3)

## ---- message = FALSE----------------------------------------------------
heartdisease.ca <- cuerank(formula = diagnosis ~., 
                           data = heartdisease)

# Print key results
heartdisease.ca[c("cue", "threshold", "direction", "bacc")]

## ----agethreshold, fig.width = 6, fig.height = 6, fig.align='center', echo = FALSE, fig.cap="Plotting the balanced accuracy of each decision threshold for the age cue."----
# Age thresholds to test
ages.to.test <- seq(20, to = 90, by = 5)

# Calculate balanced accuracy for each threshold
y <- sapply(ages.to.test, FUN = function(x) {
  
  decisions <- heartdisease$age > x
  
  sens <- mean(decisions[heartdisease$diagnosis == 1] == 1)
  spec <- mean(decisions[heartdisease$diagnosis == 0] == 0)
  
  bacc <- (sens + spec) / 2
  
  return(bacc)

})

plot(ages.to.test, y, 
     type = "b", 
     xlab = "age threshold", 
     ylab = "balanced accuracy (bacc)", ylim = c(.5, .7))

grid()

text(55, 
     y[ages.to.test == 55], 
     labels = paste("age = 55, bacc = ", round(y[ages.to.test == 55], 2)), 
     pos = 3)

## ------------------------------------------------------------------------
# Rank heartdisease cues by balanced accuracy
heartdisease.ca <- heartdisease.ca[order(heartdisease.ca$bacc, decreasing = TRUE),]

# Print the key columns
heartdisease.ca[c("cue", "threshold", "direction", "bacc")]

## ---- fig.width = 7, fig.height = 7, fig.align = 'center', fig.cap = "Cue accuracies for the heartdisease dataset. The top 5 cues in terms of balanced accuracy are highlighted."----
# Show the accuracy of cues in ROC space
showcues(cue.accuracies = heartdisease.ca)

## ------------------------------------------------------------------------
# Grow FFTs
heartdisease.ffts <- grow.FFTrees(formula = diagnosis ~., 
                                  data = heartdisease)

# Print the tree definitions
heartdisease.ffts$tree.definitions

## ---- fig.width = 5, fig.height = 5, message = FALSE, fig.align = "center"----
# Create trees
heart.fft <- FFTrees(formula = diagnosis ~., 
                     data = heartdisease)

# Plot tree # 4
plot(heart.fft, 
     stats = FALSE,    # Don't include statistics
     tree = 4)

## ------------------------------------------------------------------------
heart.cue.cost <- list(age = 1,  
                       sex = 1,
                       cp = 1,
                       trestbps = 1,
                       chol = 7.27,
                       fbs = 5.2,
                       restecg = 15.5,
                       thalach = 102.9,
                       exang = 87.3,
                       oldpeak = 87.3,
                       slope = 87.3,
                       ca = 100.9,
                       thal = 102.9)

## ------------------------------------------------------------------------
# Specify the following costs for heart disease diagnosis:
# cost(Hit) = 0, cost(False Alarm) = 100, cost(Miss) = 200, cost(correct rejection) = 0

heart.cost.outcomes <- list(hi = 0, fa = 500, mi = 1000, cr = 0)

## ------------------------------------------------------------------------
heart.costA.fft <- FFTrees(formula = diagnosis ~.,
                          data = heartdisease,
                          cost.outcomes = heart.cost.outcomes,
                          cost.cues = heart.cue.cost,
                          goal = "bacc",
                          goal.chase = "bacc")

## ------------------------------------------------------------------------
summary(heart.costA.fft)

## ------------------------------------------------------------------------
heart.costB.fft <- FFTrees(formula = diagnosis ~.,
                           data = heartdisease,
                           cost.outcomes = heart.cost.outcomes,
                           cost.cues = heart.cue.cost,
                           goal = "cost",
                           goal.chase = "cost")

## ------------------------------------------------------------------------
summary(heart.costB.fft)


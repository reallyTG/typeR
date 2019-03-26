library(robustbase)


### Name: possumDiv
### Title: Possum Diversity Data
### Aliases: possumDiv possum.mat
### Keywords: datasets

### ** Examples

data(possumDiv)
head(possum.mat)

str(possumDiv)
## summarize all variables as multilevel factors:
summary(as.data.frame(lapply(possumDiv, function(v)
                             if(is.integer(v)) factor(v) else v)))

## Following Cantoni & Ronchetti (2001), JASA, p.1026 f.:% cf. ../tests/poisson-ex.R
pdFit <- glmrob(Diversity ~ . , data = possumDiv,
                family=poisson, tcc = 1.6, weights.on.x = "hat", acc = 1e-15)
summary(pdFit)
summary(pdF2 <- update(pdFit, ~ . -Shrubs))
summary(pdF3 <- update(pdF2,  ~ . -eucalyptus))
summary(pdF4 <- update(pdF3,  ~ . -Stumps))
summary(pdF5 <- update(pdF4,  ~ . -BAcacia))
summary(pdF6 <- update(pdF5,  ~ . -aspect))# too much ..
anova(pdFit, pdF3, pdF4, pdF5, pdF6, test = "QD") # indeed,
## indeed, the last simplification is too much
possumD.2 <- within(possumDiv, levels(aspect)[1:3] <- rep("other", 3))
## and use this binary 'aspect' instead of the 4-level one:
summary(pdF5.1 <- update(pdF5, data = possumD.2))

if(FALSE) # not ok, as formually not nested.
anova(pdF5, pdF5.1)

summarizeRobWeights(weights(pdF5.1, type="rob"), eps = 0.73)
##->  "outliers"  (1, 59, 110)
wrob <- setNames(weights(pdF5.1, type="rob"), rownames(possumDiv))
head(sort(wrob))




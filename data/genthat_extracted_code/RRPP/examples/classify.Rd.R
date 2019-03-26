library(RRPP)


### Name: classify
### Title: Classification probabilities for lm.rrpp model fits
### Aliases: classify
### Keywords: analysis

### ** Examples


# Using the Pupfish data (see lm.rrpp help for more detail)

data(Pupfish)
Pupfish$logSize <- log(Pupfish$CS) 
fit <- lm.rrpp(coords ~ logSize + Sex * Pop, SS.type = "I", 
data = Pupfish, print.progress = FALSE, iter = 0)

classify(fit, inherent.groups = TRUE) # see groups available
class1 <- classify(fit, CV = TRUE)
summary(class1)

# Perfect classification

table(interaction(Pupfish$Sex, Pupfish$Pop), class1$class)

class2 <- classify(fit, CV = TRUE, pc.space = 0.6)
summary(class2)
table(interaction(Pupfish$Sex, Pupfish$Pop), class2$class)

# Allow for heterogenous slopes in the model
fit2 <- lm.rrpp(coords ~ logSize * Sex * Pop, SS.type = "I", 
data = Pupfish, print.progress = FALSE, iter = 0)

# Classification for small-sized fish (previous example for mean-sized fish)

class3 <- classify(fit2, CV = TRUE, 
covariate.values = data.frame(logSize = 4))
summary(class3)

# Classification for large-sized fish 

class4 <- classify(fit2, CV = TRUE, 
covariate.values = data.frame(logSize = 4.5))
summary(class4)




library(doBy)


### Name: data-breastcancer
### Title: Gene expression signatures for p53 mutation status in 250 breast
###   cancer samples
### Aliases: data-breastcancer breastcancer
### Keywords: datasets

### ** Examples


data(breastcancer)
bc <- breastcancer
pairs(bc[,1:5], col=bc$code)

train <- sample(1:nrow(bc), 50)
table(bc$code[train])
library(MASS)
z <- lda(code ~ ., data=bc, prior = c(1,1)/2, subset = train)
pc <- predict(z, bc[-train, ])$class
pc
bc[-train, "code"]
table(pc, bc[-train, "code"])





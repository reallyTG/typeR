library(BKPC)


### Name: predict.bkpc
### Title: Predict Method for Bayesian Kernel Projection Classifier
### Aliases: predict.bkpc predictMultinomSamples

### ** Examples

set.seed(-88106935)

data(iris)
testset <- sample(1:150,30)

train <- as.matrix(iris[-testset,-5])
test <- as.matrix(iris[testset,-5])

wtr <- iris[-testset, 5]
wte <- iris[testset, 5]

result <- bkpc(train, y = wtr,  n.iter = 1000,  thin = 10, n.kpc = 2, 
intercept = FALSE, rotate = TRUE)

# predict
out <- predict(result, test, n.burnin = 20) 

# classification rate for the test set

sum(out$class == as.numeric(wte))/dim(test)[1]

table(out$class, as.numeric(wte))

# consider just misclassified observations:

missclassified <- out$class != as.numeric(wte)


tab <- cbind(out$map[missclassified, ], out$class[missclassified],  as.numeric(wte)[missclassified])
colnames(tab) = c("P(k = 1)", "P(k = 2)", "P(k = 3)", "predicted class", "true class")
tab


# consider, say, 28th observation in the test set:
# sample probability distributions of belonging to each of the three classes: 


ProbClass2samples <- out$p[28, ]
ProbClass3samples <- out$p[28 + dim(test)[1], ]
ProbClass1samples <- 1 - (ProbClass2samples + ProbClass3samples)
hist(ProbClass1samples)
hist(ProbClass2samples)
hist(ProbClass3samples)






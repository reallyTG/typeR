# test.rpart.plot.R
# Check for porting problems by building a few simple models.
# For much more comprehensive tests see rpart.plot\inst\slowtests.
library(rpart.plot)
data(trees)     # anova model
Volume <- rpart(Volume~., data=trees)
print(rpart.rules(Volume, digits=5))
data(ptitanic)  # binomial model
ptitanic1 <- ptitanic
ptitanic1$female <- ptitanic1$sex == "female" # logical variable
ptitanic1$sex <- NULL
ptitanic1$parch <- NULL
survived <- rpart(survived ~ ., data=ptitanic1, method="class")
print(rpart.rules(survived, clip.facs=TRUE))
options(digits=4) # avoid numerical discrepancies across machines and R versions
options(width=1e3)
print(head(rpart.predict(survived, rules=TRUE)))
ptitanic1 <- NULL # delete the data, will affect male and sibsp in printed rules
print(rpart.rules(survived, roundint=FALSE)) # roundint=FALSE else warning
data(iris)      # multiclass model
Species <- rpart(Species ~ ., data=iris, method="class")
print(rpart.rules(Species))

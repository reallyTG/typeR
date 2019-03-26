library(arulesCBA)


### Name: CBA.object
### Title: Objects for Classifiers Based on Association Rules
### Aliases: CBA.object CBA_ruleset predict.CBA print.CBA rules rules.CBA

### ** Examples

data("iris")
iris.disc <- discretizeDF.supervised(Species ~., iris)

# create transactions
trans <- as(iris.disc, "transactions")
truth <- iris.disc$Species

# create rule base with CARs
cars <- mineCARs(Species ~ ., trans, parameter = list(support = .01, confidence = .8))

cars <- cars[!is.redundant(cars)]
cars <- sort(cars, by = "conf")

# create classifier
cl <- CBA_ruleset(Species ~ ., cars)
cl

# look at the rule base
rules(cl)

# make predictions
prediction <- predict(cl, trans)
table(prediction, truth)

# use weighted majority
cl <- CBA_ruleset(Species ~ ., cars, method = "majority", weights = "lift")
cl

prediction <- predict(cl, trans)
table(prediction, truth)




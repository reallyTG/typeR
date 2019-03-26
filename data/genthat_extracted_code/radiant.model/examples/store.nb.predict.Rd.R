library(radiant.model)


### Name: store.nb.predict
### Title: Store predicted values generated in the nb function
### Aliases: store.nb.predict

### ** Examples

result <- nb(titanic, rvar = "survived", evar = c("pclass", "sex", "age"))
pred <- predict(result, pred_data = titanic)
titanic <- store(titanic, pred, name = c("Yes", "No"))





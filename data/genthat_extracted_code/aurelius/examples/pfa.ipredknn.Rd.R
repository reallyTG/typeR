library(aurelius)


### Name: pfa.ipredknn
### Title: PFA Formatting of Fitted knns
### Aliases: pfa.ipredknn

### ** Examples

iris2 <- iris
colnames(iris2) <- gsub('\\.', '_', colnames(iris2))
model <- ipred::ipredknn(Species ~ ., iris2)
model_as_pfa <- pfa(model)




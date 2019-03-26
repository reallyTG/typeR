library(rpart)


### Name: text.rpart
### Title: Place Text on a Dendrogram Plot
### Aliases: text.rpart
### Keywords: tree

### ** Examples

freen.tr <- rpart(y ~ ., freeny)
par(xpd = TRUE)
plot(freen.tr)
text(freen.tr, use.n = TRUE, all = TRUE)




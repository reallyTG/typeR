library(psda)


### Name: ptransform
### Title: Polygon data transformation
### Aliases: ptransform

### ** Examples

cat <- as.factor(sample(1:20, 1000, replace = TRUE))
cv <- runif(1000) #classical variable
cvc <- data.frame(category = cat, cv) 
p <- ptransform(cvc, 4)




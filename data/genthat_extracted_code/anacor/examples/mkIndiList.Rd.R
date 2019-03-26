library(anacor)


### Name: mkIndiList
### Title: Converts Data Frame to Indicator Matrix
### Aliases: mkIndiList
### Keywords: models

### ** Examples

## sleeping bags crisp and numeric
data(sleeping)
sleeping_cat <- sleeping
temp_cat <- cut(sleeping$Temperature, c(-20, -1, 7), labels = c("warm", "cold")) 
sleeping_cat$Temperature <- temp_cat
weight_cat <- cut(sleeping$Weight, c(700, 1100, 2200), labels = c("light", "heavy")) 
sleeping_cat$Weight <- weight_cat
price_cat <- cut(sleeping$Price, c(100, 250, 350, 700), 
labels = c("cheap", "medium", "expensive"))  
sleeping_cat$Price <- price_cat
sleeping_cat
mkIndiList(sleeping_cat)     ## crisp
mkIndiList(sleeping_cat, type = rep("A", ncol(sleeping_cat)))     ## numeric
mkIndiList(sleeping_cat, type = c("A","A","A","C"))     ## mixed

## artificial data fuzzy coding
x1 <- sample(1:6, 20, replace = TRUE) 
x2 <- sample(1:3, 20, replace = TRUE)
data <- data.frame(x1,x2)
knots <- list(c(1,3,5,6), c(1,2,3))
ord <- c(2,1)
mkIndiList(data, type = c("F","F"), knots = knots, ord = ord)

## Also mixed indicator versions are possible
mkIndiList(data, type = c("C","F"), knots = knots, ord = ord)





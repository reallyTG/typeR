library(evtree)


### Name: StatlogHeart
### Title: Statlog Heart
### Aliases: StatlogHeart
### Keywords: datasets

### ** Examples

data("StatlogHeart")
summary(StatlogHeart)
shw <- array(1, nrow(StatlogHeart))
shw[StatlogHeart$heart_disease == "presence"] <- 5
set.seed(1090)
sht <- evtree(heart_disease ~ . , data = StatlogHeart, weights = shw) 
sht
table(predict(sht), StatlogHeart$heart_disease)
plot(sht)




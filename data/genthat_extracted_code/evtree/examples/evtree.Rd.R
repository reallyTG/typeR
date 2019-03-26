library(evtree)


### Name: evtree
### Title: Evolutionary Learning of Globally Optimal Trees
### Aliases: evtree evtree-package
### Keywords: tree

### ** Examples

## regression
set.seed(1090)
airq <- subset(airquality, !is.na(Ozone) & complete.cases(airquality))
ev_air <- evtree(Ozone ~ ., data = airq)
ev_air
plot(ev_air)
mean((airq$Ozone - predict(ev_air))^2)

## classification
## (note that different equivalent "perfect" splits for the setosa species
## in the iris data may be found on different architectures/systems)
ev_iris <- evtree(Species ~ .,data = iris)
## IGNORE_RDIFF_BEGIN
ev_iris
## IGNORE_RDIFF_END
plot(ev_iris)
table(predict(ev_iris), iris$Species)
1 - mean(predict(ev_iris) == iris$Species)




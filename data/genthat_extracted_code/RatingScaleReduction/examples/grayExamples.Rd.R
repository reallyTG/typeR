library(RatingScaleReduction)


### Name: grayExamples
### Title: Examples belonging to both classes
### Aliases: grayExamples

### ** Examples

#generate data

a=c(); attribute=c()
for (i in 1:3){
a <-sample(c(1,2,3), 100, replace=TRUE)
attribute <-cbind(attribute, a)
attribute=data.frame(attribute)
}
colnames(attribute)=c("a1", "a2", "a3")
names(attribute)

decision=sample(c(0,1), 100, replace=TRUE)

#check examples
grayExamples(attribute, decision)




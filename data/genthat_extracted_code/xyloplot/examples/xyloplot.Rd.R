library(xyloplot)


### Name: xyloplot
### Title: Method for creating xyloplots
### Aliases: xyloplot

### ** Examples

xyloplot(rnorm(1000))
xyloplot(
 x=lapply(1:3, function(mean) rnorm(mean=mean, n=1000)), 
 breaks=20,
 col=rainbow(3), 
 main="title")
xyloplot(
 replicate(n=5, simplify=FALSE, 
  expr=factor(sample(c(0.01, 0.1, 0.2, 0.25, 0.5, 1), size=10, replace=TRUE))), 
 col=rainbow(5))
xyloplot(
 sample(c("goldfish","cat","dog","fish","mouse","giraffe"), 
 size=100, replace=TRUE))




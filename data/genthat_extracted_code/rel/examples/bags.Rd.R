library(rel)


### Name: bags
### Title: Bennett, Alpert, and Goldstein's S
### Aliases: bags
### Keywords: univar

### ** Examples

#Sample data: 200 subjects and one 5-category item.
data <- cbind(sample(1:5,200, replace=TRUE),sample(1:5,200, replace=TRUE))

#Analysis
bags(data=data, kat=5, conf.level=0.95)




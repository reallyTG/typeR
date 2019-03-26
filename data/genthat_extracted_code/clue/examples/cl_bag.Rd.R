library(clue)


### Name: cl_bag
### Title: Bagging for Clustering
### Aliases: cl_bag
### Keywords: cluster

### ** Examples

set.seed(1234)
## Run BagClust1 on the Cassini data.
data("Cassini")
party <- cl_bag(Cassini$x, 50, 3)
plot(Cassini$x, col = cl_class_ids(party), xlab = "", ylab = "")
## Actually, using fuzzy c-means as a base learner works much better:
if(require("e1071", quiet = TRUE)) {
    party <- cl_bag(Cassini$x, 20, 3, algorithm = "cmeans")
    plot(Cassini$x, col = cl_class_ids(party), xlab = "", ylab = "")
}




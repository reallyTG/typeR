library(clue)


### Name: cl_predict
### Title: Predict Memberships
### Aliases: cl_predict
### Keywords: cluster

### ** Examples

## Run kmeans on a random subset of the Cassini data, and predict the
## memberships for the "test" data set.
data("Cassini")
nr <- NROW(Cassini$x)
ind <- sample(nr, 0.9 * nr, replace = FALSE)
party <- kmeans(Cassini$x[ind, ], 3)
table(cl_predict(party, Cassini$x[-ind, ]),
      Cassini$classes[-ind])




library(DTRlearn2)


### Name: sim_Kstage
### Title: Simulate a K-stage SMART data
### Aliases: sim_Kstage

### ** Examples

n_train = 100
n_test = 500
n_cluster = 10
pinfo = 10
pnoise = 20

# simulate a 2-stage training set
train = sim_Kstage(n_train, n_cluster, pinfo, pnoise, K=2)

# simulate an independent 2-stage test set with the same centroids of the training set
test = sim_Kstage(n_test, n_cluster, pinfo, pnoise, train$centroids, K=2)






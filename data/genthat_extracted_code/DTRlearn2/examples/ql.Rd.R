library(DTRlearn2)


### Name: ql
### Title: Q-learning for Estimating DTRs
### Aliases: ql
### Keywords: ~kwd1 ~kwd2

### ** Examples

# simulate 2-stage training and test sets
n_train = 100
n_test = 500
n_cluster = 10
pinfo = 10
pnoise = 20

train = sim_Kstage(n_train, n_cluster, pinfo, pnoise, K=2)
H1_train = scale(train$X)
H2_train = scale(cbind(H1_train, train$A[[1]], H1_train * train$A[[1]]))
pi_train = list(rep(0.5, n_train), rep(0.5, n_train))

test = sim_Kstage(n_test, n_cluster, pinfo, pnoise, train$centroids, K=2)
H1_test = scale(test$X)
H2_test = scale(cbind(H1_test, test$A[[1]], H1_test * train$A[[1]]))
pi_test = list(rep(0.5, n_test), rep(0.5, n_test))

ql_train = ql(H=list(H1_train, H2_train), AA=train$A, RR=train$R, K=2, pi=pi_train, m=3)

ql_test = predict(ql_train, H=list(H1_test, H2_test), AA=test$A, RR=test$R, K=2, pi=pi_test)






library(deepNN)


### Name: NNpredict
### Title: NNpredict function
### Aliases: NNpredict

### ** Examples


# Example in context:

## No test: 
download_mnist("mnist.RData") # only need to download once
load("mnist.RData") # loads objects train_set, truth, test_set and test_truth

net <- network( dims = c(784,16,16,10),
                activ=list(ReLU(),ReLU(),softmax()))

netwts <- train(dat=train_set,
                truth=truth,
                net=net,
                eps=0.001,
                tol=0.8, # normally would use a higher tol here e.g. 0.95
                loss=multinomial(),
                batchsize=100)

pred <- NNpredict(  net=net,
                    param=netwts$opt,
                    newdata=test_set,
                    newtruth=test_truth,
                    record=TRUE,
                    plot=TRUE)
## End(No test)

# Example 2

N <- 1000
d <- matrix(rnorm(5*N),ncol=5)

fun <- function(x){
    lp <- 2*x[2]
    pr <- exp(lp) / (1 + exp(lp))
    ret <- c(0,0)
    ret[1+rbinom(1,1,pr)] <- 1
    return(ret)
}

d <- lapply(1:N,function(i){return(d[i,])})

truth <- lapply(d,fun)

net <- network( dims = c(5,10,2),
                activ=list(ReLU(),softmax()))

netwts <- train( dat=d,
                 truth=truth,
                 net=net,
                 eps=0.01,
                 tol=100,            # run for 100 iterations
                 batchsize=10,       # note this is not enough
                 loss=multinomial(), # for convergence
                 stopping="maxit")

pred <- NNpredict(  net=net,
                    param=netwts$opt,
                    newdata=d,
                    newtruth=truth,
                    record=TRUE,
                    plot=TRUE)





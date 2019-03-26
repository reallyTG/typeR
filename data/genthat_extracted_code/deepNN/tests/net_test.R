library(deepNN)

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

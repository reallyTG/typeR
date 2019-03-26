verbose <- FALSE
if(!exists("cl")){
    cl <- makeCluster(2)
    setDefaultCluster(cl=cl)
}
factr <- .01/.Machine$double.eps
set.seed(13)

compareOptim <- function(optim_args, parallel=NULL, tolerance = 1e-5, verbose=FALSE){
    ref <- do.call("optim", c(method="L-BFGS-B", optim_args))
    o <- do.call("optimParallel",
                 c(optim_args, parallel=list(parallel)))
    if(verbose){
        print(ref)
        print(o)
    }
    expect_equal(ref, o, check.attributes = FALSE, tolerance = tolerance)
}

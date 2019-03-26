
context('Test K-means++ Algorithm')

#' @useDynLib GFORCE kmeans_pp_R
test_that("K-means++",{

    K <- 5
    d <- 20
    num_random_exps <- 100
    count_not_perfect <- 0
    total_purity <- 0

    for(i in 1:num_random_exps){
        dat <- gforce.generator(K,d,d,3,graph='DeltaC',cov_gap_mult=4)
        sh <- t(dat$X)%*%dat$X / 20
        result <- .C(kmeans_pp_R,
                     D=as.double(sh),
                     K= as.integer(K),
                     n = as.integer(d),
                     m = as.integer(d),
                     group_assignments = as.integer(rep(0,d)),
                     centers = numeric(K*d),
                     num_iters = as.integer(0),
                     run_time = as.double(0))
        purity_experiment <- purity_measure(result$group_assignments,dat$group_assignments)
        if(purity_experiment != 1){
            count_not_perfect <- count_not_perfect + 1
        }
        total_purity <- total_purity + purity_experiment
    }
    # cat(sprintf('K-means++ Test: %.2f average purity\r\n',total_purity/num_random_exps))
    # cat(sprintf('K-means++ Test: %d / %d perfect recovery\r\n',num_random_exps-count_not_perfect,num_random_exps))
    expect_false(is.nan(total_purity))
    })
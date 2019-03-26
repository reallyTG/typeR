
context("Likelihood Functions")

test_that("profile likelihoods improve likelihood", {

    n1 <- 15
    n2 <- 15
    n <- n1*n2
    locs <- as.matrix( expand.grid( 1:n1, 1:n2 ) )
    ord <- order_maxmin(locs)
    locsord <- locs[ord,]
    m <- 20
    NNarray <- find_ordered_nn(locsord,m=m)
    NNlist <- group_obs(NNarray)

    covparms <- c(2,40,0.8,0.01)
    y <- fast_Gp_sim(covparms,"matern_isotropic",locsord)
    X <- as.matrix(rep(1,n))
    
    # ungrouped
    ll1 <- vecchia_loglik(covparms,"matern_isotropic",y,locsord,NNarray)
    ll2 <- proflik_mean(covparms,"matern_isotropic",y, X, locsord,NNarray)
    ll3 <- proflik_variance(covparms[2:4],"matern_isotropic",y,locsord,NNarray)
    ll4 <- proflik_mean_variance(covparms[2:4],"matern_isotropic",y, X, locsord,NNarray)
    
    expect_true( ll2 > ll1 )
    expect_true( ll3 > ll1 )
    expect_true( ll4 > ll2 )
    expect_true( ll4 > ll3 )
    
    # grouped
    ll1 <- vecchia_loglik_grouped(covparms,"matern_isotropic",y,locsord,NNlist)
    ll2 <- proflik_mean_grouped(covparms,"matern_isotropic",y, X, locsord,NNlist)
    ll3 <- proflik_variance_grouped(covparms[2:4],"matern_isotropic",y,locsord,NNlist)
    ll4 <- proflik_mean_variance_grouped(covparms[2:4],"matern_isotropic",y, X, locsord,NNlist)
    
    expect_true( ll2 > ll1 )
    expect_true( ll3 > ll1 )
    expect_true( ll4 > ll2 )
    expect_true( ll4 > ll3 )

})
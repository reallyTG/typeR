
context("Likelihood Functions")

test_that("likelihood approximations are exact when m = n-1", {

    n1 <- 12
    n2 <- 12
    n <- n1*n2
    locs <- as.matrix( expand.grid( 1:n1, 1:n2 ) )
    ord <- order_maxmin(locs)
    locsord <- locs[ord,]
    m <- n-1
    NNarray <- find_ordered_nn(locsord,m=m)
    NNlist <- group_obs(NNarray)

    covparms <- c(2,40,0.8,0.01)
    y <- fast_Gp_sim(covparms,"matern_isotropic",locsord)
    
    covmat <- matern_isotropic(covparms,locsord)
    cholmat <- t(chol(covmat))
    logdet_exact <- 2*sum(log(diag(cholmat)))
    z <- forwardsolve(cholmat,y)
    quadform_exact <- c(crossprod(z))
    
    # ungrouped
    ll0 <- vecchia_loglik(covparms,"matern_isotropic",rep(0,n),locsord,NNarray)
    logdet_approx <- -2*( ll0 + n/2*log(2*pi) )
    ll1 <- vecchia_loglik(covparms,"matern_isotropic",y,locsord,NNarray)
    quadform_approx <- -2*( ll1 - ll0 )

    expect_equal( logdet_exact, logdet_approx )
    expect_equal( quadform_exact, quadform_approx )
    
    # grouped
    ll0 <- vecchia_loglik_grouped(covparms,"matern_isotropic",rep(0,n),locsord,NNlist)
    logdet_approx <- -2*( ll0 + n/2*log(2*pi) )
    ll1 <- vecchia_loglik_grouped(covparms,"matern_isotropic",y,locsord,NNlist)
    quadform_approx <- -2*( ll1 - ll0 )

    expect_equal( logdet_exact, logdet_approx )
    expect_equal( quadform_exact, quadform_approx )

})
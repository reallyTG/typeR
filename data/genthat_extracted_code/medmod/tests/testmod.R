context('mod')

test_that('moderation works', {
    
    set.seed(1234)
    X <- rnorm(100)
    M <- rnorm(100)
    X_M <- X*M
    Y <- 0.7*X + 0.1*M + 4.2*X_M + rnorm(100)
    data <- data.frame(X=X, M=M, Y=Y)
    
    r <- medmod::mod(data, dep = "Y", pred = "X", mod = "M", simpleSlopeEst = TRUE)
    
    mod <- r$mod$asDF
    ss <- r$simpleSlope$estimates$asDF
    
    # Test mediation effects
    expect_equal(-0.4706588, mod$est[2],  tolerance=1e-5)
    expect_equal(3.388984e-07, mod$p[2],  tolerance=1e-5)
    expect_equal('X:M', as.character(mod$term[3]))
    
    # Test simple slope effects
    expect_equal(2.159019, ss$z[1],  tolerance=1e-5)
    expect_equal(0.5417532, ss$se[2],  tolerance=1e-5)
    expect_equal(5.249576, ss$est[3],  tolerance=1e-5)

})
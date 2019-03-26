context('med')

test_that('mediation works', {
    
    set.seed(1234)
    X <- rnorm(100)
    M <- 0.5*X + rnorm(100)
    Y <- 0.7*M + rnorm(100)
    data <- data.frame(X=X, M=M, Y=Y)
    
    r <- medmod::med(data, dep = "Y", pred = "X", med = "M", paths = TRUE)
    
    med <- r$med$asDF
    path <- r$paths$asDF
    
    # Test mediation effects
    expect_equal(0.03635467, med$est[2],  tolerance=1e-5)
    expect_equal(4.934837e-05, med$p[1],  tolerance=1e-5)
    expect_equal('Total', as.character(med$effect[3]))
    
    # Test path estimates
    expect_equal(0.7883193, path$est[2],  tolerance=1e-5)
    expect_equal(3.967471e-06, path$p[1],  tolerance=1e-5)
    expect_equal(0.1044457, path$se[3],  tolerance=1e-5)
    
})
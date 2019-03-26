context("qgev")

test_that("qgev behaves as it should", {

    ## get the probabilities that we'll use and sort them
    ## into ascending order for safekeeping
    set.seed(20101111)
    probabilities <- sort(runif(10))
  
    core.sanity.test <- function(xi) {
        base.quantiles <- qgev(probabilities, 0, 1, xi)
        ## check that the values are ascending
        expect_true(all(diff(base.quantiles)>=0), "qgev:ascendingquantiles")
        ## and check that we're descending correctly for upper tail
        bq2 <- qgev(probabilities, 0, 1, xi, lower.tail=FALSE)
        expect_true(all(diff(bq2)<=0), "qgev:descendingquantiles")
        ## does lower.tail work
        expect_equal(base.quantiles,
                     qgev(1 - probabilities, 0, 1, xi, lower.tail=FALSE),
                     label="qgev: lower.tail works correctly")
        ## does log.p work?
        expect_equal(base.quantiles, 
                     qgev(log(probabilities), 0, 1, xi, log.p=TRUE),
                     label="qgev: log.p works")
        ## check shift and scale property
        sigma <- rexp(1)
        mu    <- runif(1, -5, 5)
        shifted <- mu + sigma * base.quantiles
        expect_equal(shifted, qgev(probabilities, mu, sigma, xi),
                     label="qgev: shift and scale")
    } # Close core.sanity.test
    
    lapply(c(0, seq(-5, 5, length.out=10)), core.sanity.test)
    
    ## known values
    expect_equal(-log(log(2)), qgev(0.5, 0, 1, 0),
                 label="qgev: median match at zero xi")
    xi <- seq(-2, 2, length=10)
    expect_equal(qgev(0.5, 0, 1, xi),
                 expm1(-log(log(2))*xi) / xi,
                 label="qgev: median match at nonzero xi")
})

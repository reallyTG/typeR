test_that("Conforming Matrix Dimensions", {
    
    set.seed(1234)

    n.predators <- 10
    n.prey <- 4
    n.fa <- 3
    
    ### Predators
    predators <- gtools::rdirichlet(n.predators, alpha = rep(1, n.fa)) * 100
    
    ### Prey
    prey <- gtools::rdirichlet(n.prey, alpha=rep(1, n.fa))
    
    ### Calibration coefficients: wrong dimensions
    cal <- matrix(rep(gtools::rdirichlet(1, alpha=rep(1, (n.fa - 1))), n.predators), (n.fa - 1), n.predators)
    
    ### Call QFASA with data frames of wrong dimensions
    expect_error(p.QFASA(data.frame(predators), data.frame(prey), data.frame(cal), dist.meas = 1), "non-conformable arrays")
})

library(lg)


### Name: ind_test
### Title: Independence tests
### Aliases: ind_test

### ** Examples


    # Remember to increase the number of bootstrap samplesin preactical
    # implementations.

    ## Not run: 
##D 
##D     # Test for independence between two vectors, iid data.
##D     x1 <- cbind(rnorm(100), rnorm(100))
##D     lg_object1 <- lg_main(x1)
##D     test_result1 = ind_test(lg_object1,
##D                             bootstrap_type = "plain",
##D                             n_rep = 20)
##D 
##D     # Test for serial dependence in time series, lag 1
##D     data(EuStockMarkets)
##D     logreturns <- apply(EuStockMarkets, 2, function(x) diff(log(x)))
##D     x2 <- cbind(logreturns[1:100,1], logreturns[2:101, 1])
##D     lg_object2 <- lg_main(x2)
##D     test_result2 = ind_test(lg_object2,
##D                             bootstrap_type = "plain",
##D                             n_rep = 20)
##D 
##D     # Test for cross-dependence, lag 1
##D     x3 <- cbind(logreturns[1:100,1], logreturns[2:101, 2])
##D     lg_object3 <- lg_main(x3)
##D     test_result3 = ind_test(lg_object3,
##D                             bootstrap_type = "block",
##D                             n_rep = 20)
##D     
## End(Not run)





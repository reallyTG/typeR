library(lg)


### Name: cont_test
### Title: Test for financial contagion
### Aliases: cont_test

### ** Examples


   # Run the test on some built-in stock data
   data(EuStockMarkets)
   x <- apply(EuStockMarkets, 2, function(x) diff(log(x)))[, 1:2]

   # Define the crisis and non-crisis periods (arbitrarily for this simple
   # example)
   non_crisis <- x[1:100, ]
   crisis     <- x[101:200, ]

   # Create the lg-objects, with parameters that match the applications in the
   # original publication describibg the test
   lg_object_nc <- lg_main(non_crisis, est_method = "5par",
                           transform_to_marginal_normality = FALSE)
   lg_object_c  <- lg_main(crisis, est_method = "5par",
                           transform_to_marginal_normality = FALSE)

   ## Not run: 
##D    # Run the test (with very few resamples for illustration)
##D    test_result <- cont_test(lg_object_nc, lg_object_c,
##D                             n_rep = 10)
##D    
## End(Not run)





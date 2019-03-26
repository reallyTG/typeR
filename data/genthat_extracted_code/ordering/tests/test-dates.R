context("dates")


# monotonic, sorted 
# increasing, decreasing 
# strictly,


dts_increasing <- structure(c(1518508800, 1518512400, 1518516000, 1518519600, 1518523200, 
1518526800, 1518530400, 1518534000), class = c("POSIXct", 
"POSIXt"), tzone = "")

test_that( "dates", { 
  
  dts_increasing %>% is_monotonic %>% expect_true()
  dts_increasing %>% rev() %>% is_monotonic %>% expect_true()

    
    
})



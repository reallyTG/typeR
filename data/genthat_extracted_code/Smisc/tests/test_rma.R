context("rma()")

test_that("rma() removes all objects from .GlobalEnv", {

   # Create some objects in the global environment
   assign("x", 10, envir = .GlobalEnv)
   assign("y", c("this", "that"), envir = .GlobalEnv)
   assign("z", rnorm(20), envir = .GlobalEnv)

   # Verify we have at least three objects in the global environment
   expect_true(length(ls(envir = .GlobalEnv)) >= 3)
   
   # Remove them all
   rma()

   # Make sure they're gone
   expect_true(length(ls(envir = .GlobalEnv)) == 0)
   
})

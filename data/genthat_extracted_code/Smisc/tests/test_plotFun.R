context("plotFun()")

test_that("plotFun() runs without error in parallel", {

  # A handful of beta density functions, note how they take a single argument
  fList <- list(function(x) dbeta(x, 10, 10),
                function(y) dbeta(y, 3, 3),
                function(z) dbeta(z, 0.5, 0.50))

  pdf(file = "tmp/test_plotFun.pdf")
  
  # Plot them all on the same plot
  plotFun(fList, c(0.0001, 0.9999), njobs = 2, ylim = c(0, 3.5),
          col = c("Red", "Black", "Blue"), lty = rep(1, 3),
          xlab = "x", ylab = expression(f(x)),
          legendLabels = c("a = 10, b = 10", "a = 3, b = 3", "a = 0.5, b = 0.5"),
          relX = 0.6, relY = 1, lwd = 3, main = "Gamma Densities")


  dev.off()

  expect_true(file.exists("tmp/test_plotFun.pdf"))

  unlink("tmp/test_plotFun.pdf")
  
})

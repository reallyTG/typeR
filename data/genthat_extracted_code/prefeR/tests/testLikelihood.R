# Create a simple matrix to test our data on 
data <- as.matrix(data.frame(x = c(1, 0, 1), y = c(0, 1, 1)))
priors <-  c(Normal(1, 0.5), Exp(0.5))

p <- prefEl(data = data, priors = priors)
p$Sigma <- 0.1 * diag(2)

# An arbitrary guess
x <- c(1.0, 0.5)

# Make sure values match several hard-coded values calculated offline
expect_equal(prefeR:::.getLogStrictProb(x, list(1,2), p), -0.1413058, tolerance = 0.001)
expect_equal(prefeR:::.getLogStrictProb(x, list(2,1), p), -2.026650, tolerance = 0.001)
expect_equal(prefeR:::.getLogIndifProb(x, list(1,2),  p), -0.7188213, tolerance = 0.001)

# Ensure our priors are properly being taken into account
expect_equal(prefeR:::.calculateLogProb(x, p), priors[[1]](x[1]) + priors[[2]](x[2]))
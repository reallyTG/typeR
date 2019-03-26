library(sigmoid)
x = -5:5
expect_equal(x, sigmoid(sigmoid(x), inverse=TRUE) )
expect_equal(x, sigmoid(sigmoid(x, method='Gompertz'), method='Gompertz', inverse=TRUE) )

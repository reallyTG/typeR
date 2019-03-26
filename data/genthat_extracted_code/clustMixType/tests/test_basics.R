context("Basic tests.\n")

library(clustMixType)

# generate test data from example
set.seed(42)
n   <- 100
prb <- 0.9
muk <- 1.5 
clusid <- rep(1:4, each = n)

x1 <- sample(c("A","B"), 2*n, replace = TRUE, prob = c(prb, 1-prb))
x1 <- c(x1, sample(c("A","B"), 2*n, replace = TRUE, prob = c(1-prb, prb)))
x1 <- as.factor(x1)

x2 <- sample(c("A","B"), 2*n, replace = TRUE, prob = c(prb, 1-prb))
x2 <- c(x2, sample(c("A","B"), 2*n, replace = TRUE, prob = c(1-prb, prb)))
x2 <- as.factor(x2)

x3 <- c(rnorm(n, mean = -muk), rnorm(n, mean = muk), rnorm(n, mean = -muk), rnorm(n, mean = muk))
x4 <- c(rnorm(n, mean = -muk), rnorm(n, mean = muk), rnorm(n, mean = -muk), rnorm(n, mean = muk))

x <- data.frame(x1,x2,x3,x4)


kpres <- kproto(x, 4)
pred  <- predict(kpres, x)
test_that("resulting objects are as expected",{
  expect_is(kpres, "kproto")
  expect_is(pred$cluster, "integer")
  expect_equal(length(pred$cluster), nrow(x))
  expect_is(pred$dists, "matrix")
  expect_equal(nrow(pred$dists), nrow(x))
  expect_equal(ncol(pred$dists), length(kpres$size))
  expect_true(length(kpres$size) <= 4)
  expect_equal(sort(unique(kpres$cluster)), 1:length(kpres$size))
}
)

test_that("different initializations work properly",{
  expect_is(kproto(x, c(1,101,201,301)), "kproto")
  expect_error(kproto(x, c(-1,101,201,301)))            # initialization by vector of indizes
  expect_error(kproto(x, c(1,101,201,401)))
  expect_is(kproto(x, x[c(1,101,201,301),]), "kproto")  # initialization by df
  expect_message(kproto(x, x[c(1,1,2,3,3),]),"Equal prototypes merged. Cluster number reduced to:3")
  expect_is(kproto(x, x[1,]), "kproto")                 # one single observation
  expect_is(kproto(x, x[1,])$centers, "data.frame")
  expect_equal(nrow(kproto(x, x[1,])$centers), 1)
  expect_is(kproto(x, 1), "kproto")                 # k = 1
}
)

test_that("different ways of specifying lambda work properly",{
  expect_is(kproto(x, 4, lambda = 1), "kproto")
  expect_equal(kproto(x, 4, lambda = 0.834)$lambda, 0.834)
  expect_is(kproto(x, 4, lambda = 2:5), "kproto")           # vector
  expect_equal(kproto(x, 4, lambda = 2:5)$lambda, 2:5)
  expect_error(kproto(x, 4, lambda = 1:3))
  expect_error(kproto(x, 4, lambda = -1:2))
  expect_error(kproto(x, 4, lambda = c(0,0,0,0)))
  expect_error(kproto(x, 4, lambda = 0))
  expect_is(kproto(x, 4, lambda = c(0,0,0,1)), "kproto")
}
)


test_that("lambdaest does what it is supposed to do",{
  expect_is(lambdaest(x), "numeric")
  expect_is(lambdaest(x, outtype = "vector"), "numeric")
  expect_equal(length(lambdaest(x, outtype = "vector")), ncol(x))                         # correct dimension of lambda 
  expect_is(lambdaest(x, outtype = "variation"), "numeric")
  expect_equal(length(lambdaest(x, outtype = "variation")), ncol(x))
  expect_equal(lambdaest(x, outtype = "vector"), 1/lambdaest(x, outtype = "variation"))   # compare lambdas variations 
  expect_equal(kproto(x, 2, lambda = lambdaest(x))$lambda, lambdaest(x))                                          # estimated lambda used by kproto 
  expect_equal(kproto(x, 2, lambda = lambdaest(x, outtype = "vector"))$lambda, lambdaest(x, outtype = "vector"))  # estimated lambda used by kproto  
}
)

test_that("also works for 1D",{
    expect_is(kproto(x[,c(1,3)], 4), "kproto")
    expect_error(kproto(x[,1:2], 4))
    expect_error(kproto(x[,3:4], 4))
}
)

x2 <- data.frame(V1 = factor(c("A","A","B","B")), V2 = c(-3,-1,1,3)) 
kpres <- kproto(x2, x2[c(1,3),], lambda = 1)
test_that("distances are computed correctly",{
  expect_equal(as.numeric(kpres$dists[,1]), c(1,1,10,26))
}
)

x3 <- x4 <- x
x3$x1[1] <- NA
x4$x1[1] <- x4$x2[1] <- x4$x3[1] <- x4$x4[1] <-  NA
test_that("message for NAs.",{
  expect_message(kproto(x3, 4),"Observations with NAs are removed.")
  expect_warning(kproto(x4, 4, na.rm = FALSE),"No meaningful cluster assignment possible for observations where all variables NA.")}
)




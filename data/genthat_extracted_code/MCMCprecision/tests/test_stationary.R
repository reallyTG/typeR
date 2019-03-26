
set.seed(23523)

P <- matrix(c(.1,.5,.4,
              0, .5,.5,
              .9,.1,0), ncol = 3, byrow=TRUE)
ev <- Re(eigen(t(P))$vectors[,1])
pi <- ev/sum(ev)

z <- rmarkov(1e4, P)


test_that("'stationary' works", {
  expect_silent(s1 <- stationary(z, progress = FALSE))
  est <- unname(s1$pp[,1])
  expect_length(est, 3)
  expect_equal(est, pi, tol = .01)
  se <- s1$pp[,"SD"]
  expect_true(all(pi < est + 3*se, pi > est - 3*se))

  expect_silent(s2 <- stationary(z, method = "base", progress = FALSE))
  expect_equal(s1$pp, s2$pp, tol = .01)

  expect_silent(s3 <- stationary(z, method = "eigen", progress = FALSE))
  expect_equal(s1$pp, s3$pp, tol = .01)

  N <- transitions(z)
  expect_silent(s4 <- stationary(N = N, progress = FALSE))
  expect_equal(s1$pp, s4$pp, tol = .01)

  # expect_silent(s5 <- stationary(N = N, cpu = 2))
  # expect_equal(s1$pp, s5$pp, tol = .01)
})

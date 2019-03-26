n1 <- NewInput.MM1(lambda=8, mu=14, n=0)
n2 <- NewInput.MM1(lambda=0, mu=9, n=0)
n3 <- NewInput.MM1(lambda=6, mu=17, n=0)
n4 <- NewInput.MM1(lambda=0, mu=7, n=0)
m  <- c(0, 0.2, 0.56, 0.24, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
prob <- matrix(data=m, nrow=4, ncol=4, byrow=TRUE)

m_ojn <- QueueingModel(NewInput.OJN(prob, n1, n2, n3, n4))

w_ojn <- W(m_ojn)
res_w_ojn <- 0.39

l_ojn <- L(m_ojn)
res_l_ojn <- 5.46


n <- 2
n1 <- NewInput.MM1(lambda=0, mu=1/0.2, n=0)
n2 <- NewInput.MM1(lambda=0, mu=1/0.4, n=0)
z <- 0
operational <- FALSE
prob <- matrix(data=c(0.5, 0.5, 0.5, 0.5), nrow=2, ncol=2, byrow=TRUE)
m_cjn <- QueueingModel(NewInput.CJN(prob, n, z, operational, 0, 0.001, n1, n2))

w_cjn <- W(m_cjn)
res_w_cjn <- 0.47

l_cjn <- L(m_cjn)
res_l_cjn <- 2


context("Network Basic performace metrics")

test_that('Average network time',
{
  expect_equal(w_ojn,   res_w_ojn,   tolerance = 0.1)
  expect_equal(w_cjn,   res_w_cjn,   tolerance = 0.1)
})

test_that('Average number of users in the network',
{
  expect_equal(l_ojn,   res_l_ojn,   tolerance = 0.1)
  expect_equal(l_cjn,   res_l_cjn,   tolerance = 0.1)
})



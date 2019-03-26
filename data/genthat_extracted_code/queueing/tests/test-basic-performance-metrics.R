m_mm1   <- QueueingModel(NewInput.MM1(lambda=1/4, mu=1/3, n=0))
m_mmc   <- QueueingModel(NewInput.MMC(lambda=5, mu=10, c=2, n=0, method=0))
m_mm1k  <- QueueingModel(NewInput.MM1K(lambda=5, mu=5.714, k=15))
m_mmck  <- QueueingModel(NewInput.MMCK(lambda=8, mu=4, c=5, k=12))
m_mmcc  <- QueueingModel(NewInput.MMCC(lambda=3, mu=0.25, c=15))
m_mmInf <- QueueingModel(NewInput.MMInf(lambda=0.25, mu=4, n=0))
m_mm1kk <- QueueingModel(NewInput.MM1KK(lambda=0.25, mu=4, k=2, method=3))
m_mmckk <- QueueingModel(NewInput.MMCKK(lambda=8, mu=2, c=5, k=12, method=0))


w_mm1 <- W(m_mm1)
res_w_mm1 <- 12

w_mmc <- W(m_mmc)
res_w_mmc <- 0.1066667

w_mm1k <- W(m_mm1k)
res_w_mm1k <- 0.9907347

w_mmck <- W(m_mmck)
res_w_mmck <- 0.2549332

w_mmcc <- W(m_mmcc)
res_w_mmcc <- 4

w_mmInf <- W(m_mmInf)
res_w_mmInf <- 0.25

w_mm1kk <- W(m_mm1kk)
res_w_mm1kk <- 0.2647059

w_mmckk <- W(m_mmckk)
res_w_mmckk <- 1.075013


wq_mm1 <- Wq(m_mm1)
res_wq_mm1 <- 9

wq_mmc <- Wq(m_mmc)
res_wq_mmc <- 0.007

wq_mm1k <- Wq(m_mm1k)
res_wq_mm1k <- 0.816

wq_mmck <- Wq(m_mmck)
res_wq_mmck <- 0.005

wq_mmcc <- Wq(m_mmcc)
res_wq_mmcc <- 0

wq_mmInf <- Wq(m_mmInf)
res_wq_mmInf <- 0

wq_mm1kk <- Wq(m_mm1kk)
res_wq_mm1kk <- 0.015

wq_mmckk <- Wq(m_mmckk)
res_wq_mmckk <- 0.58


l_mm1 <- L(m_mm1)
res_l_mm1 <- 3

l_mmc <- L(m_mmc)
res_l_mmc <- 0.53

l_mm1k <- L(m_mm1k)
res_l_mm1k <- 4.86

l_mmck <- L(m_mmck)
res_l_mmck <- 2.04

l_mmcc <- L(m_mmcc)
res_l_mmcc <- 10.97

l_mmInf <- L(m_mmInf)
res_l_mmInf <- 0.0625

l_mm1kk <- L(m_mm1kk)
res_l_mm1kk <- 0.12

l_mmckk <- L(m_mmckk)
res_l_mmckk <- 10.75


lq_mm1 <- Lq(m_mm1)
res_lq_mm1 <- 2.25

lq_mmc <- Lq(m_mmc)
res_lq_mmc <- 0.033

lq_mm1k <- Lq(m_mm1k)
res_lq_mm1k <- 4.0006

lq_mmck <- Lq(m_mmck)
res_lq_mmck <- 0.04

lq_mmcc <- Lq(m_mmcc)
res_lq_mmcc <- 0

lq_mmInf <- Lq(m_mmInf)
res_lq_mmInf <- 0

lq_mm1kk <- Lq(m_mm1kk)
res_lq_mm1kk <- 0.0069

lq_mmckk <- Lq(m_mmckk)
res_lq_mmckk <- 5.7501

context("Basic performace metrics")

test_that('Average system time',
{
  expect_equal(w_mm1,   res_w_mm1,   tolerance = 0.1)
  expect_equal(w_mmc,   res_w_mmc,   tolerance = 0.1)
  expect_equal(w_mm1k,  res_w_mm1k,  tolerance = 0.1)
  expect_equal(w_mmck,  res_w_mmck,  tolerance = 0.1)
  expect_equal(w_mmcc,  res_w_mmcc,  tolerance = 0.1)
  expect_equal(w_mmInf, res_w_mmInf, tolerance = 0.1)
  expect_equal(w_mm1kk, res_w_mm1kk, tolerance = 0.1)
  expect_equal(w_mmckk, res_w_mmckk, tolerance = 0.1)
})


test_that('Average queue time',
{
  expect_equal(wq_mm1,   res_wq_mm1,   tolerance = 0.1)
  expect_equal(wq_mmc,   res_wq_mmc,   tolerance = 0.1)
  expect_equal(wq_mm1k,  res_wq_mm1k,  tolerance = 0.1)
  expect_equal(wq_mmck,  res_wq_mmck,  tolerance = 0.1)
  expect_equal(wq_mmcc,  res_wq_mmcc,  tolerance = 0.1)
  expect_equal(wq_mmInf, res_wq_mmInf, tolerance = 0.1)
  expect_equal(wq_mm1kk, res_wq_mm1kk, tolerance = 0.1)
  expect_equal(wq_mmckk, res_wq_mmckk, tolerance = 0.1)
})


test_that('Average number of users in the system',
{
  expect_equal(l_mm1,   res_l_mm1,   tolerance = 0.1)
  expect_equal(l_mmc,   res_l_mmc,   tolerance = 0.1)
  expect_equal(l_mm1k,  res_l_mm1k,  tolerance = 0.1)
  expect_equal(l_mmck,  res_l_mmck,  tolerance = 0.1)
  expect_equal(l_mmcc,  res_l_mmcc,  tolerance = 0.1)
  expect_equal(l_mmInf, res_l_mmInf, tolerance = 0.1)
  expect_equal(l_mm1kk, res_l_mm1kk, tolerance = 0.1)
  expect_equal(l_mmckk, res_l_mmckk, tolerance = 0.1)
})


test_that('Average number of users in queue',
{
  expect_equal(lq_mm1,   res_lq_mm1,   tolerance = 0.1)
  expect_equal(lq_mmc,   res_lq_mmc,   tolerance = 0.1)
  expect_equal(lq_mm1k,  res_lq_mm1k,  tolerance = 0.1)
  expect_equal(lq_mmck,  res_lq_mmck,  tolerance = 0.1)
  expect_equal(lq_mmcc,  res_lq_mmcc,  tolerance = 0.1)
  expect_equal(lq_mmInf, res_lq_mmInf, tolerance = 0.1)
  expect_equal(lq_mm1kk, res_lq_mm1kk, tolerance = 0.1)
  expect_equal(lq_mmckk, res_lq_mmckk, tolerance = 0.1)
})

m_mm1   <- QueueingModel(NewInput.MM1(lambda=1/4, mu=1/3, n=0))
m_mmc   <- QueueingModel(NewInput.MMC(lambda=5, mu=10, c=2, n=0, method=0))
m_mm1k  <- QueueingModel(NewInput.MM1K(lambda=5, mu=5.714, k=15))
m_mmck  <- QueueingModel(NewInput.MMCK(lambda=8, mu=4, c=5, k=12))
m_mmcc  <- QueueingModel(NewInput.MMCC(lambda=3, mu=0.25, c=15))
m_mmInf <- QueueingModel(NewInput.MMInf(lambda=0.25, mu=4, n=0))
m_mm1kk <- QueueingModel(NewInput.MM1KK(lambda=0.25, mu=4, k=2, method=3))
m_mmckk <- QueueingModel(NewInput.MMCKK(lambda=8, mu=2, c=5, k=12, method=0))


context("Model Class")

test_that('Classess',
{
  expect_that(m_mm1,   is_a("o_MM1"))
  expect_that(m_mmc,   is_a("o_MMC"))
  expect_that(m_mm1k,  is_a("o_MM1K"))
  expect_that(m_mmck,  is_a("o_MMCK"))
  expect_that(m_mmcc,  is_a("o_MMCC"))
  expect_that(m_mmInf, is_a("o_MMInf"))
  expect_that(m_mm1kk, is_a("o_MM1KK"))
  expect_that(m_mmckk, is_a("o_MMCKK"))
})




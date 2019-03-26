context("valmeta 6. plot functionalities")
skip_on_cran()

data(EuroSCORE)

test_that("Class of forest plot", {
  
  # Call to plot.valmeta()
  fit <- with(EuroSCORE, valmeta(cstat=c.index, cstat.se=se.c.index, 
                                 cstat.cilb = c.index.95CIl, cstat.ciub = c.index.95CIu,
                                 cstat.cilv = 0.95, N=n, O=n.events, slab=Study))
  fig1 <- plot(fit)
  expect_is(fig1, "ggplot")
  
  fit2 <- valmeta(cstat=c.index, cstat.se=se.c.index, cstat.cilb=c.index.95CIl,
                  cstat.ciub=c.index.95CIu, N=n, O=n.events, data=EuroSCORE)
  fig2 <- plot(fit2)
  expect_is(fig2, "ggplot")
  
  # Direct call to forest()
  oe.ad <- oecalc(N=n, O=n.events, E=e.events, slab=Study, data=EuroSCORE)
  fig2 <- forest(theta=oe.ad$theta, theta.ci.lb=oe.ad$theta.cilb, theta.ci.ub=oe.ad$theta.ciub, 
                theta.slab=rownames(oe.ad), xlab="O:E ratio", refline=1)
  
  expect_is(fig2, "ggplot")
  
})





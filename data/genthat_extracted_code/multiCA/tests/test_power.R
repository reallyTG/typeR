
  context("Power calculations")
  
  test_that("non-centrality calculation works", {
    x <- qchisq(0.75, df=10) 
    expect_equal(cnonct(x, df=10, p=0.75), 0)
    expect_equal(cnonct(x, df=10, p=0.9), NA)
    expect_equal(pchisq(x, df=10, ncp=cnonct(x, p=0.6, df=10)), 0.6)
  })

  test_that("calculated power is independent of the input format", {
    pmat <- rbind(seq(0.1, 0.4, length=5),
                  seq(0.2, 0.3, length=5),
                  seq(0.3, 0.1, length=5),
                  seq(0.4, 0.2, length=5))
    res0 <- power.multiCA.test(N=100, pmatrix=pmat)
    expect_equal(res0, power.multiCA.test(N=100, p.start=pmat[,1], p.end=pmat[,5], G=5))
    expect_equal(res0, power.multiCA.test(N=100, p.start=pmat[,1], p.ave=rowMeans(pmat),
                 G=5))
    expect_equal(res0, power.multiCA.test(N=100, p.end=pmat[,5], p.ave=rowMeans(pmat),
                 G=5))
    expect_equal(res0, power.multiCA.test(N=100, p.ave=rowMeans(pmat), 
                 slopes=pmat[,2]-pmat[,1], G=5))
    expect_equal(res0, power.multiCA.test(N=100, p.start=pmat[,1], 
                 slopes=pmat[,2]-pmat[,1], G=5))
    expect_equal(res0, power.multiCA.test(N=100, p.end=pmat[,5], 
                 slopes=pmat[,2]-pmat[,1], G=5))
  })

  test_that("Power is computed correctly", {
    pmat <- rbind(seq(0.1, 0.4, length=5),
                  seq(0.2, 0.3, length=5),
                  seq(0.3, 0.1, length=5),
                  seq(0.4, 0.2, length=5))
    res0 <- power.multiCA.test(N=100, pmatrix=pmat)
    expect_equal(100, power.multiCA.test(power=res0$power, pmatrix=pmat)$n)
    expect_equal(0.1, power.multiCA.test(N=100, p.ave=c(0.5, rep(0.1, 5)),
                 slopes=rep(0,6), G=6, sig.level=0.1)$power)
  })

  test_that("G is properly identified", {
    expect_error(power.multiCA.test(N=100, p.start=c(0.1, 0.9), p.end=c(0.8, 0.2)),
                 "G needs to be specified")
    expect_equal(power.multiCA.test(N=100, p.start=c(0.1, 0.9), p.end=c(0.8, 0.2),
                 n.prop=rep(1,4))$G, 4)
    expect_equal(power.multiCA.test(N=100, p.start=c(0.1, 0.9), p.end=c(0.8, 0.2),
                 scores=1:4)$G, 4)
  })

  test_that("Scaling of n.prop does not matter", {
    expect_equal(
       power.multiCA.test(N=100, p.start=c(0.1, 0.9), p.end=c(0.8, 0.2), G=6,
                               n.prop=rep(1,6)),
       power.multiCA.test(N=100, p.start=c(0.1, 0.9), p.end=c(0.8, 0.2), G=6,
                               n.prop=rep(2,6)))
  })

  test_that("p.ave and slopes are checked for validity", {
    expect_error(power.multiCA.test(N=100, p.start=c(0.1, 0.3), p.end=c(0.8, 0.2), G=3),
                "slopes should sum to 0")
    expect_error(power.multiCA.test(N=100, p.ave=c(0.1, 0.8), slopes=c(0.1, -0.1), G=4),
                  "p.ave should sum to 1")
    expect_error(power.multiCA.test(N=100, p.ave=c(0.1, 0.9), slopes=c(0.1, -0.1), G=4),
                  "valid probability matrix")
    expect_error(power.multiCA.test(N=100, p.ave=c(0.4, 0.6), slopes=c(0.1, 0.1), G=3),
                "slopes should sum to 0")
  })

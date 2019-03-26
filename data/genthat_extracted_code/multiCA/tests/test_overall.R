
  context("Multinomial CA test")
  test_that("Overall test works on stroke data", {
    data(stroke)
    res0 <- multiCA.test(Type ~ Year, weights=Freq, data=stroke, p.adjust="none")
    expect_equivalent(res0$overall$statistic, 40.06580869)

    strk.mat <- xtabs(Freq ~ Type + Year, data=stroke)
    res1 <- multiCA.test(strk.mat, p.adjust="none")
    expect_equal(res0$overall[c("statistic","paramater", "p.value")], 
                 res1$overall[c("statistic","paramater", "p.value")])    
    expect_equivalent(res0$individual, res1$individual)

    res2 <- multiCA.test(strk.mat, outcomes=1:5, p.adjust="none")
    expect_equal(res1$overall[c("statistic","paramater", "p.value")], 
                 res2$overall[c("statistic","paramater", "p.value")])    
    expect_equivalent(res1$individual, res2$individual)
  })

  test_that("Holm-Shaffer consistent with Holm", {
    data(stroke)
    res0 <- multiCA.test(Type ~ Year, weights=Freq, data=stroke, p.adjust="none")
    expect_equal(attr(res0$individual, "method"), "none")

    res1 <- multiCA.test(Type ~ Year, weights=Freq, data=stroke, p.adjust="Holm-Shaffer")
    expect_equal(attr(res1$individual, "method"), "Holm-Shaffer")
    expect_equivalent(sort(p.adjust(res0$individual, method="holm"))[-2],
                      sort(res1$individual)[-2])    

    res0a <- multiCA.test(Type ~ Year, weights=Freq, data=stroke, p.adjust="none", 
                          outcomes=1:4)
    res1a <- multiCA.test(Type ~ Year, weights=Freq, data=stroke, p.adjust="Holm-Shaffer", 
                          outcomes=1:4)
    expect_equivalent(sort(p.adjust(res0a$individual, method="holm")),
                      sort(res1a$individual))    
})

  test_that("Closed set works with 3 outcomes", {
    data(stroke)
    strk.mat <- xtabs(Freq ~ Type + Year, data=stroke)    
    res0 <- multiCA.test(strk.mat[1:3,], p.adjust="none")
    res1 <- multiCA.test(strk.mat[1:3,], p.adjust="closed.set")
    expect_equivalent(pmax(res0$individual, res0$overall$p.value),
                      res1$individual)    
})

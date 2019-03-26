context("extremalIndex")

test_that("extremalIndex behaves as it should", {
  skip_on_cran()
  skip_on_travis()
  tol <- 0.0001
  th <- quantile(rain,seq(0.7,0.99,len=10))
  for(i in 1:length(th)){
    texmex.ei <- extremalIndex(rain,threshold=th[i])
    Ferro.ei  <- .extRemes.exi.intervals(rain > th[i])

    Ferro.clust <- .extRemes.decluster.intervals(rain> th[i], Ferro.ei)
    texmex.clust <- declust(texmex.ei)

    Ferro.runs <-  .extRemes.decluster.runs(rain> th[i], 3)
    texmex.runs <- declust(rain,threshold=th[i],r=3,verbose=FALSE)

    expect_that(texmex.ei$EIintervals, equals(Ferro.ei, tolerance = tol),
                label="extremalIndex: extRemes implementation")
    expect_that(texmex.clust$sizes, equals(Ferro.clust$size, tolerance = tol),
                label="extremalIndex: declustering")

  expect_that(texmex.runs$nCluster, equals(Ferro.runs$nc), label="extremalIndex:runsdeclusteringnc")
  expect_that(texmex.runs$sizes, equals(Ferro.runs$size), label="extremalIndex:runsdeclusteringsizes")
  }

  # check passing data through data frames

  data <- data.frame(RAIN=rain[1:1000], rnorm=rnorm(1000), num=1:1000)
  extremalIndexRangeFit(RAIN, data,verbose=FALSE,nboot=10,nint=7)
  extremalIndexRangeFit(data$RAIN,verbose=FALSE,nboot=10,nint=7)

  data.de <- declust(RAIN,data=data,th=th[1],verb=FALSE)
  resp.de <- declust(data$RAIN,th=th[1],verb=FALSE)

  data.ei <- extremalIndex(RAIN,data=data,threshold=th[1])
  resp.ei <- extremalIndex(data$RAIN,threshold=th[1])

  expect_that(data.ei$EIintervals, equals(resp.ei$EIintervals, tolerance=tol),
              label="extremalIndex: using data frame to pass response")
  expect_that(data.de$clusters, equals(resp.de$clusters, tolerance=tol),
              label="extremalIndex: using data frame to pass numeric response to declustering")

  # test covariate fitting

  ei <- extremalIndex(SO2,data=winter,threshold=20)
  d <- declust(ei)
  evm(d,phi=~NO)

  expect_that(662.9508, equals(as.numeric(AIC(evm(d, phi=~NO))[1]), tolerance=tol),
              label="extremalIndex: covariate fitting after declustering")
  expect_that(662.8874, equals(as.numeric(AIC(evm(d, phi=~NO2))[1]), tolerance=tol),
              label="extremalIndex: covariate fitting after declustering")
  expect_that(651.8747, equals(as.numeric(AIC(evm(d, phi=~O3))[1]), tolerance=tol),
              label="extremalIndex: covariate fitting after declustering")
  expect_that(663.0015, equals(as.numeric(AIC(evm(d, phi=~PM10))[1]), tolerance=tol),
              label="extremalIndex: covariate fitting after declustering")
  expect_that(651.7874, equals(as.numeric(AIC(evm(d, phi=~O3, xi=~NO))[1]), tolerance=tol),
              label="extremalIndex: covariate fitting after declustering")
  expect_that(653.2512, equals(as.numeric(AIC(evm(d, phi=~O3, xi=~NO2))[1]), tolerance=tol),
              label="extremalIndex: covariate fitting after declustering")
  expect_that(653.6385, equals(as.numeric(AIC(evm(d, phi=~O3, xi=~O3))[1]), tolerance=tol),
              label="extremalIndex: covariate fitting after declustering")
  expect_that(652.9238, equals(as.numeric(AIC(evm(d, phi=~O3, xi=~PM10))[1]), tolerance=tol),
              label="extremalIndex: covariate fitting after declustering")
}
)

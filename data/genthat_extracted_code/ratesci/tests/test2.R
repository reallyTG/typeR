library(ratesci)
context("p-values")

#n1 <- 150
#n2 <- 50
n1 <- 40
n2 <- 20
xs<-expand.grid(0:n1,0:n2)
x1 <- xs[,1]
x2 <- xs[,2]


for (skew in c(TRUE, FALSE)) {

  test_that("p-values consistent with confidence interval", {
    expect_equal(
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RD",precis=10)$estimates[,"Lower"] > 0 |
        scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RD",precis=10)$estimates[,"Upper"] < 0,
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RD",precis=10)$pval[,"pval2sided"]<0.05
    )
    expect_equal(
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RD",precis=10)$estimates[,"Lower"] > 0,
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RD",precis=10)$pval[,"pval_right"] < 0.025
    )
    expect_equal(
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RD",precis=10)$estimates[,"Upper"] < 0,
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RD",precis=10)$pval[,"pval_left"] < 0.025
    )
    expect_equal(
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RR",distrib="poi",precis=10)$estimates[,"Lower"] > 1 |
        scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RR",distrib="poi",precis=10)$estimates[,"Upper"] < 1,
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RR",distrib="poi",precis=10)$pval[,"pval2sided"]<0.05
    )
    expect_equal(
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RR",distrib="poi",precis=10,theta0=2)$estimates[,"Lower"] > 2,
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RR",distrib="poi",precis=10,theta0=2)$pval[,"pval_right"] < 0.025
    )
    expect_equal(
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RR",distrib="poi",precis=10,theta0=2)$estimates[,"Upper"] < 2,
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="RR",distrib="poi",precis=10,theta0=2)$pval[,"pval_left"] < 0.025
    )
    expect_equal(
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="OR",precis=10)$estimates[,"Lower"] > 1 |
        scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="OR",precis=10)$estimates[,"Upper"] < 1,
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="OR",precis=10)$pval[,"pval2sided"]<0.05
    )
    expect_equal(
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="OR",precis=10)$estimates[,"Lower"] > 1,
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="OR",precis=10)$pval[,"pval_right"] < 0.025
    )
    expect_equal(
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="OR",precis=10)$estimates[,"Upper"] < 1,
      scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,contrast="OR",precis=10)$pval[,"pval_left"] < 0.025
    )
  })

}


n <- 10
combos <- NULL
for(a in 0:n) {
  for(b in 0:(n-a)) {
    for(c in 0:(n-a-b)) {
      for(d in 0:(n-a-b-c)) {
        combos <- rbind(combos,c(a=a,b=b,c=c,d=d))
      }
    }
  }
}

test_that("p-values consistent with paired confidence interval", {
  expect_equal(
    (((sapply(1:dim(combos)[1],function(i) pairbinci(x=combos[i,],contrast="RD")$estimates[1]>0)))),
    (((sapply(1:dim(combos)[1],function(i) pairbinci(x=combos[i,],contrast="RD")$pval[,"pval_right"] < 0.025 ))))
  )
})
for (contrast in c("RR","OR")) {
  test_that("p-values consistent with paired confidence interval", {
    expect_equal(
      (((sapply(1:dim(combos)[1],function(i) pairbinci(x=combos[i,],contrast=contrast,method_OR="SCAS")$estimates[1] > 1)))),
      (((sapply(1:dim(combos)[1],function(i) pairbinci(x=combos[i,],contrast=contrast,method_OR="SCAS")$pval[,"pval_right"] < 0.025 ))))
    )
  })
}


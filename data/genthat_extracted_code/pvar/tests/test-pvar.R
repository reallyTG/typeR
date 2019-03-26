

context("pvar")

test_that("Basic", {
  set.seed(12345)
  PV <- pvar(rnorm(10), 2)
  expect_that(PV, is_a('pvar'))
  expect_that(summary(PV), is_a('summary.pvar'))
  # expect_null(plot(PV))
  
  expect_that( pvar(rnorm(10), 0.5), is_a("pvar"))
  expect_that( pvar(rnorm(10), 1), is_a("pvar"))
  expect_that( pvar(rnorm(10), 2), is_a("pvar"))
  expect_that( pvar(rnorm(10), 2)$value, is_more_than(0))  
  
  expect_that( pvar(0, 2)$value,  equals(c("p-variation"=0)))
  expect_that( pvar(0:1, 2)$value,  equals(c("p-variation"=1)))
  expect_that( pvar(0:2, 2)$value,  equals(c("p-variation"=4)))
  expect_that( pvar(0:3, 2)$value,  equals(c("p-variation"=9)))
  
  for(i in 1:5){
    x = rbridge(1, 1000)
    expect_that(pvar(x, 2), is_identical_to(pvar(x, 2)))
  }
})

test_that("Exeptions", {
  set.seed(12345)
  expect_that( pvar(rnorm(10), 0),  throws_error())
  expect_that( pvar(vector("numeric", 0), 2),  throws_error())
  expect_that( pvar(c(NA,0), 2),  gives_warning())
})


test_that("Compare with old version", {
  set.seed(12345)
  f <- system.file("extdata", "caselist_oldversion.RData", package="pvar")
  load(f)
  for(i in seq_along(caselist)){
    caselist[[i]]$input$LSI = caselist[[i]]$input$sizeN
    caselist[[i]]$input$sizeN = NULL
    
    result <- do.call("pvar", caselist[[i]]$input)
    expect_that(caselist[[i]]$output$value, equals(result$value))
    if(caselist[[i]]$input$p!=1){
      expect_that(caselist[[i]]$output$Partition, equals(result$partition))
    }
  }
})

test_that("Compare with curent version", {
  set.seed(12345)
  f <- system.file("extdata", "caselist.RData", package="pvar")
  load(f)
  for(i in seq_along(caselist)){
    result <- do.call("pvar", caselist[[i]]$input)
    expect_that(caselist[[i]]$output, equals(result))
  }
})

test_that("Test by LSI, n , generations", {
  set.seed(12345)
  
  test_pvar <- function(x, p){
    AnsList = mapply(FUN=pvar, LSI = seq(from = 1, to = length(x)+1, by=2), MoreArgs=list(x=x, p=p), SIMPLIFY=FALSE)
    all(sapply(AnsList, identical, y = AnsList[[1]]))
  }

  expect_that(all(replicate(5, test_pvar(rwiener(50), 0.5))), is_true())
  expect_that(all(replicate(5, test_pvar(rwiener(50), 1))), is_true())
  expect_that(all(replicate(50, test_pvar(rwiener(50), 2))), is_true())
  expect_that(all(replicate(10, test_pvar(rwiener(1), 2))), is_true())
  expect_that(all(replicate(10, test_pvar(rwiener(2), 2))), is_true())

  
  expect_that(all(replicate(50, test_pvar(rwiener(50), 4))), is_true())
  expect_that(all(replicate(50, test_pvar(rwiener(50), 10))), is_true())
  
  expect_that(all(replicate(10, test_pvar(rbridge(50), 2))), is_true())
  expect_that(all(replicate(10, test_pvar(rcumbin(50), 2))), is_true())
}) 
  

test_that("AddPvar:random", {
  set.seed(12345)
  test_AddPvar <- function(x, p){
    N = length(x)
    n1 = sample(N, 1);
    n2 = sample(N-1, 1);
    all(
      IsEqualPvar(pvar(as.vector(x), p), AddPvar(pvar(x[1:n1], p), pvar(x[(n1):N], p), AddIfPossible=TRUE))
      ,IsEqualPvar(pvar(as.vector(x), p), pvar(x[1:n1], p) + pvar(x[(n1):N], p))
      ,IsEqualPvar(pvar(as.vector(x), p), AddPvar(pvar(x[1:n2], p), pvar(x[(n2+1):N], p), AddIfPossible=FALSE))
    )
  }
  expect_that(all(replicate(20, test_AddPvar(rwiener(50), 0.71))), is_true())
  expect_that(all(replicate(20, test_AddPvar(rbridge(50), 0.71))), is_true())
  expect_that(all(replicate(200, test_AddPvar(rcumbin(50), 0.71))), is_true())
  
  expect_that(all(replicate(20, test_AddPvar(rwiener(50), 1))), is_true())
  expect_that(all(replicate(20, test_AddPvar(rbridge(50), 1))), is_true())
  expect_that(all(replicate(200, test_AddPvar(rcumbin(50), 1))), is_true())
  
  expect_that(all(replicate(20, test_AddPvar(rwiener(50), 2))), is_true())
  expect_that(all(replicate(20, test_AddPvar(rbridge(50), 2))), is_true())
  expect_that(all(replicate(200, test_AddPvar(rcumbin(50), 2))), is_true())    
})  


test_that("AddPvar:selected", {
  set.seed(12345)
  test_AddPvar <- function(x1, x2){
    sunf <- function(x1, x2, p){
      PV1 = pvar(x1, p); 
      PV2 = pvar(x2, p); 
      yy1 = c(x1, x2)
      yy2 = yy1
      if(x1[length(x1)]==x2[1]){
        yy2 = c(x1, x2[-1])    
      }
      all(
        IsEqualPvar(pvar(yy1, p) , AddPvar(PV1, PV2, AddIfPossible=FALSE))
        ,IsEqualPvar(pvar(yy2, p) , AddPvar(PV1, PV2, AddIfPossible=TRUE))
        ,IsEqualPvar(pvar(yy2, p) ,PV1+PV2)
      )
    }
    all(sunf(x1, x2, 0.5), sunf(x1, x2, 1), sunf(x1, x2, 2), sunf(x1, x2, sqrt(7)))
  }
  expect_that(test_AddPvar(0, 0), is_true())
  expect_that(test_AddPvar(0, 1), is_true())
  expect_that(test_AddPvar(1, 0), is_true())
  expect_that(test_AddPvar(0:1, 1), is_true())
  expect_that(test_AddPvar(0:1, 0), is_true())
  expect_that(test_AddPvar(0, 0:1), is_true())
  expect_that(test_AddPvar(1, 0:1), is_true())
  expect_that(test_AddPvar(0:1, 0:1), is_true())
  expect_that(test_AddPvar(0:1, c(1,1)), is_true())
  expect_that(test_AddPvar(c(1,1), c(1,0)), is_true())
  expect_that(test_AddPvar(c(0,0), c(0,0)), is_true())

})  



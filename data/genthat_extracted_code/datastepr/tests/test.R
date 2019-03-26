test_that("datastep", {
  expect_equal(toDf(list(a = 1, b = 2, data.frame()), data.frame()),
               data.frame(a = 1, b = 2))
  
  step = dataStepClass$new()
  
  frame = data.frame(x = 1:10)
   
  stairs = function() {
    step$begin(environment())
    step$set(frame)
    y = x + 1
    step$output()
    step$end(stairs)
  }
   
  stairs()
   
  expect_equal(step$results,
               data.frame(y = 2:11, x = 1:10) )
  
  step = dataStepClass$new()
  
  xFrame = data.frame(x = 0:9)
  
  y_initial = data.frame(y = 1)
  
  stairs = function(...) {
    step$begin(environment())
    if (step$i == 1) step$set(y_initial)
    if (step$i > 1) lagx = x
    step$set(xFrame)
    if (step$i > 1) y = y + dydx*(x - lagx)
    dydx = x*y
    step$output()
    step$end(stairs)
  }
  
  stairs()
  
  expect_equal(step$results$dydx[10], 3265920)
  
  step = dataStepClass$new()
  
  xFrame = data.frame(x = 0:9)
  
  stairs = function(...) {
    step$begin(environment())
    if (step$i == 1) step$set(y_initial)
    if (step$i > 1) lagx = x
    step$set(xFrame)
    if (step$i > 1) y = y + dydx*(x - lagx)
    dydx = x*y
    step$output(list("x" = x, "y" = y))
    step$end(stairs)
  }
  
  stairs()
  
  expect_equal(names(step$results), c("x", "y"))
  
  step = dataStepClass$new()
  
  xFrame = data.frame(x = 9:0, by = 10:1)
  
  stairs = function() {
    step$begin(environment())
    if (step$i == 1) step$set(y_initial)
    if (step$i > 1) lagx = x
    step$set(xFrame, by)
    if (step$i > 1) y = y + dydx*(x - lagx)
    dydx = x*y
    step$output(list("x" = x, "y" = y))
    step$end(stairs)
  }
  
  stairs()
  
  expect_equal(step$results$y[10], 362880)
  
})

library(gasfluxes)
context("input checks")
test_that("inputCheck does not change its input", {
  set.seed(42)
  dat <- data.table(ID= rep(1:2, each=4),
                    ID1 = 1,
                    V= rep(1:2, each=4),
                    A= rep(1:2, each=4),
                    time = rep(1:4, 2),
                    C = 320 + rnorm(8))
  expect_identical(dat, {gasfluxes:::checkInput(dat,.id=c("ID", "ID1"), .V="V", .A="A", .times="time", .C="C"); dat})
})

test_that("inputCheck catches non-finite values", {
  set.seed(42)
  dat <- data.table(ID= rep(1:2, each=4),
                    V= rep(1:2, each=4),
                    A= rep(1:2, each=4),
                    time = rep(1:4, 2),
                    C = 320 + rnorm(8))
  dat[1, c("V", "C") := NA ]
  expect_error(gasfluxes:::checkInput(dat, .id="ID", .V="V", .A="A", .times="time", .C="C"), 
               "Non-finite values (such as NA) in V, C. Remove them from input, e.g., using na.omit.", fixed =TRUE)
  dat[, c("V", "C") := list(as.numeric(V), as.numeric(C)) ]
  dat[1, c("V", "C") := -Inf ]
  expect_error(gasfluxes:::checkInput(dat,.id="ID", .V="V", .A="A", .times="time", .C="C"), 
               "Non-finite values (such as NA) in V, C. Remove them from input, e.g., using na.omit.", fixed =TRUE)
})

test_that("inputCheck catches non-numeric values", {
  set.seed(42)
  dat <- data.table(ID= rep(1:2, each=4),
                    V= as.character(rep(1:2, each=4)),
                    A= as.character(rep(1:2, each=4)),
                    time = rep(1:4, 2),
                    C = 320 + rnorm(8))
  expect_error(gasfluxes:::checkInput(dat, .id="ID", .V="V", .A="A", .times="time", .C="C"), 
               'V, A not numeric.', fixed =TRUE)
})

test_that("inputCheck catches non-unique V values in flux", {
  set.seed(42)
  dat <- data.table(ID= rep(c("a", "b"), each=4),
                    V= c(rep(1, 4), 1:4),
                    A= rep(1:2, each=4),
                    time = rep(1:4, 2),
                    C = 320 + rnorm(8))
  expect_error(gasfluxes:::checkInput(dat, .id="ID", .V="V", .A="A", .times="time", .C="C"), 
               "V not unique in flux ID b.", fixed =TRUE)
})


test_that("inputCheck catches negative V values", {
  set.seed(42)
  dat <- data.table(ID= rep(1:2, each=4),
                    V= rep(-(1:2), each=4),
                    A= rep(1:2, each=4),
                    time = rep(1:4, 2),
                    C = 320 + rnorm(8))
  expect_error(gasfluxes:::checkInput(dat, .id="ID", .V="V", .A="A", .times="time", .C="C"), 
               "Not all values in V are > 0.", fixed =TRUE)
})

test_that("inputCheck catches unsorted time values", {
  set.seed(42)
  dat <- data.table(ID= rep(1:2, each=4),
                    V= rep(1:2, each=4),
                    A= rep(1:2, each=4),
                    time = rep(4:1, 2),
                    C = 320 + rnorm(8))
  expect_error(gasfluxes:::checkInput(dat, .id="ID", .V="V", .A="A", .times="time", .C="C"), 
               "time not sorted in flux ID 1.")
})

test_that("inputCheck catches duplicated time values", {
  set.seed(42)
  dat <- data.table(ID= rep(1:2, each=4),
                    V= rep(1:2, each=4),
                    A= rep(1:2, each=4),
                    time = rep(1, 8),
                    C = 320 + rnorm(8))
  expect_error(gasfluxes:::checkInput(dat, .id="ID", .V="V", .A="A", .times="time", .C="C"), 
               "Duplicated time values in flux ID 1.", fixed =TRUE)
})


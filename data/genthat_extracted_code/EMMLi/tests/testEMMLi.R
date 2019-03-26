context('Test that EMMLi works correctly.')


test_that('EMMLi runs and creates output.', {

  set.seed(1)
  file <- paste0(tempdir(), 'EMMLiTest.csv')
  
  dat <- matrix(runif(36, -1, 1), ncol = 6, nrow = 6)
  diag(dat) <- 1

  mod1 <- data.frame(landmarks = letters[1:6], 
               modelA = rep(c(1, 2), each = 3),
               modelB = rep(c(1,2), 3),
               modelC = rep(c(1:3), 2)) 


  EMMLi(dat, 20, mod1, file)

  expect_true(file.exists(file))
  
  xx <- read.csv(file)

  expect_true(exists('xx'))

  # Bit of a mess because the csv is multiple tables.
  # So extract the top table only
  top <- xx[1:(which(xx[, 1] == '')[1] - 2), ]

  expect_true(sum(top$dAICc == 0) == 1)
  expect_true(all(as.character(top$dAICc) >= 0))
  expect_true(all(as.character(top$Model_l) >= 0))
  expect_true(all(as.character(top$Post_Pob) >= 0))
  expect_true(all(as.character(top$AICc) >= 0))

  unlink(file)

})


test_that('EMMLi can take mod with numbers in column names.', {

  set.seed(1)
  file <- paste0(tempdir(), 'EMMLiTest.csv')
  
  dat <- matrix(runif(36, -1, 1), ncol = 6, nrow = 6)
  diag(dat) <- 1

  mod1 <- data.frame(landmarks = letters[1:6], 
               model1 = rep(c(1, 2), each = 3),
               model2 = rep(c(1,2), 3),
               model3= rep(c(1:3), 2)) 



  EMMLi(dat, 20, mod1, file)

  expect_true(file.exists(file))
  
  xx <- read.csv(file)

  expect_true(exists('xx'))

  # Bit of a mess because the csv is multiple tables.
  # So extract the top table only
  top <- xx[1:(which(xx[, 1] == '')[1] - 2), ]

  expect_true(sum(top$dAICc == 0) == 1)


  unlink(file)


})




test_that('EMMLi is invariant to model order.', {

  set.seed(1)
  file <- paste0(tempdir(), 'EMMLiTest.csv')
  
  dat <- matrix(runif(36, -1, 1), ncol = 6, nrow = 6)
  diag(dat) <- 1

  mod1 <- data.frame(landmarks = letters[1:6], 
               model1 = rep(c(1, 2), each = 3),
               model2 = rep(c(2, 1), each = 3)) 



  EMMLi(dat, 20, mod1, file)

  expect_true(file.exists(file))
  
  xx <- read.csv(file)

  expect_true(exists('xx'))

  # Bit of a mess because the csv is multiple tables.
  # So extract the top table only
  top <- xx[1:(which(xx[, 1] == '')[1] - 2), ]

  expect_true(length(unique(top$MaxL)) == 3)
  expect_true(length(unique(top$dAICc)) == 3)

  unlink(file)


})





test_that('EMMLi can take mod with NAs.', {

  set.seed(1)
  file <- paste0(tempdir(), 'EMMLiTest.csv')
  
  dat <- matrix(runif(36, -1, 1), ncol = 6, nrow = 6)
  diag(dat) <- 1

  mod1 <- data.frame(landmarks = letters[1:6], 
               model1 = rep(c(1, 2), each = 3),
               model2 = rep(c(1,2), 3),
               model3= c(rep(c(1,2), 2), NA, NA)) 



  EMMLi(dat, 20, mod1, file)

  expect_true(file.exists(file))
  
  xx <- read.csv(file)

  expect_true(exists('xx'))

  # Bit of a mess because the csv is multiple tables.
  # So extract the top table only
  top <- xx[1:(which(xx[, 1] == '')[1] - 2), ]

  expect_true(sum(top$dAICc == 0) == 1)


  unlink(file)

})






test_that('abs argument does not break EMMLi output.', {

  set.seed(1)
  file <- paste0(tempdir(), 'EMMLiTest.csv')
  
  dat <- matrix(runif(36, -1, 1), ncol = 6, nrow = 6)
  diag(dat) <- 1

  mod1 <- data.frame(landmarks = letters[1:6], 
               modelA = rep(c(1, 2), each = 3),
               modelB = rep(c(1,2), 3),
               modelC = rep(c(1:3), 2)) 


  EMMLi(dat, 20, mod1, file, abs = FALSE)

  expect_true(file.exists(file))
  
  xx <- read.csv(file)

  expect_true(exists('xx'))

  # Bit of a mess because the csv is multiple tables.
  # So extract the top table only
  top <- xx[1:(which(xx[, 1] == '')[1] - 2), ]

  expect_true(sum(top$dAICc == 0) == 1)
  expect_true(all(as.character(top$dAICc) >= 0))
  expect_true(all(as.character(top$Model_l) >= 0))
  expect_true(all(as.character(top$Post_Pob) >= 0))
  expect_true(all(as.character(top$AICc) >= 0))


  # Should give different output to abs = TRUE


  EMMLi(dat, 20, mod1, file)

  expect_true(file.exists(file))
  
  xx2 <- read.csv(file)


  expect_false(identical(xx[1:9, -1], xx2[1:9, -1]))

  unlink(file)

})






test_that('EMMLi outputs correctly.', {

  # saveAs = NULL -> only return
  # saveAs = directory -> return values and save values

  set.seed(1)
  file <- paste0(tempdir(), 'EMMLiTest.csv')
  
  dat <- matrix(runif(36, -1, 1), ncol = 6, nrow = 6)
  diag(dat) <- 1

  mod1 <- data.frame(landmarks = letters[1:6], 
               modelA = rep(c(1, 2), each = 3),
               modelB = rep(c(1,2), 3),
               modelC = rep(c(1:3), 2)) 


  out <- EMMLi(dat, 20, mod1, saveAs = NULL, abs = FALSE)

  expect_false(file.exists(file))

  out2 <- EMMLi(dat, 20, mod1, saveAs = file, abs = FALSE)

  expect_true(file.exists(file))
  xx <- read.csv(file)

  expect_true(exists('xx'))

  # Bit of a mess because the csv is multiple tables.
  # So extract the top table only
  top <- do.call(cbind, lapply(xx[1:(which(xx[, 1] == '')[1] - 2), -1], function(x) as.numeric(as.character(x))))



  expect_equal(out, out2)
  expect_equivalent(top, out$results)

  unlink(file)

})





test_that('pprob argument works properly', {

  set.seed(1)
  
  dat <- matrix(runif(36, -1, 1), ncol = 6, nrow = 6)
  diag(dat) <- 1

  mod1 <- data.frame(landmarks = letters[1:6], 
               modelA = rep(c(1, 2), each = 3),
               modelB = rep(c(1,2), 3),
               modelC = rep(c(1:3), 2)) 

  
  out <- EMMLi(dat, 20, mod1)
  out2 <- EMMLi(dat, 20, mod1, pprob = 0.0001)

  expect_true(length(out$rho) < length(out2$rho))

})




test_that('Macaca dataset works with EMMLi', {

  x <- EMMLi(macacaCorrel, 42, macacaModels, saveAs = NULL)


  # Some tests compared to previous runs that are in supp. mat.
  expect_equal(unname(x$results[1:6, 4]),
    c(-4737.7414674388,-4797.9615394801,-4795.9527651549,-4988.1904037954,-5225.6309993272,-5078.9039254507))

})






test_that('EMMLi can take mod as character, factor or integer', {

  set.seed(1)
  
  dat <- matrix(runif(36, -1, 1), ncol = 6, nrow = 6)
  diag(dat) <- 1

  mod1 <- data.frame(landmarks = letters[1:6], 
               modelA = rep(c(1, 2), each = 3),
               modelB = rep(c(1,2), 3),
               modelC = rep(c(1:3), 2)) 


  mod2 <- data.frame(landmarks = letters[1:6], 
               modelA = rep(letters[1:2], each = 3),
               modelB = rep(letters[1:2], 3),
               modelC = rep(letters[1:3], 2)) 


  mod3 <- data.frame(landmarks = letters[1:6], 
               modelA = factor(rep(letters[1:2], each = 3)),
               modelB = factor(rep(letters[1:2], 3)),
               modelC = factor(rep(letters[1:3], 2))) 
  
  out <- EMMLi(dat, 20, mod1)
  out2 <- EMMLi(dat, 20, mod2)
  out3 <- EMMLi(dat, 20, mod3)

  expect_equal(out, out2)
  expect_equal(out2, out3)

})




test_that('EMMLi errors if mod is a mix of integers and factors', {

  set.seed(1)
  
  dat <- matrix(runif(36, -1, 1), ncol = 6, nrow = 6)
  diag(dat) <- 1

  mod1 <- data.frame(landmarks = letters[1:6], 
               modelA = factor(rep(c(1, 2), each = 3)),
               modelB = rep(c(1,2), 3),
               modelC = rep(c(1:3), 2)) 



  expect_error(EMMLi(dat, 20, mod1))

})




test_that('EMMLi can take mod as character or factor with na', {

  set.seed(1)
  
  dat <- matrix(runif(49, -1, 1), ncol = 7, nrow = 7)
  diag(dat) <- 1

  mod1 <- data.frame(landmarks = letters[1:7], 
               modelA = c(rep(c(1, 2), each = 3), NA),
               modelB = c(rep(c(1, 2), times = 3), NA),
               modelC = c(rep(c(1:3), 2), NA)) 


  mod2 <- data.frame(landmarks = letters[1:7], 
               modelA = c(rep(letters[1:2], each = 3), NA),
               modelB = c(rep(letters[1:2], times = 3), NA),
               modelC = c(rep(letters[1:3], 2), NA)) 


  mod3 <- data.frame(landmarks = letters[1:7], 
               modelA = factor(c(rep(letters[1:2], each = 3), NA)),
               modelB = factor(c(rep(letters[1:2], times = 3), NA)),
               modelC = factor(c(rep(letters[1:3], 2), NA))) 
  
  out <- EMMLi(dat, 20, mod1)
  out2 <- EMMLi(dat, 20, mod2)
  out3 <- EMMLi(dat, 20, mod3)

  expect_equal(out, out2)
  expect_equal(out2, out3)

})


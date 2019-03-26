context('rate')

# simultate test data
set.seed(5)
p18 <- data.table( OBS=round(runif(36)*10), PYRS=round(runif(36)*10000), AGEGROUP=1:18, COV = rep(c(1,2), each = 18))
set.seed(5)
p20 <- data.table( OBS=round(runif(20)*10), PYRS=round(runif(20)*10000), AGEGROUP=1:20, COV = rep(c(1,2), each = 20))
set.seed(5)
p101 <- data.table( OBS=round(runif(101)*10), PYRS=round(runif(101)*10000), AGEGROUP=1:101, COV = rep(c(1,2), each = 101))
p18b <- data.table(p18)
setnames(p18b, c('OBS','PYRS','AGEGROUP'), c('obs','pyrs','agegroup'))
wv <- c(.1,.1,.1,.2,.2,.2,.2,.3,.3,.4,.5,.5,.5,.4,.4,.3,.2,.1)

# test_that("ratesplines", {
#   library(data.table)
#   library(splines)
#   data <- ratesplines(data = p18, obs = 'OBS', pyrs = 'PYRS', print = 'COV', spline = 'AGEGROUP')
#   
# 
#   
#   
#   
# 
# })

test_that("rate works with different weights", {
  w1 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = c(1:18))
  w2 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = 'world_2000_20of5')
  w3 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = 'cohort')
  w4 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = NULL, weights = NULL)
  w5 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = NULL, adjust = NULL, weights = NULL)
  
  expect_equal(sum(w1$PYRS), p18[,sum(PYRS)])
  expect_equal(sum(w2$OBS), p20[,sum(OBS)])
  expect_equal(sum(w3$OBS), p20[,sum(OBS)])
  expect_equal(w4$rate, p20[,list(sum(OBS)/sum(PYRS)), by ='COV'][, V1])
  expect_equal(w5$rate, p20[,list(sum(OBS)/sum(PYRS))][, V1])
  expect_is(w1, 'rate')
  expect_is(w2, 'rate')
  expect_is(w2, 'data.frame')
  if(getOption("popEpi.datatable")) {
    expect_is(w2, 'data.table')
  }
})

test_that("rate CIs and SEs are correct", {
  
  ci <-data.table(agegroup = c(1,2,3,4),
                  obs=c(4,13,8,7),
                  pyrs=c(96,237,105,32),
                  rate=c(4.2,5.5,7.6,21.9),
                  std.pop=c(2773,2556,1113,184))
  
  a1 <- ci[,sum(obs/pyrs*std.pop)/sum(std.pop)] # oikea estimaatti
  a2 <- ci[,sqrt(sum(std.pop^2*((obs/pyrs)*(1-obs/pyrs))/pyrs))/sum(std.pop)] # myös oikea tulos  
  
  ci0 <- rate(data = ci, obs = 'obs', pyrs = 'pyrs', print = NULL, adjust = 'agegroup', weights = list(agegroup = c(2773,2556,1113,184)))
  expect_equal(ci0[,SE.rate.adj], a2, tolerance=0.0005) # test
  expect_equal(ci0[,rate.adj],a1)

  # another...
  ci <-data.table(agegroup = c(1,2,3,4),
                  obs=c(4,13,8,7),
                  pyrs=c(960,2370,1050,320),
                  rate=c(4.2,5.5,7.6,21.9),
                  std.pop=c(2773,2556,1113,184))
  
  a1 <- ci[,sum(obs/pyrs*std.pop)/sum(std.pop)] # oikea estimaatti
  a2 <- ci[,sqrt(sum(std.pop^2*((obs/pyrs)*(1-obs/pyrs))/pyrs))/sum(std.pop)] # myös oikea tulos  
  
  ci0 <- rate(data = ci, obs = 'obs', pyrs = 'pyrs', print = NULL, adjust = 'agegroup', weights = list(agegroup = c(2773,2556,1113,184)))
  expect_equal(c(ci0$rate.adj.lo, ci0$rate.adj.hi),c(a1 - a2*1.96, a1 + a2*1.96), tolerance = 0.0006)
  expect_gt(ci0[,SE.rate.adj], a2) # WHYY?!
  expect_equal(ci0[,rate.adj],a1) # ok
})

test_that("makeWeightsDT works in rate", {
  set.seed(5)
  p18 <- data.table( OBS=round(runif(36)*10), PYRS=round(runif(36)*10000), AGEGROUP=1:18, COV = rep(c(1,2), each = 18))
  op <- c('OBS',  'PYRS')
  mw1 <- makeWeightsDT(p18, adjust = substitute(factor(AGEGROUP, 1:18, 1:18)), weights = wv, print = NULL, values = list(op))
  mw2 <- makeWeightsDT(p18, adjust = NULL, weights = NULL, print = substitute(COV), values = list(op))
  
  attlist <- attr( mw1, 'makeWeightsDT')
  
  expect_equal(c(attlist$adVars, attlist$vaVars, 'weights'), c('factor','OBS','PYRS','weights') )
  
  expect_equal(mw1[,as.character(factor)], as.character(1:18))
  expect_equal(mw2[,OBS], p18[,sum(OBS), by=COV][,V1])
})


test_that("names dont cause problems", {
  w1 <- rate(data = p18b, obs = 'obs', pyrs = 'pyrs', print = 'COV', adjust = 'agegroup', weights = 'nordic')
  w2 <- rate(data = p18b, obs = 'obs', pyrs = 'pyrs', print = 'COV', adjust = 'agegroup', weights = 'cohort')
  w3 <- rate(data = p18b, obs =  obs,  pyrs =  pyrs,  print =  COV,  adjust =  agegroup,  weights = 'cohort')
  w5 <- rate(data = p18b, obs = 'obs', pyrs = 'pyrs', print = 'COV', adjust = 'agegroup', weights = 'world_1966_18of5')
  w6 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = 'world_2000_20of5')
  w7a <- rate(data = p20, obs = OBS, pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = 'world_2000_20of5')
  w7b <- rate(data = p20, obs = OBS, pyrs = PYRS, print = 'COV', adjust = 'AGEGROUP', weights = 'world_2000_20of5')
  
  wr <- p18b[,list(obs=sum(obs),pyrs =sum(pyrs)), by ='COV']
  
  expect_equal(w2$obs, w1$obs)
  expect_equal(w2$pyrs, w1$pyrs)
  expect_equal(wr$obs, w1$obs)
  expect_equal(wr$pyrs, w1$pyrs)
  expect_equal(w2, w3, check.attributes = FALSE)
})


test_that("rate works with different weights an subset", {
  s0 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = NULL, adjust = 'AGEGROUP', weights = c(1:18))
  s0 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = NULL, adjust = 'AGEGROUP', weights = c(1:18), subset = COV==1)
  s1 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = c(1:18), subset = COV==1)
  s2 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP',  weights = 'world_2000_20of5', subset = COV == 2)
  s3 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = 'cohort', subset = COV==1)
  s4 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = NULL, weights = NULL, subset = AGEGROUP != 1)
  s5 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = NULL, adjust = NULL, weights = NULL, subset = COV == 1)
  
  
  expect_equal(sum(s1$PYRS), p18[COV==1,sum(PYRS)])
  expect_equal(sum(s2$OBS), p20[COV==2,sum(OBS)])
  expect_equal(sum(s3$OBS), p20[COV==1,sum(OBS)])
  expect_equal(s4$rate, p20[AGEGROUP!= 1,list(sum(OBS)/sum(PYRS)), by ='COV'][, V1])
  expect_equal(s5$rate, p20[COV==1,list(sum(OBS)/sum(PYRS))][, V1])
  expect_is(s3, 'rate')
})

test_that("rate works with different weights and syntaxies", {
  
  
  wv <- c(.1,.1,.1,.2,.2,.2,.2,.3,.3,.4,.5,.5,.5,.4,.4,.3,.2,.1)
  
  s0 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = NULL, adjust = NULL)
  s1 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', adjust = factor(AGEGROUP, 1:18, 1:18), weights = c(.1,.1,.1,.2,.2,.2,.2,.3,.3,.4,.5,.5,.5,.4,.4,.3,.2,.1))
  s2 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', adjust = factor(AGEGROUP, 1:18, 1:18), weights = wv)
  #s3 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', adjust = factor(AGEGROUP, 1:18, 1:18), weights = NULL) ???
  expect_is(s1, 'rate')
  
  expect_equal(sum(s1$PYRS), p18[,sum(PYRS)])
  expect_equal(sum(s2$OBS), p18[,sum(OBS)])
  #expect_equal(sum(s3$OBS), p18[,sum(OBS)])
  
  
  # non working syntaxes
  expect_error( 
    rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = NULL, adjust = 'AGEGROUP', weights = list(1:18))
  ) # non named list
  expect_error(
    rate(data = p18, obs = 'OBS', pyrs = 'PYRS', adjust = factor(AGEGROUP, 1:18, 1:18), weights = list(c(.1,.1,.1,.2,.2,.2,.2,.3,.3,.4,.5,.5,.5,.4,.4,.3,.2,.1)))
  )
  expect_error(
    rate(data = p18, obs = 'OBS', pyrs = 'PYRS', adjust = list(factor(AGEGROUP, 1:18, 1:18), COV), weights = list( wv,  c(0.5,0.5)))
  ) # a list length of 2
  expect_error(
    rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = c('AGEGROUP','COV'), weights = list(COV = c(.5,.5), AGEGROUP = 1:18))
  ) # duplicated names
  
  # working
  s10 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', 
              adjust = list(agegr = factor(AGEGROUP, 1:18, 1:18)), 
              weights = list(agegr = c(.1,.1,.1,.2,.2,.2,.2,.3,.3,.4,.5,.5,.5,.4,.4,.3,.2,.1)))
  
  s11 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', 
              adjust = list(agegr = factor(AGEGROUP, 1:18, 1:18), gender = factor(COV, 1:2, 1:2)), 
              weights = list(agegr = c(.1,.1,.1,.2,.2,.2,.2,.3,.3,.4,.5,.5,.5,.4,.4,.3,.2,.1), gender = c(1,1)))
  
  s12 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', 
              adjust = list(agegr = factor(AGEGROUP, 1:18, 1:18)), 
              weights = list(agegr = wv))
  
  
  s13 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = NULL, adjust = 'AGEGROUP', weights = list(AGEGROUP = 1:18))
  s14a <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = NULL, adjust = c('AGEGROUP','COV'), weights = list(AGEGROUP = 1:18, COV = c(.5,.5))) # SAMA1
  s14b <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = NULL, adjust = c('AGEGROUP','COV'), weights = list(COV = c(.5,.5), AGEGROUP = 1:18)) # SAMA1
  
  s16a <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = 'world_2000_20of5') #
  s16b <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = list(AGEGROUP), weights = 'world_2000_20of5') #
  s16c <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = AGEGROUP, weights = 'world_2000_20of5') #
  
  
  
  # Works
  s21 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = (1:18), subset = COV==1)
  s22 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = 'world_2000_20of5', subset = COV == 2)
  s23 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = NULL, weights = NULL, subset = AGEGROUP != 1)
  s24 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = NULL, adjust = NULL, weights = NULL, subset = COV == 1)
  
  ## internal weights
  s23a <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = 'internal')
  s23b <- rate(data = p20, obs = 'OBS', pyrs = PYRS,   print = 'COV', adjust = 'AGEGROUP', weights = 'internal')
  s23c <- rate(data = p20, obs = OBS, pyrs = PYRS,   print = COV, adjust = AGEGROUP, weights = 'internal')
  s24a <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', adjust = list(AGEGROUP, COV), weights = "internal")
  s24b <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', adjust = c('AGEGROUP', 'COV'), weights = "internal")
  
  ## update and getCall
  s2B <- update(s0, adjust = factor(AGEGROUP, 1:18, 1:18), weights = wv)
  expect_equal(data.table(s2B), data.table(s2))
  
})


test_that("in rate levels of adjust are printable", {
  w1 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = list(COV, AG=findInterval(AGEGROUP, c(0,8,20))), adjust ='AGEGROUP', weights = 'cohort')
  w2 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = list(COV, ag=findInterval(AGEGROUP, c(1,8,20))), adjust ='AGEGROUP', weights = 'world_2000_20of5')
  expect_equal(w1[,.N]  ,4)
})

test_that("rate.plot doesnt throw an error", {
  w1 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = list(COV, AG=findInterval(AGEGROUP, c(0,8,20))), adjust ='AGEGROUP', weights = 'cohort')
  w2 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = list(COV), adjust ='AGEGROUP', weights = 'world_2000_20of5')
  w3 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS')
  expect_silent(plot(w1))
  expect_silent(plot(w2, col = 4:5, conf.int = FALSE))
  expect_silent(plot(w3, eps = 0.01))
})


test_that("rate works with missing values", {
  p18c <- copy(p18)
  p18c[c(1,6), PYRS := NA]
  expect_warning( rate(data = p18c, obs = 'OBS', pyrs = 'PYRS', adjust = 'AGEGROUP', weights = 1:18), "Data contains 2 NA values." )
})

test_that("rate standard error and CIS works", {
  se <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', adjust = 'AGEGROUP', weights = 1:18)
  
  expect_equal(se[, SE.rate.adj] , se[, SE.rate], tolerance = 0.00002)
  expect_lt(se[, rate.adj.lo], se[, rate.adj])
  expect_lt(se[, rate.adj], se[, rate.adj.hi])
  expect_lt(se[, rate.lo], se[, rate])
  expect_lt(se[, rate], se[, rate.hi])
  expect_equal(se[, sqrt(OBS/PYRS^2)], se[, SE.rate])
  expect_equal( se[, rate.adj - SE.rate.adj*2], se[,rate.adj.lo], tolerance = 0.00002)
  expect_equal( se[, rate.adj + SE.rate.adj*2], se[,rate.adj.hi], tolerance = 0.00002)
})



test_that("rate_ratio works", {

  w1 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = c(1:18))
  w2 <- rate(data = p20, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = 'world_2000_20of5')
  w3 <- rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = 'COV')
  cru <- round((88/109818)/(78/110421),3)
  
  
  # rate obj, one line
  expect_equal( rate_ratio( w1[1], w1[2], crude = FALSE, SE.method = FALSE),
                rate_ratio( w1[1], w1[2], crude = TRUE, SE.method = FALSE))  # oikein, crude ignoorattu
  expect_equal( rate_ratio( w1[1], w1[2], crude = FALSE, SE.method = TRUE)$rate_ratio, 
                round(w1[1, rate.adj]/ w1[2, rate.adj],3))
  
  expect_equal( rate_ratio( w1[1], w1[2], crude = TRUE, SE.method = TRUE),
                data.frame(rate_ratio = 1.134, lower=1.087, upper=1.182))
  
  # rate obj crude
  suppressMessages(
    expect_equal( rate_ratio( w3[1], w3[2], crude = TRUE, SE.method = TRUE),  # oikein, hiljaa
                  rate_ratio( w3[1], w3[2], crude = FALSE, SE.method = TRUE))  # oikein, message
  )
  # rate + SE
  x <- c(w1[1, rate], w1[1, SE.rate])
  y <- c(w1[2, rate], w1[2, SE.rate])
  
  expect_error( rate_ratio( x, y, crude = FALSE, SE.method = FALSE) ) # error, käyttäjän vastuu?
  expect_error( rate_ratio( x, y, crude = TRUE,  SE.method = FALSE) )  # error, käyttäjän vastuu?
  expect_equal( rate_ratio( x, y, crude = FALSE, SE.method = TRUE), 
                rate_ratio( x, y, crude = TRUE,  SE.method = TRUE))
  
  # Obs + Pyrs
  expect_warning( rate_ratio( c(88,78), c(109818,110421), crude = FALSE, SE.method = TRUE) ) # oikein, message
  a <- rate_ratio( c(88,78), c(109818,110421), crude = TRUE, SE.method = FALSE)$rate_ratio
  expect_equal(a, (c(88,78)/c(109818,110421))[1]/(c(88,78)/c(109818,110421))[2], tolerance = 0.001 )
  
  # multi row rate objects
  a0 <- rate_ratio( w1, w2, crude = FALSE, SE.method = TRUE) 
  b0 <- rate_ratio( w1[1], w2[1], crude = FALSE, SE.method = TRUE) 
  c0 <- rate_ratio( w1[2], w2[2], crude = FALSE, SE.method = TRUE) 
  
  expect_equal(a0[1,], b0)
  expect_equal(c(a0[2,]), c(c0))

  #rate_ratio( w1, w2[1], crude = FALSE, SE.method = TRUE) # väärä, pitäisi tulla data.frame
  #rate_ratio( w1, c(0.0005,0.00002), crude = FALSE, SE.method = TRUE) # väärä, pitäisi tulla data.frame
 
})


test_that("warnings and stops works properly", {
  expect_error(
    rate(data = p18, obs = 'OBS', pyrs = 'PYRS', print = 'COV', adjust = 'AGEGROUP', weights = list(1:18, 2:19))
    )
  expect_error( stdr.weights(c('wold00_1','world66_5')) )
  expect_error( stdr.weights(c('wold00_20of5')) )
})



test_that("stdr.weights returns correct datasets", {
  al <- c('world_1966_18of5','europe','nordic',
          "world_2000_18of5","world_2000_101of1", 
          "world_2000_20of5")
  le <- c(18,18,18,18,101,20)
  expect_equal( stdr.weights(al[1])[,.N], le[1])
  expect_equal( stdr.weights(al[2])[,.N], le[2])
  expect_equal( stdr.weights(al[3])[,.N], le[3])
  expect_equal( stdr.weights(al[4])[,.N], le[4])
  expect_equal( stdr.weights(al[5])[,.N], le[5])
  expect_equal( stdr.weights(al[6])[,.N], le[6])
})

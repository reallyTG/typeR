context("SIR")


test_that("SIR w/ coh=ref=popEpi::sire", {
  ## don't skip on CRAN
  sire2 <- copy(popEpi::sire)
  sire2[, agegroup := cut(dg_age, breaks = c(0:17*5, Inf))]
  levels(sire2$agegroup) <- 1:18
  sire2[, ex_y := year(ex_date)]
  sire2[, dur := as.integer(ex_date-dg_date)/365.242199]
  ltre <- ltable(sire2[status != 0], c("ex_y", "agegroup"), 
                 expr = list(obs=.N, pyrs=sum(dur)))
  setDT(ltre)
  ltre[is.na(pyrs), pyrs := 0]
  
  sibr2 <- copy(popEpi::sibr)
  sibr2[, agegroup := cut(dg_age, breaks = c(0:17*5, Inf))]
  levels(sibr2$agegroup) <- 1:18
  sibr2[, ex_y := year(ex_date)]
  sibr2[, dur := as.integer(ex_date-dg_date)/365.242199]
  ltbr <- ltable(sibr2[status != 0], c("ex_y", "agegroup"), 
                 expr = list(obs=.N, pyrs=sum(dur)))
  setDT(ltbr)
  ltbr[is.na(pyrs), pyrs := 0]

  
  
  sl <- sir(coh.data=ltre, coh.obs="obs", coh.pyrs="pyrs",
            ref.data=ltre, ref.obs="obs", ref.pyrs="pyrs", 
            adjust= c("agegroup","ex_y"))
  plot(sl)
  ## SIR w/ coh=ref=popEpi::sire
  ## don't skip on CRAN
  expect_equal(sl$sir, 1)
  expect_equal(sl$pyrs, 13783.81, tolerance=0.01)
  expect_equal(sl$expected, 4595)
  expect_equal(sl$observed, 4595)
  
  
  sl <- sir(coh.data=ltre, coh.obs="obs", coh.pyrs="pyrs",
            ref.data=ltbr, ref.obs="obs", ref.pyrs="pyrs",
            adjust= c("agegroup","ex_y"))
  
  ## SIR w/ coh=ref=popEpi::sire"
  expect_equal(sl$sir, 1.39, tolerance=0.01)
  expect_equal(sl$pyrs, 13783.81, tolerance=0.01)
  expect_equal(sl$expected, 3305.04, tolerance=0.01)
  expect_equal(sl$observed, 4595)
})



# SIR mstate, subset + lexpand aggre ---------------------------------------

# same model
c <- lexpand( popEpi::sire[dg_date<ex_date,], status = status, birth = bi_date, exit = ex_date, entry = dg_date,
              breaks = list(per = 1990:2013, age = 0:100, fot = c(0,10,20,Inf)), 
              aggre = list(fot, agegroup = age, year = per, sex) )
# different models
c2 <- lexpand( popEpi::sire[dg_date<ex_date,], status = status, birth = bi_date, exit = ex_date, entry = dg_date,
               breaks = list(per = 1990:2010, age = 0:100, fot = c(0,10,20,Inf)), 
               aggre = list(fot, agegroup = age, year = per, sex) )


test_that("misc things work", {
  ms1 <- sir( coh.data = c, coh.obs = c('from0to1'), coh.pyrs = 'pyrs', 
              ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
              adjust = c('agegroup','year','sex'), 
              print = list(age.cat = cut(agegroup, c(0,75,120)), per = cut(year, c(1990,2010,2014), dig.lab = 8) ))
  plot(ms1)
  
  # only one print level with no variation
  expect_message( ms2 <- sir( coh.data = c, coh.obs = c('from0to1'), coh.pyrs = 'pyrs', conf.type= 'profile',
                              ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
                              adjust = c('agegroup','year','sex'), 
                              print = list(sex)) )
  expect_equal(attributes(ms2)$sir.meta$conf.type, 'profile')
  
  # coef and confint ---
  expect_equal(as.numeric(coef(ms1)), ms1$sir)
  expect_equal(data.table(confint(ms1)), data.table('2.5 %' = ms1$sir.lo, '97.5 %' = ms1$sir.hi), tolerance = 0.001)
})


test_that("confidence intervals an other options works", {
  
  # CI's
  ci1 <- sir( coh.data = c, coh.obs = c('from0to1'), coh.pyrs = 'pyrs', conf.type = 'profile',
              ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
              adjust = c('agegroup','year','sex'), 
              print = list(FOT = fot, age.cat = cut(agegroup, c(0,75,120)), per = cut(year, c(1990,2010,2014), dig.lab = 8) ))
  expect_message( ci2 <- sir( coh.data = c, coh.obs = c('from0to1'), coh.pyrs = 'pyrs', conf.type = 'wald',
              ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
              adjust = c('agegroup','year','sex'), 
              print = list(FOT = fot, sex, age.cat = cut(agegroup, c(0,75,120)), per = cut(year, c(1990,2010,2014), dig.lab = 8) )))
  ci3 <- sir( coh.data = c, coh.obs = c('from0to1'), coh.pyrs = 'pyrs', conf.type = 'univariate',
              ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
              adjust = c('agegroup','year','sex'), 
              print = list(FOT = fot, age.cat = cut(agegroup, c(0,75,120)), per = cut(year, c(1990,2010,2014), dig.lab = 8) ))
  
  expect_equal(attributes(ci1)$sir.meta$conf.type,'profile')
  expect_equal(attributes(ci2)$sir.meta$conf.type,'wald')
  expect_equal(attributes(ci3)$sir.meta$conf.type,'univariate')
  
  expect_message( sir( coh.data = c, coh.obs = c('from0to1'), coh.pyrs = 'pyrs', conf.type = 'wald',
                       ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
                       adjust = c('agegroup','year','sex'), 
                       print = list(sex )))
                  
  expect_message( ci4 <-  sir( coh.data = c, coh.obs = c('from0to2'), coh.pyrs = 'pyrs', conf.type = 'profile',
                               ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
                               adjust = c('agegroup','year','sex'), 
                               print = list(dg = cut(agegroup, c(0,5,10,20,40,75,120)) )) )
  expect_equal(attributes(ci4)$sir.meta$conf.type,'wald')
    
  
  expect_message( ci5 <- sir( coh.data = c, coh.obs = c('from0to2'), coh.pyrs = 'pyrs', conf.type = 'profile',
                              ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
                              adjust = c('agegroup','year','sex'), 
                              print = list(sex=sex,FOT = fot, 
                                           age.cat = cut(agegroup, c(0,50,75,120)), 
                                           per = cut(year, c(1990,2010,2014), dig.lab = 8) )) )
  # ear
  ea <- sir( coh.data = c, coh.obs = c('from0to2'), coh.pyrs = 'pyrs', conf.type = 'wald', EAR = TRUE,
             ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
             adjust = c('agegroup','year','sex'), conf.level = 0.95) 
  expect_equal(ea[,EAR], round((1490-1482.13)/39905.92*1000,3))  
  
  # Update
  ud1 <- sir( coh.data = c, coh.obs = c('from0to1'), coh.pyrs = 'pyrs', conf.type = 'profile',
              ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
              adjust = c('agegroup','year','sex'), 
              print = list(fot))
  ud2 <- update(ud1, print = list(fot,  age.cat = cut(agegroup, c(0,75,120))))
  
  ud3 <- sir( coh.data = c, coh.obs = c('from0to1'), coh.pyrs = 'pyrs', conf.type = 'profile',
              ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
              adjust = c('agegroup','year','sex'), 
              print = list(fot,  age.cat = cut(agegroup, c(0,75,120))))
  expect_equal(ud2, ud3)
})


test_that("SIR works with multistate aggregated lexpand data", {
  ## don't skip on CRAN

  expect_warning(
    se <- sir( coh.data = c, coh.obs = c('from0to1','from0to2'), coh.pyrs = 'pyrs', 
               subset = year %in% 1990:2009,
               ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
               adjust = c('agegroup','year','sex'), print =c('cause','fot'), mstate = 'cause')
  )
  
  dummy.coh <- data.table(agegroup = 1:18, sex = 1, from0to1 = round(runif(18)), 
                          from0to2 = round(runif(18)+0.4),
                          pyrs = (rnorm(18)+100)*200)
  dummy.ref <- data.table(agegroup = rep(1:18,times=2), sex = 1, obs = floor(runif(36)*100),
                          categ2 = rep(c(1,2),each=18),pyrs = (rnorm(36)+100)*2000)
  
  sm <- sir( coh.data = dummy.coh, coh.obs = c('from0to1','from0to2'), coh.pyrs = 'pyrs', 
             ref.data = dummy.ref, ref.obs = 'obs', ref.pyrs = 'pyrs', mstate = 'categ2',
             adjust = c('agegroup','sex','categ2'), print =c('categ2'))
  
  setkey(12345)
  dummy.coh2 <- data.table(agegroup = rep(1:18,times=6), sex = rep(1:2, each= 18), obs = floor(runif(18*6)*100), level = rep(1:6,each=18),pyrs = (rnorm(36)+100)*2000)
                           
  sg <- sir( coh.data = dummy.coh2, coh.obs = c('obs'), coh.pyrs = 'pyrs', 
             adjust = c('agegroup'), print =c('level'))
  expect_equal(attributes(sg)$sir.meta$pooled[,sir], 1)
  expect_equal(sg[,.N], 6)
    

  s1 <- sir( coh.data = c, coh.obs = c('from0to1'), coh.pyrs = 'pyrs', subset = year %in% 1990:2009,
             ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
             adjust = c('agegroup','year','sex'), print =c('fot'))
  
  s2 <- sir( coh.data = c2, coh.obs = c('from0to2'), coh.pyrs = 'pyrs',
             ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
             adjust = c('agegroup','year','sex'), print =c('fot'))
  s12 <- rbind( cbind(cause=1L, data.table(s1)), 
                cbind(cause=2L, data.table(s2)))
  
  # compare by hand calculated sir
  
  r <- merge(c2, data.table(popEpi::popmort), c('sex','agegroup','year'), all.x=TRUE)
  setDT(r)
  r[, exp := haz*pyrs]
  est <- r[, list(observed=sum(from0to1, na.rm=TRUE),expected=sum(exp, na.rm=TRUE)), by=.(fot)]
  est <- round(est,4)
  
  expect_is(object = se, class = 'sir')
  expect_equivalent(se, s12)
  setDT(s1)
  expect_equivalent(s1[,1:3, with=FALSE], est)
})



# SIR utils ---------------------------------------------------------------

test_that('Util functions work', {
  expect_equal( poisson.ci(5,5)$rate, 1)
  expect_equal(p.round(0.0000001), "< 0.001")
})

test_that("data.table subsettin works", {
  
  ss <- sir( coh.data = c2, coh.obs = c('from0to2'), coh.pyrs = 'pyrs',
             ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
             adjust = c('agegroup','year','sex'), print =c('fot'))
  expect_equal(ss[1,.N], 1)
  expect_equal(c(ss[,.(fot)]), list(fot = c(0,10)))
})



# sir splines -------------------------------------------------------------

#library(reshape2)

test_that("SIR spline throws errors correctly", {
  skip_on_cran()
  library(splines)
  
  
  sp0 <- suppressWarnings(try(sirspline( coh.data = c, coh.obs = 'from0to2', coh.pyrs = 'pyrs',
                                         subset = year %in% 1990:2008,
                                         ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
                                         adjust = c('agegroup','year','sex'), print = NULL,
                                         spline=c('agegroup','year','fot') )))
  sp1 <- suppressWarnings(try(sirspline( coh.data = c, coh.obs = c('from0to1','from0to2'), coh.pyrs = 'pyrs',
                                         subset = year %in% 1990:2008,
                                         ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
                                         adjust = c('agegroup','year','sex'), print =c('cause'),
                                         mstate = 'cause', spline=c('agegroup','year','fot') )))
  sp2 <- suppressWarnings(try(sirspline( coh.data = c, coh.obs = c('from0to1','from0to2'), coh.pyrs = 'pyrs',
                                         subset = year %in% 1990:2008,
                                         ref.data = data.table(popEpi::popmort), ref.rate = 'haz', dependent.spline=FALSE,
                                         adjust = c('agegroup','year','sex'), print =c('cause'), 
                                         mstate = 'cause', spline=c('agegroup','year','fot') )))
  sp3 <- suppressWarnings(try(sirspline( coh.data = c, coh.obs = c('from0to1','from0to2'), coh.pyrs = 'pyrs',
                                         subset = year %in% 1990:2008,
                                         ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
                                         adjust = c('agegroup','year','sex'), print =c('cause'), 
                                         mstate = 'cause', spline='agegroup') ))
  
  sp4 <- suppressWarnings(try(sirspline( coh.data = c, coh.obs = c('from0to1','from0to2'), coh.pyrs = 'pyrs',
                                         subset = year %in% 1990:2008,
                                         ref.data = data.table(popEpi::popmort), ref.rate = 'haz', reference.points = c(2000,4),
                                         adjust = c('agegroup','year','sex'), print =c('cause'), 
                                         mstate = 'cause', spline=c('agegroup','year','fot') )))
  expect_is( object = sp1, class = 'sirspline')
  expect_is( object = sp2, class = 'sirspline')
  expect_is( object = sp3, class = 'sirspline')
  expect_is( object = sp4, class = 'sirspline')
})


test_that("print accepts a function and subset works", {
  skip_on_cran()
  expect_warning(
    pl1 <- sir( coh.data = c, coh.obs = c('from0to1','from0to2'), coh.pyrs = 'pyrs',
                subset = year %in% 1990:2008,
                ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
                adjust = c('agegroup','year','sex'), print = list(year.int = findInterval(year,c(1989,2000,2010))),
                mstate = 'cause')
  )
  expect_warning(
    pl2 <- sir( coh.data = c, coh.obs = c('from0to1','from0to2'), coh.pyrs = 'pyrs',
                subset = year %in% 1990:2008,
                ref.data = data.table(popEpi::popmort), ref.rate = 'haz', 
                adjust = c('agegroup','year','sex'), print = list(year.int = findInterval(year,c(1989,2000,2010))),
                mstate = 'cause')
  )
  setDT(pl1)
  expect_equal( pl1[,year.int], 1:2)
  expect_is(object=pl2, 'sir')
})



test_that("sir_ratio", {
  ## don't skip on CRAN
  dt1 <- data.table(obs = rep(c(5,7), 10),
                    pyrs = rep(c(250,300,350,400), 5),
                    var = 1:20)
  
  dt2 <- data.table(obs = rep(c(10,13), 10),
                    pyrs = rep(c(250,300,350,400), 5),
                    var = 1:20)
  
  Ref <- data.table(obs = rep(c(50,70,80,100), 5),
                    pyrs = rep(c(2500,3000,3500,4000), 5),
                    var = 1:20)
  
  
  s1 <- sir(coh.data = dt1, coh.obs = obs, coh.pyrs = pyrs, 
            ref.data = Ref, ref.obs = obs, ref.pyrs = pyrs,
            adjust = var)
  
  
  s2 <- sir(coh.data = dt2, coh.obs = obs, coh.pyrs = pyrs, 
            ref.data = Ref, ref.obs = obs, ref.pyrs = pyrs,
            adjust = var)
  
  
  ## SIR w/ coh=ref=popEpi::sire
  ## don't skip on CRAN
  # Test the example from the book (statistics with confidence):
  expect_equal( sir_ratio(x = c(64, 45.6), y = c(25,23.7), digits=2)[2:3], c(lower=0.83, upper=2.21))
  # other tests
  expect_message(sir_ratio(s1, s2, digits = 2, alternative = 'less', conf.level = 0.95, type = 'asymptotic'))
  expect_equal(sir_ratio(s1, s2), sir_ratio(c(120,150), c(230,150)), tolerance=0.001)
  expect_equal(sir_ratio(s1, c(230,150)), sir_ratio(c(120,150), s2), tolerance=0.001)
  expect_equal(sir_ratio(s1, s2)[1], c(sir_ratio =round((120/150)/(230/150),3)), tolerance=0.001)
})


test_that("sir_exp and sir_ag and sir_lexis are working", {
  ## don't skip on CRAN
  # from0to1 ei oo vakio
  
  BL <- list(fot = 0:5, per = c("2003-01-01","2008-01-01", "2013-01-01"))
  suppressMessages(
    # aggregated with breaks
    x1 <- lexpand(sire, breaks = BL, status = status != 0, 
                 birth = bi_date, entry = dg_date, exit = ex_date,
                 pophaz=popmort,
                 aggre=list(sex, period = per, surv.int = fot))
  )
  suppressMessages(
    # no aggreate but breaks
    x2 <- lexpand(sire, breaks = BL, status = status != 0, 
                 birth = bi_date, entry = dg_date, exit = ex_date,
                 pophaz=popmort)
  )

  suppressMessages(
    x3 <- lexpand(sire, status = status != 0,
                  birth = bi_date, entry = dg_date, exit = ex_date,
                  pophaz=popmort)
  )
  suppressMessages(
    x4 <- lexpand(sire, status = status != 0,
                  birth = bi_date, entry = bi_date, exit = ex_date,
                  pophaz=popmort)
  )
  # library(Epi)
  # # no aggreate but breaks
  # suppressMessages(
  #   x5 <- Lexis(entry = list(FUT = 0, AGE = 0, CAL = get.yrs(bi_date)), 
  #              exit = list(CAL = get.yrs(ex_date)), 
  #              data = sire[sire$dg_date < sire$ex_date, ],
  #              exit.status = factor(status, levels = 0:2, 
  #                                   labels = c("alive", "canD", "othD")), 
  #              merge = TRUE)
  #   )
  
   
   
  # AGGRE
  expect_message( a1 <- sir_ag(x1, obs = 'from0to1', conf.type = 'profile') )
  expect_message( a0 <- sir_ag(x1, obs = from0to1, conf.type = 'profile') )
  a0 <- sir_ag(x1, obs = 'from0to1', print = list(period))
  a0 <- sir_ag(x1, obs = 'from0to1', print = list(per=period))
  expect_message( a0 <- sir_ag(x1, obs = from0to1, exp = d.exp, pyrs = pyrs) )
  a0 <- sir_ag(x1, obs = from0to1, exp = d.exp, pyrs = pyrs, print = period)
  
  expect_message(a2 <- sir_ag(x1, print = attr(x, "aggre.meta")$by))
  expect_message(a3 <- sir_ag(x1))
  expect_equal(data.table(a2),data.table(a3))

  
  a4 <- sir_ag(x1, obs = 'from0to1', print = surv.int)
  a4b <- sir_ag(x1, obs = 'from0to1', print = c('surv.int','period'))  
  a5 <- sir_ag(x1, obs = 'from0to1', print = list(surv.int,period))  
  a6 <- sir_ag(x1, obs = 'from0to1', print = c('period','surv.int'))
  setcolorder(a5, c(2,1,3:9))
  setkey(a5, period)
  setkey(a6, period)
  expect_equal(data.table(a5)[order(period, surv.int)], data.table(a6)[order(period, surv.int)])
  expect_error(sir_ag(x2, print = NULL))
  
  # UPDATE
  a4c <- update(a4, print = c('surv.int','period')) # update to l2
  expect_equal(a4c,a4b)
  
  
  # LEXIS
  expect_error(sir_lex(x1))
  l1 <- sir_lex(x2, print = attr(x, "aggre.meta")$by)
  l2 <- sir_lex(x2, print = 'per')
  l2 <- sir_lex(x2, print = per)
  l3 <- sir_lex(x2, print = NULL)
  expect_equal(l3[,.N], 1)
  
  l1 <- sir_lex(x2, print = NULL)
  l2 <- sir_lex(x2, print = 'per')
  l2 <- sir_lex(x2, print = per)
  l3 <- sir_lex(x2, print = NULL)
  
  
  # breaks...
  BL1 <- list(fot = 0:5, per = c(2003,2008,2013))
  b1 <- sir_lex(x3, breaks = BL1, print = c('fot','per')) 
  BL <- list(fot = 0:5, per = c('2003-01-01','2008-01-01','2013-01-01'), age = c(0,75,100))
  b3 <- sir_lex(x3, breaks = BL, print = c('fot','per','age'))
  expect_equal(b3[,.N], 24)
  
  BL2 <- list(fot = 0:5, age = c(0,50,70,100))
  b3 <- sir_lex(x2, breaks = BL2, print = c('fot','age')) # already split data
  expect_equal(b3[,.N], 15)
  
  # Character date
  BL <- list(fot = 0:5, per = c("2003-01-01","2008-01-01", "2013-01-01"))
  b5 <- sir_lex(x3, breaks = BL, print = c('fot','per'))
  BL <- list(fot = 0:5, per = c(2002.999, 2007.999, 2013.001))
  b6 <- sir_lex(x3, breaks = BL, print = c('fot','per'))
  expect_equal(data.table(b5), data.table(b6), tolerance = 0.001)
  
  # EXPECTED
  # without pyrs;
  e0 <- sir_exp(x1, obs = "from0to1", exp = "d.exp", pyrs = , print = period)
  e1 <- sir_exp(x1, obs = "from0to1", exp = "d.exp", pyrs = "pyrs", print = period)
  e1 <- sir_exp(x1, obs = from0to1, exp = d.exp, pyrs = pyrs, print = period)
  e2 <- sir_exp(x2, obs = "lex.Xst", exp = list(exp = pop.haz*lex.dur), pyrs = "lex.dur", 
                print = list(period = cut(per, c(2003,2008, 2013), right = FALSE)))
  e1 <- data.table(e1)
  e2 <- data.table(e2) 
  expect_equal(e1[,.(pyrs, sir, sir.lo, sir.hi, p_value)], e2[,.(pyrs, sir, sir.lo, sir.hi, p_value)])
  
  # WARNINGS (when missing pop.haz)
  expect_error( f1 <- sir_lex(x4) )
  expect_error( f1 <- sir_exp(x4, obs ='lex.Xst', exp = list(exp = lex.dur*pop.haz), pyrs ='lex.dur') )
  
  # SIR_RATIO
  expect_equal(sir_ratio(a2, a3)[1], c(sir_ratio = 1)) 
  plot(a2)
  plot(a4)
})


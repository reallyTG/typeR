context("mean survival testing")
library("data.table")
library("Epi")
library("survival")

test_that("survmean() agrees with old results", {
  skip_usually()
  
  sr <- data.table(popEpi::sire)[dg_date < ex_date, ]
  sr$agegr <- cut(sr$dg_age, c(0,45,60,Inf), right=FALSE)
  
  x <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)),
             exit = list(CAL = get.yrs(ex_date)),
             data = sr,
             exit.status = factor(status, levels = 0:2,
                                  labels = c("alive", "canD", "othD")),
             entry.status = factor(0, levels = 0:2,
                                   labels = c("alive", "canD", "othD")),
             merge = TRUE)
  
  ## observed survival
  pm <- data.table(popEpi::popmort)
  names(pm) <- c("sex", "CAL", "AGE", "haz")
  sm <- survmean(Surv(time = FUT, event = lex.Xst != "alive") ~ agegr,
                 pophaz = pm, data = x,
                 breaks = list(FUT = seq(0, 10, 1/12)),
                 e1.breaks = list(FUT = c(seq(0, 10, 1/12), 11:100)))
  
  ## values to test against computed on 2016-03-04;
  ## git ref: 5077677
  expect_equal(sm$est, c(33.951439, 21.611419,  7.604318), tol = 0.005, scale = 1)
  expect_equal(sm$exp, c(45.25686, 31.22712, 13.06725), tol = 0.005, scale = 1)
  
  
})



# test_that("survmean() agrees with results computed using pkg survival", {
#   skip_on_cran()
#   
#   
#   BL <- list(fot= seq(0,15,1/24))
#   eBL <- list(fot = unique(c(BL$fot, seq(15, 115,0.5))))
#   
#   sire2 <- data.table(popEpi::sire)[dg_date<ex_date, ]
#   sire2$statusf <- factor(sire2$status, levels = 0:2, 
#                           labels = c("alive", "canD", "othD"))
#   
#   x <- lexpand(sire2, 
#                birth  = bi_date, entry = dg_date, exit = ex_date,
#                status = statusf,
#                breaks = NULL)
#   
#   popmort_sm <- setDT(copy(popEpi::popmort))
#   setnames(popmort_sm, c("agegroup", "year"), c("age", "per"))
#   
#   sm <- survmean(Surv(fot, event = lex.Xst) ~ 1, 
#                  breaks = BL, e1.breaks = eBL, r = 1,
#                  pophaz = popmort_sm, data = x)
#   
#   st <- survtab(Surv(fot, event = lex.Xst) ~ 1, 
#                 breaks = BL, 
#                 pophaz = popmort_sm, data = x)
#   
#   sm_curve <- copy(attr(sm, "survmean.meta")$curve)
#   td01 <- readRDS("tests/testthat/survmean_test_data_01.rds")
#   
#   expect_equal(sm_curve[survmean_type == "est", surv], 
#                td01$est, 
#                scale = 1L, 
#                tolerance = 0.001)
# })


test_that("survmean expected survival curve corresponds to full Ederer I", {
  skip_usually()
  
  sr <- data.table(sire)[dg_date < ex_date, ]
  sr$agegr <- cut(sr$dg_age, c(0,45,60,Inf), right=FALSE)
  
  x <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)),
             exit = list(CAL = get.yrs(ex_date)),
             data = sr,
             exit.status = factor(status, levels = 0:2,
                                  labels = c("alive", "canD", "othD")),
             entry.status = factor(0, levels = 0:2,
                                   labels = c("alive", "canD", "othD")),
             merge = TRUE)
  
  pm <- copy(popEpi::popmort)
  names(pm) <- c("sex", "CAL", "AGE", "haz")
  
  BL <- list(FUT = seq(0, 10, 1/12))
  eBL <- list(FUT = c(BL$FUT, seq(11,110,1/2)))
  sm <- survmean(Surv(time = FUT, event = lex.Xst != "alive") ~ 1,
                 pophaz = pm, data = x,
                 breaks = BL, 
                 e1.breaks = eBL)
  
  ## pure Ederer I curve
  setDT(x)
  x[, lex.dur := 110]
  setattr(x, "class", c("Lexis", "data.table", "data.frame"))
  e1 <- comp_e1(x = x, breaks = eBL, 
                pophaz = pm, survScale = "FUT")
  setkeyv(e1, "FUT")
  e1[, "delta" := diff(eBL$FUT)]
  e1[, "l1" := c(1,surv.exp[-.N])]
  sm.e1 <- e1[, sum((l1+surv.exp)/2L*delta)]
  
  
  expect_equal(sm$exp, sm.e1, tol = 0.0005, scale = 1)
  
})

test_that("survmean period method is useful", {
  skip_on_cran()
  
  sr <- data.table(popEpi::sire)[dg_date < ex_date, ]
  sr$agegr <- cut(sr$dg_age, c(0,45,60,Inf), right=FALSE)
  
  x <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)),
             exit = list(CAL = get.yrs(ex_date)),
             data = sr,
             exit.status = factor(status, levels = 0:2,
                                  labels = c("alive", "canD", "othD")),
             entry.status = factor(0, levels = 0:2,
                                   labels = c("alive", "canD", "othD")),
             merge = TRUE)
  
  pm <- data.table(popEpi::popmort)
  names(pm) <- c("sex", "CAL", "AGE", "haz")
  
  BL <- list(FUT = seq(0, 10, 1/12))
  eBL <- list(FUT = c(BL$FUT, seq(max(BL$FUT),110,1/2)))
  eBL$FUT <- sort(unique(eBL$FUT))
  sm <- survmean(Surv(time = FUT, event = lex.Xst != "alive") ~ 1,
                 subset = dg_date >= "1998-01-01" & dg_date < "2003-01-01",
                 pophaz = pm, data = x,
                 r = 1,
                 breaks = BL, 
                 e1.breaks = eBL)
  
  
  BL <- list(FUT = seq(0, 5, 1/12), CAL = c(1998,2003))
  eBL <- list(FUT = c(BL$FUT, seq(max(BL$FUT), 10, 1/12), seq(10,110,1/2)))
  eBL$FUT <- sort(unique(eBL$FUT))
  smp <- survmean(Surv(time = FUT, event = lex.Xst != "alive") ~ 1,
                  pophaz = pm, data = x,
                  breaks = BL, 
                  r = 1,
                  e1.breaks = eBL)
  
  
  
  expect_equal(sm$obs, smp$obs)
  expect_equal(sm$exp, smp$exp)
  expect_equal(smp$est, 10.01542, tol = 0.0005, scale = 1)
  expect_equal(sm$est, 10.0216, tol = 0.0005, scale = 1)
  
})



test_that("Dates and frac. yrs produce congruent results", {
  skip_on_cran()
  
  x <- data.table(popEpi::sire)
  x <- x[dg_date<ex_date]
  
  ## phony group variable
  set.seed(1L)
  x$group <- rbinom(nrow(x), 1, 0.5)
  
  
  ## yrs
  xy <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)), 
              exit = list(CAL = get.yrs(ex_date)), 
              data = x,
              exit.status = factor(status, levels = 0:2, 
                                   labels = c("alive", "canD", "othD")), 
              entry.status = factor(0, levels = 0:2,
                                    labels = c("alive", "canD", "othD")),
              merge = TRUE)
  
  ## dates
  xd <- Lexis(entry = list(FUT = 0L, AGE = dg_date-bi_date, CAL = dg_date),
              exit = list(CAL = ex_date),
              data = x,
              exit.status = factor(status, levels = 0:2, 
                                   labels = c("alive", "canD", "othD")), 
              entry.status = factor(0, levels = 0:2,
                                    labels = c("alive", "canD", "othD")),
              merge = TRUE)
  yd <- 365.242199
  BLy <- list(FUT = seq(0, 9, 1/4))
  BLd <- lapply(BLy, function(el) el * yd)
  eBLy <- list(FUT = c(seq(0, 9, 1/4), 9.5, 10:75))
  eBLd <- lapply(eBLy, function(el) el * yd)
  
  pmy <- data.table(popEpi::popmort)
  setnames(pmy, c("year", "agegroup"), c("CAL", "AGE"))
  
  pmd <- data.table(pmy)
  pmd[, CAL := as.Date(paste0(CAL, "-01-01"))]
  pmd[, AGE := AGE * yd]
  pmd[, haz := haz/yd]
  
  #### hazard method
  ## observed survival & Ederer II
  
  sty <- survmean(Surv(FUT, lex.Xst) ~ group, data = xy, 
                  surv.method = "hazard",
                  e1.breaks = eBLy,
                  breaks = BLy, pophaz = pmy)
  
  std <- survmean(Surv(FUT, lex.Xst) ~ group, data = xd, 
                  surv.method = "hazard",
                  e1.breaks = eBLd,
                  breaks = BLd, pophaz = pmd)    
  cuy <- data.table(attributes(sty)$survmean.meta$curves)
  cud <- data.table(attributes(std)$survmean.meta$curves)
  
  std[, c("est", "exp", "YPLL") := lapply(.SD, function(col) col/yd),
      .SDcols = c("est", "exp", "YPLL")]
  
  expect_equal(sty$est, std$est, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$exp, std$exp, scale = 1L, tolerance = 0.001)
  expect_equal(sty$obs, std$obs)
  
  expect_equal(cuy$surv, cud$surv, scale = 1L, tolerance = 0.00005)
  
  #### lifetable method
  ## observed survival & Ederer II
  
  sty <- survmean(Surv(FUT, lex.Xst) ~ group, data = xy, 
                  surv.method = "lifetable",
                  e1.breaks = eBLy,
                  breaks = BLy, pophaz = pmy)
  
  std <- survmean(Surv(FUT, lex.Xst) ~ group, data = xd, 
                  surv.method = "lifetable",
                  e1.breaks = eBLd,
                  breaks = BLd, pophaz = pmd)    
  cuy <- data.table(attributes(sty)$survmean.meta$curves)
  cud <- data.table(attributes(std)$survmean.meta$curves)
  
  std[, c("est", "exp", "YPLL") := lapply(.SD, function(col) col/yd),
      .SDcols = c("est", "exp", "YPLL")]
  
  expect_equal(sty$est, std$est, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$exp, std$exp, scale = 1L, tolerance = 0.001)
  expect_equal(sty$obs, std$obs)
  
  expect_equal(cuy$surv, cud$surv, scale = 1L, tolerance = 0.00005)
  
  
})




test_that("updating works for survmean objects", {
  
  skip_on_cran()
  
  set.seed(1)
  sr <- setDT(popEpi::sire[sample(1:.N, 100), ])
  
  x <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)),
             exit = list(CAL = get.yrs(ex_date)),
             data = sr,
             exit.status = factor(status, levels = 0:2,
                                  labels = c("alive", "canD", "othD")),
             entry.status = factor(0, levels = 0:2,
                                   labels = c("alive", "canD", "othD")),
             merge = TRUE)
  
  pm <- data.table(popEpi::popmort)
  names(pm) <- c("sex", "CAL", "AGE", "haz")
  
  BL <- list(FUT = 1:10)
  fo <- Surv(time = FUT, event = lex.Xst != "alive") ~ 1
  e <- quote(
    survmean(formula = fo, data = x, breaks = BL,pophaz = pm)
  )
  sm <- eval(e)
  
  fo <- update(fo, ~.+sex)
  sm2 <- eval(e)
  
  sm3 <- update(sm, .~ + sex)
  
  expect_equal(data.frame(sm2), data.frame(sm3))
  expect_equal(formula(sm2), fo)
  expect_equal(formula(sm3), fo)
  expect_equal(getCall(sm2), e)
  
})



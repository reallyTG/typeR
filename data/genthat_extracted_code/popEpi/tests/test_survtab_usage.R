context("survtab usage")



test_that("Dates and frac. yrs produce congruent results", {
  skip_on_cran()
  library(Epi)
  library(survival)
  
  x <- data.table(popEpi::sire)
  x <- x[dg_date<ex_date]
  
  ## phony group variable
  set.seed(1L)
  x$group <- rbinom(nrow(x), 1, 0.5)
  
  
  ## yrs
  xy <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)), 
              exit = list(CAL = get.yrs(ex_date)), 
              data = x,
              entry.status = 0L,
              exit.status = as.integer(status %in% 1:2), 
              merge = TRUE)
  
  ## dates
  xd <- Lexis(entry = list(FUT = 0L, AGE = dg_date-bi_date, CAL = dg_date),
              exit = list(CAL = ex_date),
              data = x,
              entry.status = 0L,
              exit.status = as.integer(status %in% 1:2), 
              merge = TRUE)
  yd <- 365.242199
  BLy <- list(FUT = seq(0, 5, 1/4))
  BLd <- lapply(BLy, function(el) el * yd)
  
  pmy <- data.table(popEpi::popmort)
  setnames(pmy, c("year", "agegroup"), c("CAL", "AGE"))
  
  pmd <- data.table(pmy)
  pmd[, CAL := as.Date(paste0(CAL, "-01-01"))]
  pmd[, AGE := AGE * yd]
  pmd[, haz := haz/yd]
  
  #### hazard method
  ## observed survival & Ederer II
  
  sty <- survtab(Surv(FUT, lex.Xst) ~ group, data = xy, 
                     surv.type = "surv.rel", relsurv.method = "e2",
                     surv.method = "hazard",
                     breaks = BLy, pophaz = pmy)
  
  std <- survtab(Surv(FUT, lex.Xst) ~ group, data = xd, 
                     surv.type = "surv.rel", relsurv.method = "e2",
                     surv.method = "hazard",
                     breaks = BLd, pophaz = pmd)    
  
  expect_equal(sty$surv.obs.lo, std$surv.obs.lo, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$surv.obs, std$surv.obs, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$surv.obs.hi, std$surv.obs.hi, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$r.e2.lo, std$r.e2.lo, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$r.e2, std$r.e2, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$r.e2.hi, std$r.e2.hi, scale = 1L, tolerance = 0.0005)
  
  ## pohar perme
  
  sty <- survtab(Surv(FUT, lex.Xst) ~ group, data = xy, 
                     surv.type = "surv.rel", relsurv.method = "pp",
                     surv.method = "hazard",
                     breaks = BLy, pophaz = pmy)
  
  std <- survtab(Surv(FUT, lex.Xst) ~ group, data = xd, 
                     surv.type = "surv.rel", relsurv.method = "pp",
                     surv.method = "hazard",
                     breaks = BLd, pophaz = pmd)    
  
  expect_equal(sty$r.pp.lo, std$r.pp.lo, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$r.pp, std$r.pp, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$r.pp.hi, std$r.pp.hi, scale = 1L, tolerance = 0.0005)
  
  #### lifetable method
  ## observed survival & Ederer II
  
  sty <- survtab(Surv(FUT, lex.Xst) ~ group, data = xy, 
                     surv.type = "surv.rel", relsurv.method = "e2",
                     surv.method = "lifetable",
                     breaks = BLy, pophaz = pmy)
  
  std <- survtab(Surv(FUT, lex.Xst) ~ group, data = xd, 
                     surv.type = "surv.rel", relsurv.method = "e2",
                     surv.method = "lifetable",
                     breaks = BLd, pophaz = pmd)    
  
  expect_equal(sty$surv.obs.lo, std$surv.obs.lo, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$surv.obs, std$surv.obs, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$surv.obs.hi, std$surv.obs.hi, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$r.e2.lo, std$r.e2.lo, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$r.e2, std$r.e2, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$r.e2.hi, std$r.e2.hi, scale = 1L, tolerance = 0.0005)
  
  ## pohar perme
  
  sty <- survtab(Surv(FUT, lex.Xst) ~ group, data = xy, 
                     surv.type = "surv.rel", relsurv.method = "pp",
                     surv.method = "lifetable",
                     breaks = BLy, pophaz = pmy)
  
  std <- survtab(Surv(FUT, lex.Xst) ~ group, data = xd, 
                     surv.type = "surv.rel", relsurv.method = "pp",
                     surv.method = "lifetable",
                     breaks = BLd, pophaz = pmd)    
  
  expect_equal(sty$r.pp.lo, std$r.pp.lo, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$r.pp, std$r.pp, scale = 1L, tolerance = 0.0005)
  expect_equal(sty$r.pp.hi, std$r.pp.hi, scale = 1L, tolerance = 0.0005)
  
})



test_that("hazard and lifetable produce congruent results", {
  skip_on_cran()
  library(Epi)
  library(survival)
  
  x <- data.table(popEpi::sire)
  x <- x[dg_date<ex_date]
  
  ## phony group variable
  set.seed(1L)
  x$group <- rbinom(nrow(x), 1, 0.5)
  
  
  xy <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)), 
              exit = list(CAL = get.yrs(ex_date)), 
              data = x,
              entry.status = 0L,
              exit.status = as.integer(status %in% 1:2), 
              merge = TRUE)
  
  
  pmy <- data.table(popEpi::popmort)
  setnames(pmy, c("year", "agegroup"), c("CAL", "AGE"))
  BL <- list(FUT = seq(0, 5, 1/12))
  
  sth <- survtab(Surv(FUT, lex.Xst) ~ group, data = xy,
                 pophaz = pmy, breaks = BL,
                 surv.type = "surv.rel", surv.method = "hazard")
  
  stl <- survtab(Surv(FUT, lex.Xst) ~ group, data = xy,
                 pophaz = pmy, breaks = BL,
                 surv.type = "surv.rel", surv.method = "lifetable")
  
  expect_equal(sth$r.e2, stl$r.e2, scale = 1, tol = 0.0003415)
  expect_equal(sth$r.e2.lo, stl$r.e2.lo, scale = 1, tol = 0.000354)
  expect_equal(sth$r.e2.hi, stl$r.e2.hi, scale = 1, tol = 0.00033)
  
  expect_equal(sth$surv.obs, stl$surv.obs, scale = 1, tol = 0.00002575)
  expect_equal(sth$surv.obs.lo, stl$surv.obs.lo, scale = 1, tol = 0.000027)
  expect_equal(sth$surv.obs.hi, stl$surv.obs.hi, scale = 1, tol = 0.000025)
  
})

## test below even should not work, since period analysis
## means that at.risk counts (subjects entering an interval in its beginning)
## will not necessarily equal the counts of events.
# test_that("lifetable counts work with period analysis", {
#   library(Epi)
#   library(survival)
#   x <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)),
#              exit = list(CAL = get.yrs(ex_date)),
#              data = sire[sire$dg_date < sire$ex_date, ],
#              exit.status = as.integer(status %in% 1:2),
#              entry.status = 0,
#              merge = TRUE)
# 
#   ## phony group variable
#   set.seed(1L)
#   x$group <- rbinom(nrow(x), 1, 0.5)
# 
#   BL <- list(FUT = seq(0, 5, 1/12), CAL = c(2008,2013))
#   x <- splitMulti(x, BL)
# 
#   st1 <- survtab(Surv(FUT, lex.Xst) ~ 1, data = x, 
#                  surv.type = "surv.obs",
#                  surv.method = "lifetable")
#   
#   a <- aggre(x, by = FUT)
#   
#   st2 <- survtab_ag(FUT ~ 1, data = a, surv.type = "surv.obs",
#                     surv.method = "lifetable",
#                     n = "at.risk", d = c("from0to1"),
#                     n.cens = "from0to0", pyrs = "pyrs")
#   
#   expect_equal(st1$surv.obs, st2$surv.obs)
#   
# })


test_that("its possible to pass dynamically created arguments", {
  skip_on_cran()
  library(Epi)
  library(survival)
  x <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)),
             exit = list(CAL = get.yrs(ex_date)),
             data = sire[sire$dg_date < sire$ex_date, ],
             exit.status = as.integer(status %in% 1:2),
             entry.status = 0,
             merge = TRUE)
  
  TF <- environment()
  
  ## phony group variable
  set.seed(1L)
  x$group <- rbinom(nrow(x), 1, 0.5)
  agegr <- cut(x$dg_age, 4, right = FALSE)
  x$agegr <- NULL
  w <- as.data.frame(table(agegr))
  names(w) <- c("agegr", "weights")
  
  BL <- list(FUT = seq(0, 5, 1/12), CAL = c(2008,2013))
  
  form <- Surv(FUT, lex.Xst) ~ group
  
  
  st1 <- survtab(form, data = x,
                 adjust = agegr,
                 weights = w, breaks = BL,
                 surv.type = "surv.obs",
                 surv.method = "hazard")
  
  x <- splitMulti(x, breaks = BL)
  x$agegr <- cut(x$dg_age, 4, right = FALSE)
  a <- aggre(x, by = list(group, agegr, FUT))
  
  group <- a$group
  set(a, j = "group", value = NULL)
  
  form <- FUT ~ group + adjust(agegr)
  pyrs <- a$pyrs
  set(a, j = "pyrs", value = NULL)
  
  st2 <- survtab_ag(form, data = a, surv.type = "surv.obs",
                    surv.method = "hazard",
                    d = c("from0to1"),
                    weights = "internal",
                    pyrs = pyrs)
  
  expect_equal(st1$surv.obs, st2$surv.obs)
  
})


test_that("getCall & formula methods for survtab work", {
  data("sire")
  BL <- list(fot=seq(0, 5, by = 1/12),
             per = c("2008-01-01", "2013-01-01"))
  set.seed(1)
  x <- lexpand(sire[sample(1:.N, 100)], 
               birth = bi_date, entry = dg_date, exit = ex_date,
               status = status %in% 1:2,
               breaks = BL,
               pophaz = popmort,
               aggre = list(sex, fot))
  form <- fot ~ sex
  e <- quote(survtab_ag(formula = form, data = x))
  st <- eval(e)
  
  expect_equal(formula(st), form)
  expect_equal(getCall(st), e)
  
})





test_that("survtab_ag allows for certain arguments to be length > 1", {
  data(sire)
  set.seed(1)
  sire <- sire[sample(1:.N, 100)]
  
  BL <- list(fot=0:5)
  x <- lexpand(sire, 
               birth = bi_date, entry = dg_date, exit = ex_date,
               status = status,
               breaks = BL,
               pophaz = popmort,
               aggre = list(fot))
  
  st <- survtab_ag(fot ~ 1, data = x, 
                   surv.method = "lifetable",
                   n.cens = c("from0to0", "from0to2"), d = "from0to1")
  st <- survtab_ag(fot ~ 1, data = x, 
                   surv.method = "lifetable",
                   relsurv.method = "pp",
                   n.cens = c("from0to0", "from0to2"), 
                   d = "from0to1",
                   d.pp = "from0to1.pp",
                   d.pp.2 = "from0to1.pp.2",
                   n.pp = "at.risk.pp",
                   n.cens.pp = c("from0to0.pp", "from0to2.pp"))
  st <- survtab_ag(fot ~ 1, data = x, 
                   surv.method = "lifetable",
                   relsurv.method = "pp",
                   d = c("from0to0", "from0to2"), 
                   n.cens = "from0to1",
                   n.cens.pp = "from0to1.pp",
                   n.pp = "at.risk.pp",
                   d.pp = c("from0to0.pp", "from0to2.pp"),
                   d.pp.2 = c("from0to0.pp.2", "from0to2.pp.2"))
})





test_that("update() works with survtab objects", {
  data(sire)
  set.seed(1)
  sire <- sire[sample(1:.N, 100)]
  
  BL <- list(fot=seq(0, 5, by = 1/12),
             per = c("2008-01-01", "2013-01-01"))
  x <- lexpand(sire, 
               birth = bi_date, entry = dg_date, exit = ex_date,
               status = status %in% 1:2,
               breaks = BL,
               pophaz = popmort,
               aggre = list(sex, fot))
  
  
  st <- survtab_ag(fot ~ 1, data = x)
  sts <- survtab_ag(fot ~ sex, data = x)
  
  expect_equal(sts, update(st, formula. = fot ~ sex))
  
  
  library(Epi)
  library(survival)
  x <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)), 
             exit = list(CAL = get.yrs(ex_date)), 
             data = sire[sire$dg_date < sire$ex_date, ],
             entry.status = 0L,
             exit.status = as.integer(status %in% 1:2), 
             merge = TRUE)
  
  set.seed(1L)
  x$group <- rbinom(nrow(x), 1, 0.5)
  
  st <- survtab(FUT ~ group, data = x, 
                surv.type = "surv.obs",
                breaks = list(FUT = seq(0, 5, 1/12)))
  
  sts <- survtab(FUT ~ 1, data = x, 
                 surv.type = "surv.obs",
                 breaks = list(FUT = seq(0, 5, 1/12)))
  
  expect_equal(sts, update(st, . ~ -group))
  
})





test_that("internal weights work as intended", {
  library("data.table")
  data("sire")
  sire$agegr <- cut(sire$dg_age,c(0,45,55,65,75,Inf),right=F)
  BL <- list(fot=seq(0, 5, by = 1/12),
             per = c("2008-01-01", "2013-01-01"))
  x <- lexpand(sire, birth = bi_date, entry = dg_date, exit = ex_date,
               status = status %in% 1:2,
               breaks = BL,
               pophaz = popmort,
               aggre = list(fot,agegr))

  ## age standardisation using internal weights (age distribution of
  ## patients diagnosed within the period window)
  w <- x[fot == 0, .(weights = sum(at.risk)), keyby = agegr]

  st <- survtab_ag(fot ~ adjust(agegr), data = x, weights=w)
  
  st2 <- survtab_ag(fot ~ adjust(agegr), data = x, weights = "internal")
  
  expect_equal(st$surv.obs.as.lo, st2$surv.obs.as.lo)
  
})





test_that("survtab_ag works with bare data.frames", {
  
  data(sire)
  
  BL <- list(fot = 0:5,
             per = c("2008-01-01", "2013-01-01"))
  x <- lexpand(sire, birth = bi_date, entry = dg_date, exit = ex_date,
               status = status %in% 1:2,
               breaks = BL,
               aggre = list(fot))
  
  e <- quote(survtab_ag(fot ~ 1, data = x, surv.type = "surv.obs"))
  eb <- quote(survtab_ag(fot ~ 1, data = x, surv.type = "surv.obs", 
                         surv.breaks = 0:5))
  
  la <- list(eval(e), eval(eb))
  expect_equal(la[[1]]$surv.obs.hi, la[[2]]$surv.obs.hi)
  
  
  x <- data.frame(x)
  er <- paste0("Data did not contain breaks and no breaks ",
               "were supplied by hand.")
  expect_error(eval(e), regexp = er)
  expect_equal(eval(eb)$surv.obs.hi, la[[2]]$surv.obs.hi)
  
})






test_that("confidence intervals are as intended", {
  skip_on_cran()
  
  library(Epi)
  library(survival)

  ## NOTE: recommended to use factor status variable
  x <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)),
             exit = list(CAL = get.yrs(ex_date)),
             data = popEpi::sire[sire$dg_date < sire$ex_date, ],
             entry.status = 0L,
             exit.status = as.integer(status %in% 1:2),
             merge = TRUE)

  ## phony group variable
  set.seed(1L)
  x$group <- rbinom(nrow(x), 1, 0.5)

  ## log-log transformation
  st <- survtab(FUT ~ group, data = x,
                surv.type = "surv.obs",
                breaks = list(FUT = seq(0, 5, 1/12)),
                conf.type = "log-log", conf.level = 0.99)
  
  dt <- data.table(st)
  dt[, "SE.A" := sqrt(SE.surv.obs^2*(1/(surv.obs*log(surv.obs)))^2)]
  dt[, "s.lo" := surv.obs^exp(qnorm(0.995)*SE.A)]
  dt[, "s.hi" := surv.obs^exp(qnorm(0.005)*SE.A)]
  
  expect_equal(dt[, .(lo = surv.obs.lo, hi = surv.obs.hi)], 
               dt[, .(lo = s.lo, hi = s.hi)])
  
  ## log transformation
  st <- survtab(FUT ~ group, data = x,
                surv.type = "surv.obs",
                breaks = list(FUT = seq(0, 5, 1/12)),
                conf.type = "log", conf.level = 0.80)
  
  dt <- data.table(st)
  dt[, "SE.A" := SE.surv.obs/surv.obs]
  dt[, "s.lo" := surv.obs*exp(qnorm(0.10)*SE.A)]
  dt[, "s.hi" := surv.obs*exp(qnorm(0.90)*SE.A)]
  
  expect_equal(dt[, .(lo = surv.obs.lo, hi = surv.obs.hi)], 
               dt[, .(lo = s.lo, hi = s.hi)])
  
  
})







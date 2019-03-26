context("adjusted curves from survtab")

test_that("adjusted SEs and curves are what expected", {
  skip_on_cran()
  
  sire <- data.table::data.table(popEpi::sire)
  
  ## calculate age-standardised 5-year relative survival ratio using
  ## Ederer II method and period approach
  
  sire$agegr <- cut(sire$dg_age, c(0,45,55,65,75,Inf), right = FALSE)
  BL <- list(fot=seq(0, 5, by = 1/12),
             per = c("2008-01-01", "2013-01-01"))
  x <- lexpand(sire, birth = bi_date, entry = dg_date, exit = ex_date,
               status = status %in% 1:2,
               breaks = BL,
               pophaz = popmort,
               aggre = list(agegr, fot))
  
  ## age standardisation using internal weights (age distribution of
  ## patients diagnosed within the period window)
  ## (NOTE: what is done here is equivalent to using weights = "internal")
  w <- aggregate(at.risk ~ agegr, data = x[x$fot == 0, ], FUN = sum)
  names(w) <- c("agegr", "weights")
  
  st_raw <- survtab_ag(fot ~ agegr, data = x)
  st_raw_pp <- survtab_ag(fot ~ agegr, data = x,  
                          relsurv.method = "pp", 
                          d.pp = "from0to1.pp", 
                          d.pp.2 = "from0to1.pp.2", 
                          n.cens.pp = "from0to0.pp", 
                          pyrs.pp = "ptime.pp",
                          n.cens = "from0to0")
  
  st_adj <- survtab_ag(fot ~ adjust(agegr), data = x, weights = w)
  st_adj_pp <- survtab_ag(fot ~ adjust(agegr), data = x, weights = w, 
                          relsurv.method = "pp", 
                          d.pp = "from0to1.pp", 
                          d.pp.2 = "from0to1.pp.2", 
                          n.cens.pp = "from0to0.pp", 
                          pyrs.pp = "ptime.pp",
                          n.cens = "from0to0")
  
  dt_raw <- data.table::data.table(st_raw)
  dt_raw_pp <- data.table::data.table(st_raw_pp)
  data.table::set(
    dt_raw, j = c("r.pp", "SE.r.pp"), 
    value = mget(c("r.pp", "SE.r.pp"), as.environment(dt_raw_pp))
  )
  
  dt_adj <- data.table::data.table(st_adj)
  dt_adj_pp <- data.table::data.table(st_adj_pp)
  data.table::set(
    dt_adj, j = c("r.pp.as", "SE.r.pp.as"), 
    value = mget(c("r.pp.as", "SE.r.pp.as"), as.environment(dt_adj_pp))
  )
  
  
  w$weights <- w$weights/sum(w$weights)
  dt_raw <- merge(dt_raw, w, by = "agegr", all = TRUE)
  dt_raw_adj <- dt_raw[, .("surv.obs.as" = sum(weights * surv.obs), 
                           "SE.surv.obs.as" = sqrt(sum((weights^2)*(SE.surv.obs^2))),
                           "r.e2.as" = sum(weights * r.e2), 
                           "SE.r.e2.as" = sqrt(sum((weights^2)*(SE.r.e2^2))),
                           "r.pp.as" = sum(weights * r.pp), 
                           "SE.r.pp.as" = sqrt(sum((weights^2)*(SE.r.pp^2))),
                           "pyrs" = sum(pyrs)), 
                       keyby = "surv.int"]
  
  expect_equal(
    dt_raw_adj, dt_adj[, .SD, .SDcols = names(dt_raw_adj)]
  )
  
  
  
})

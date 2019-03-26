context("Compare splitMulti results with splitLexis results")





test_that("splitMulti and splitLexis are congruent", {
  expect_identical(1L, 1L) ## to trigger testing...
  skip_usually()
  library(Epi)
  
  sire2 <- copy(sire)
  sire2[, dg_yrs := get.yrs(dg_date, "actual")]
  sire2[, ex_yrs := get.yrs(ex_date, "actual")]
  sire2[, bi_yrs := get.yrs(bi_date, "actual")]
  sire2[, id := 1:.N]
  
  BL1 <- list(fot = 0:5, per = 1990:1995, age = c(0, 60, Inf))
  
  BL2 <- list(fot = c(10,Inf), age = seq(0,150,5))
  
  BL3 <- list(fot = c(5, Inf), per = c(1900, 2100), age = c(25,100))
  
  BL4 <- list(fot = 0:10)
  
  BL5 <- list(fot = 5:10)
  
  BL6 <- list(per = 1990:2000, age = c(50,70))
  
  
  BL <- list(BL1, BL2, BL3, BL4, BL5, BL6)
  
  x <- Lexis(data=sire2[dg_date < ex_date], entry=list(fot=0, per=dg_yrs, age=dg_age),
             exit=list(per=ex_yrs), merge=TRUE, exit.status=1L, entry.status = 0L)
  setDT(x)
  setattr(x, "class", c("Lexis", "data.table", "data.frame"))
  
  
  # one row per id ---------------------------------------------------------------
  
  test_that("splitMulti and splitLexis congruent with one row per id", {
    expect_identical(1L, 1L) ## to trigger testing...
    for (sc in seq_along(BL)) {
      compareSMWithEpi(x, BL[[sc]])
    }
  })
  
  
  
  # multiple rows per id ---------------------------------------------------------
  
  sire2 <- sire2[rep(1:.N, each = 2)]
  
  x <- Lexis(data=sire2[dg_date < ex_date], entry=list(fot=0, per=dg_yrs, age=dg_age),
             exit=list(per=ex_yrs), merge=TRUE, exit.status=1L, entry.status = 0L, id = id)
  setDT(x)
  setattr(x, "class", c("Lexis", "data.table", "data.frame"))
  
  for (sc in seq_along(BL)) {
    test_that(paste0("splitLexisDT and splitLexis congruent with multiple rows per id with breaks no. ", sc), {
      expect_identical(1L, 1L) ## to trigger testing...
      compareSMWithEpi(x, BL[[sc]])
    })
  }
  
  # multistate using Lexis -----------------------------------------------------
  
  
  sire2[, "EX" := factor(status, levels = 0:2, ordered = TRUE)]    
  sire2[, "EN" := factor(0L, levels = 0:2, ordered = TRUE)]
  levels(sire2$EX) <- levels(sire2$EN) <- c("ok", "dead", "dead")
  
  x <- Lexis(data=sire2[dg_date < ex_date & !duplicated(id)], entry=list(fot=0, per=bi_yrs, age=0),
             exit=list(per=ex_yrs), merge=TRUE, exit.status=EX, entry.status = EN, id = id)
  
  x <- cutLexis(x, cut = x$dg_yrs, timescale = "per", new.state = "sick", precursor.state = "ok")
  setDT(x)   
  setattr(x, "class", c("Lexis", "data.table", "data.frame"))
  
  BL[[1L]] <- NULL ## this would drop all rows in split data
  
  for (sc in seq_along(BL)) {
    test_that(paste0("splitLexisDT and splitLexis congruent with multiple Lexis states per id using breaks list no. ", sc), {
      expect_identical(1L, 1L) ## to trigger testing...
      compareSMWithEpi(x, BL[[sc]])
    })
  }
  
  
})




test_that("splitMulti agrees with splitLexis, vol. II", {
  
  library("Epi")
  
  data(nickel, package = "Epi")
  
  lex <- Lexis( entry = list(age=agein,
                             per=agein+dob),
                exit = list(age=ageout),
                exit.status = factor(icd>0, labels=c("Alive","Dead")),
                entry.status = factor(0, 0:1, labels = c("Alive", "Dead")),
                data = nickel )
  
  set.seed(1337)
  lex$lex.id <- sample(paste0("abcd_", 1:nrow(lex)), size = nrow(lex))
  
  lex_copy <- copy(lex)
  
  BL <- list(
    per = 1920:1990,
    age = 0:100
  )
  
  epi_s1 <- splitLexis(lex, breaks = BL$per, time.scale = "per")
  epi_s2 <- splitLexis(epi_s1, breaks = BL$age, time.scale = "age")
  
  pop_s1 <- splitLexisDT(lex, breaks=BL$per, timeScale="per", drop = FALSE)
  pop_s2 <- splitLexisDT(pop_s1, breaks=BL$age, timeScale="age" , drop = FALSE)
  
  pop_sm <- splitMulti(lex, breaks = BL, drop = FALSE)
  
  expect_equal(
    setDT(epi_s2), setDT(pop_sm), check.attributes = FALSE
  )
  expect_equal(
    setDT(epi_s2), setDT(pop_s2), check.attributes = FALSE
  )
  expect_identical(
    lex, lex_copy
  )
  
})










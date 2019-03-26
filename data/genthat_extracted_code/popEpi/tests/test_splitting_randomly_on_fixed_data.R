context("Splitting tests on fixed data and random breaks")





test_that("splitting funs congruent with random splitting and fixed data", {

  skip_usually()

  library("Epi")
  library("data.table")

  data("occup", package = "Epi")

  occup <- Epi::Lexis(
    entry = list(age = AoE, per = DoE),
    exit = list(per = DoX),
    entry.status = 0L,
    exit.status = as.integer(Xst == "D"),
    data = occup
  )
  
  
  data("DMlate", package = "Epi")
  
  DMlate <- Epi::Lexis(
    entry = list(fot = 0, per = dodm, age = dodm-dobth),
    exit = list(per = dox),
    entry.status = 0L,
    exit.status = as.integer(!is.na(dodth)),
    data = DMlate[DMlate$dox>DMlate$dodm, ]
  )
  
  data("DMrand", package = "Epi")
  
  DMrand <- Epi::Lexis(
    entry = list(fot = 0, per = dodm, age = dodm-dobth),
    exit = list(per = dox),
    entry.status = 0L,
    exit.status = as.integer(!is.na(dodth)),
    data = DMrand[DMrand$dox>DMrand$dodm, ]
  )
  
  data("thoro", package = "Epi")
  
  thoro <- Epi::Lexis(
    entry = list(fot = 0L, per = injecdat, age = injecdat-birthdat),
    exit = list(per = exitdat),
    entry.status = 0L,
    exit.status = as.integer(exitstat == 1),
    data = thoro[thoro$injecdat < thoro$exitdat, ]
  )
  
  sire <- setDT(copy(popEpi::sire))
  sire[, "dg_yrs" := get.yrs(dg_date, "actual")]
  sire[, "ex_yrs" := get.yrs(ex_date, "actual")]
  sire[, "bi_yrs" := get.yrs(bi_date, "actual")]
  sire[, "id":= 1:.N]
  sire <- Lexis(
    data=sire[dg_date < ex_date],
    entry=list(fot=0, per=dg_yrs, age=dg_age),
    exit=list(per=ex_yrs),
    merge=TRUE,
    exit.status = status,
    entry.status = 0L
  )


  sibr <- setDT(copy(popEpi::sibr))
  sibr[, "dg_yrs" := get.yrs(dg_date, "actual")]
  sibr[, "ex_yrs" := get.yrs(ex_date, "actual")]
  sibr[, "bi_yrs" := get.yrs(bi_date, "actual")]
  sibr[, "id":= 1:.N]
  sibr <- Lexis(
    data=sibr[dg_date < ex_date],
    entry=list(fot=0, per=dg_yrs, age=dg_age),
    exit=list(per=ex_yrs),
    merge=TRUE,
    exit.status = status,
    entry.status = 0L
  )

  lex_list <- list(
    occup = occup,
    DMlate = DMlate,
    DMrand = DMrand,
    thoro = thoro,
    sire = sire,
    sibr = sibr
  )
  lex_list[] <- lapply(lex_list, function(df) {
    df$lex.id <- sample(df$lex.id, nrow(df), replace = FALSE)
    df
  })

  n_random_splits <- 500
  invisible(lapply(names(lex_list), function(lex_nm) {
    lapply(1:n_random_splits, function(i) {
      used_seed <- get_random_seed()
      set.seed(used_seed)
      l <- random_splitting_on(lex = lex_list[[lex_nm]], n.max.breaks = 50)
      # list contents in order: Epi::splitLexis, splitLexisDT, splitMulti

      lapply(2:length(l), function(list_pos) {

        tt_msg <- paste0(
          "Epi::splitLexis and ", c("splitLexisDT", "splitMulti")[list_pos-1],
          " are in agreement in data '", lex_nm, "' using seed ", used_seed
        )

        test_that(tt_msg, {
          expect_equal(l[[1]], l[[list_pos]], check.attributes = FALSE)
        })

      })

      test_that(
        paste0(
          "splitLexisDT and splitMulti are in agreement in data '", lex_nm,
          "' using seed ", used_seed
        ),
        expect_equal(l[[2]], l[[3]], check.attributes = TRUE)
      )

    })
  }))



})










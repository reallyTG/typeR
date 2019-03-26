context("Splitting tests on random data and random breaks")





test_that("splitting funs congruent with random splitting and random data", {

  skip_usually()

  library("Epi")
  library("data.table")

  n_datasets <- 100
  n_random_splits <- 50
  lapply(seq_len(n_datasets), function(lex_nm) {

    data_seed <- get_random_seed()
    lex <- random_Lexis(
      n.rows = 100:2000,
      n.time.scales = 1:10,
      n.statuses = 2:10,
      n.other.vars = 1
    )

    lapply(seq_len(n_random_splits), function(i) {
      split_seed <- get_random_seed()
      set.seed(split_seed)
      l <- random_splitting_on(lex = lex, n.max.breaks = 50)
      # list contents in order: Epi::splitLexis, splitLexisDT, splitMulti

      lapply(2:length(l), function(list_pos) {

        tt_msg <- paste0(
          "Epi::splitLexis and ", c("splitLexisDT", "splitMulti")[list_pos-1],
          " are in agreement in data '", lex_nm,
          "' using data seed ", data_seed, " and splitting seed ", split_seed
        )

        test_that(tt_msg, {
          expect_equal(l[[1]], l[[list_pos]], check.attributes = FALSE)
        })

      })

      test_that(
        paste0(
          "splitLexisDT and splitMulti are in agreement in data '", lex_nm,
          "' using data seed ", data_seed, " and splitting seed ", split_seed
        ),
        expect_equal(l[[2]], l[[3]], check.attributes = TRUE)
      )

    })
  })



})

context("veto sic") 

test_that("Error handling", {
  expect_error(veto_sic("A [sic]", quote = FALSE, sentence = FALSE, words_ante = "foo"),
               regexp = '`words_ante = "foo"` was type character, but must be an integer.',
               fixed = TRUE)
  expect_error(veto_sic("A [sic]", quote = FALSE, sentence = FALSE, words_ante = 0:1),
               regexp = '`words_ante = 0:1` had length 2, but must be length-one.',
               fixed = TRUE)
  expect_error(veto_sic("A [sic]", quote = FALSE, sentence = FALSE, words_ante = -1L),
               regexp = 'words_ante = -1L` was not a positive integer.',
               fixed = TRUE)
})

test_that("Veto quote", {
  res <- 
    veto_sic(  c("A large dog", "Rob remarked, ``sdoifhsdfi'' [sic] ok?", "Yet some don't. Are you sdfih [sic]."))
  expect_equal(res,
               c("A large dog", "Rob remarked,                      ok?", "                                   ."))
  
})

test_that("Veto sentence", {
  res <- 
    veto_sic(  c("A large dog", "Rob remarked, ``sdoifhsdfi'' [sic] ok?", "Yet some don't. Are you sdfih [sic]."),
               quote = FALSE, sentence = TRUE)
  
  expect_equal(res,
               c("A large dog", "                                   ok?", "Yet some don't.                    ."))
  
})

test_that("Veto words before", {
  res <- 
    veto_sic(  c("A large dog", "Rob remarked, ``sdoifhsdfi'' [sic] ok?", "Yet some don't. Are you sdfih [sic]."),
               quote = FALSE, sentence = FALSE, words_ante = 1L)
  
  expect_equal(res,
               c("A large dog", "Rob remarked                       ok?", "Yet some don't. Are you            ."))
})


test_that("Veto words before", {
  res <- 
    veto_sic(  c("A large dog", "Rob remarked, ``sdoifhsdfi'' [sic] ok?", "Yet some don't. Are you sdfih [sic]."),
               quote = FALSE, sentence = FALSE, words_ante = 2L)
  
  expect_equal(res,
               c("A large dog", "Rob                                ok?", "Yet some don't. Are                ."))
  
  
  res <- 
    veto_sic(  c("A large dog", "Rob remarked, ``sdoifhsdfi'' [sic] ok?", "Yet some don't. Are you sdfih [sic].", "Mostly [sic]", "Mostly [sic] words appear solitary [sic], opm"),
               quote = FALSE, sentence = FALSE, words_ante = 2L)
  
  expect_equal(res,
               c("A large dog", "Rob                                ok?", "Yet some don't. Are                .", "            ", "             words                        opm"))
  
})

test_that("With check_spelling", {
  expect_null(check_spelling("./spelling/sic/sic-vetoes.tex"))
})


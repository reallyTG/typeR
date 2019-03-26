context("Gene Expression Processing")

suppressMessages(library('testthat'))
suppressMessages(library('dplyr'))
suppressMessages(library('magrittr'))
suppressMessages(library('purrr'))
suppressMessages(library('stringr'))
suppressMessages(library('tibble'))
suppressMessages(library('tidyr'))
suppressMessages(library('ROI.plugin.ecos'))
suppressMessages(library('fbar'))

data("ecoli_core")
data("iJO1366")

test_that("works with missing values, boolean", {
  genes <- letters[1:2]
  presences <- c(T,F)
  expressions <- c('a','','b')
  expect_equal(fbar::gene_eval(expressions, genes, presences)==1, c(T,NA,F))
})

test_that("works with single values, boolean", {
  genes <- letters[1:3]
  presences <- c(T,T,F)
  expressions <- letters[c(1,2,3,1)]
  expect_equal(fbar::gene_eval(expressions, genes, presences)==1, c(T,T,F,T))
})

test_that("works with double value expressions, boolean", {
  genes <- letters[1:3]
  presences <- c(T,T,F)
  expressions <- c('a & b', 'b | a', 'b & c', 'c | b')
  expect_equal(fbar::gene_eval(expressions, genes, presences)==1, c(T,T,F,T))
})

test_that("works with multi value expressions, boolean", {
  genes <- letters[1:3]
  presences <- c(T,T,F)
  expressions <- c('(a & b) | c', '(b | a) & c', '(b & c) | b', 'c & (c | b)')
  expect_equal(fbar::gene_eval(expressions, genes, presences)==1, c(T,F,T,F))
})

test_that('works with ecoli_core', {
  genes <- data_frame(name = stringr::str_extract_all(ecoli_core$geneAssociation, '[[:alpha:]][0-9]{4}') %>%
    flatten_chr() %>%
    discard(is.na)
  ) %>%
    mutate(presence = runif(n())<0.05)
  
  
  res <- ecoli_core %>%
    mutate(geneAssociation = str_replace_all(geneAssociation, fixed('or'), '|'),
           geneAssociation = str_replace_all(geneAssociation, fixed('and'), '&')) %>%
    gene_associate(genes)
  
  expect_true(all(is.finite(res$lowbnd)))
  expect_true(all(is.finite(res$uppbnd)))
})

test_that('works with iJO1366', {
  genes <- data_frame(name = stringr::str_extract_all(iJO1366$geneAssociation, '[[:alpha:]][0-9]{4}') %>%
                        flatten_chr() %>%
                        discard(is.na)
  ) %>%
    mutate(presence = runif(n())<0.05)
  
  
  res <- iJO1366 %>%
    mutate(geneAssociation = str_replace_all(geneAssociation, fixed('or'), '|'),
           geneAssociation = str_replace_all(geneAssociation, fixed('and'), '&')) %>%
    gene_associate(genes)
  
  expect_true(all(is.finite(res$lowbnd)))
  expect_true(all(is.finite(res$uppbnd)))
})
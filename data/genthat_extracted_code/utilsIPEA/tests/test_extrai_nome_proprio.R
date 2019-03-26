# test_that("nomes proprios", {
#   nomes <- c("Carlos das Neves", "Pedro dos Anjos", "Ana Santos", "Edileusa maria Ferreira", "Maria Eduarda Almeida")
#   nomes_proprios <- c("CARLOS","PEDRO","ANA","EDILEUSA MARIA","MARIA EDUARDA")
#   nomes_retorno <- extrai_NomeProprio(nomes)
#   expect_equal(nomes_proprios, nomes_retorno)
# })
#
#
# test_that("nomes proprios com sexo e sobrenome", {
#   nomes <- c("Edileusamaria Ferreira", "Carlos das Neves", "Pedro dos Anjos", "Ana Santos", "Maria Eduarda Almeida")
#   nomes_proprios <- data.frame(NomeProprio = c("EDILEUSA MARIA","CARLOS","PEDRO","ANA","MARIA EDUARDA"), surname = c("FERREIRA", "DAS NEVES", "DOS ANJOS", "SANTOS", "ALMEIDA"), gender = c(2,1,1,2,2), stringsAsFactors = FALSE)
#   nomes_retorno <- extrai_NomeProprio(nomes,gender = TRUE, surname = TRUE)
#   expect_equal(c("NomeProprio","surname","gender"), names(nomes_retorno))
#   expect_equal(nomes_proprios, nomes_retorno)
# })
#
#
# test_that("nomes proprios sem sobrenome, sem sexo e sem stringdist", {
#   nomes <- c("Carlos das Neves", "Pedro dos Anjos", "Ana Santos", "Edileusa maria Ferreira", "Maria Eduarda Almeida")
#   nomes_proprios <- c("CARLOS","PEDRO","ANA","EDILEUSAMARIA","MARIAEDUARDA")
#   nomes_retorno <- extrai_NomeProprio(nomes,surname = FALSE, spaces = FALSE, stringdist = FALSE)
#   expect_equal(nomes_proprios, nomes_retorno)
# })
#
#
# test_that("nomes proprios sem espaços e com sobrenome", {
#   nomes <- c("Edileusa maria Ferreira", "Carlos das Neves", "Pedro dos Anjos", "Ana Santos", "Maria Eduarda Almeida")
#   nomes_proprios <- data.frame(NomeProprio = c("EDILEUSAMARIA","CARLOS","PEDRO","ANA","MARIAEDUARDA"), surname = c("FERREIRA", "DASNEVES", "DOSANJOS", "SANTOS", "ALMEIDA"), stringsAsFactors = FALSE)
#   nomes_retorno <- extrai_NomeProprio(nomes,surname = TRUE, spaces = FALSE, stringdist = FALSE)
#   expect_equal(c("NomeProprio","surname"), names(nomes_retorno))
#   expect_equal(nomes_proprios, nomes_retorno)
# })

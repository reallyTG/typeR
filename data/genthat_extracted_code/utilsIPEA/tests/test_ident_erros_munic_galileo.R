context("Teste do ident_erros_munic_galileo")

test_that("ident_erros_munic_galileo", {
  data("geocod_base", envir = environment())
  geocod_base <- ident_erros_munic_galileo(geocod_base, uf=geocod_base$uf, match=geocod_base$MatchedAddress, mun=geocod_base$Nome_Municipio)
  expect_equal(c(F,F,F,T,T), geocod_base$munmatch)
})

test_that("abrevia nome do meio nomes", {
  nomes <- c("Joao Pereira Neves", "Pedro Aparecido Anjos", "Maria Joaquina Gracas")
  nomes_abreviados <- c("Joao P Neves", "Pedro A Anjos", "Maria J Gracas")
  base <- data.table(nome = nomes)
  base <- abrevia_nome_meio(base, "nome")
  expect_equal(c("nome", "nome_abrev"), names(base))
  expect_equal(nomes_abreviados, base$nome_abrev)
})

test_that("abrevia nome do meio  de um vetor de caracteres", {
  nomes <- c("Joao Pereira Neves", "Pedro Aparecido Anjos", "Maria Joaquina Gracas", "Pedro Silva", "")
  nomes_abreviados <- c("Joao P Neves", "Pedro A Anjos", "Maria J Gracas", "Pedro Silva", "")
  retorno <- abrevia_nome_meio(base = nomes)
  expect_equal(nomes_abreviados, retorno)
})

test_that("abrevia nome do meio com dois nomes  de um vetor de caracteres", {
  nomes <- c("Joao Pereira Alberto Neves", "Pedro Aparecido Carmo Anjos", "Maria Joaquina Pinto Gracas")
  nomes_abreviados <- c("Joao P A Neves", "Pedro A C Anjos", "Maria J P Gracas")
  expect_equal(nomes_abreviados, abrevia_nome_meio(base = nomes))
})

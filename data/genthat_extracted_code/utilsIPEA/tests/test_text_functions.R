test_that("remove_preposicao_nomes", {
  nomes <- c("João das Neves", "Pedro dos Anjos", "Maria das Gracas")
  nomes_sem_preposicao <- c("João Neves", "Pedro Anjos", "Maria Gracas")
  base <- data.table(nome = nomes)
  base <- remove_preposicao_nomes(base, "nome")
  expect_equal(c("nome", "nome_semD"), names(base))
  expect_equal(nomes_sem_preposicao, base$nome_semD)
})

test_that("remove_preposicao_nomes de um vetor de caracteres", {
  nomes <- c("João das Neves", "Pedro dos Anjos", "Maria das Gracas")
  nomes_sem_preposicao <- c("João Neves", "Pedro Anjos", "Maria Gracas")
  expect_equal(nomes_sem_preposicao, remove_preposicao_nomes(nomes))
})

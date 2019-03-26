
test_that("nome_de_solteira teste penúltimo nome", {
  nome_casada <- "Joana Neves Silva Pinto"
  nome_conjuge <- "João Neves Cunha"
  nome_antes_casar <- list("Joana Silva Pinto")
  resultado <- nome_de_solteira(nome_casada, nome_conjuge)
  expect_equal(nome_antes_casar, resultado)
})


test_that("nome_de_solteira teste para mais de um nome possível", {
  nome_casada <- "Joana Neves da Silva Pinto"
  nome_conjuge <- "João Neves Cunha da Silva"
  nome_antes_casar <- list("Joana Silva Pinto", "Joana Neves Pinto")
  resultado <- nome_de_solteira(nome_casada, nome_conjuge)
  expect_equal(nome_antes_casar, resultado)
})


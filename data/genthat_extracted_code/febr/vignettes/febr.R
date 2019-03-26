## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)
library(magrittr)
library(glue)
library(pander)
panderOptions("table.alignment.default", "left")
panderOptions("table.split.table", Inf)

## ------------------------------------------------------------------------
#  install.packages("febr")

## ------------------------------------------------------------------------
#  if (!require(devtools)) {
#    install.packages(pkgs = "devtools")
#  }
#  devtools::install_github(repo = "febr-team/febr-package")

## ---- echo=FALSE, results='asis', eval=TRUE------------------------------
# ver <- readLines("./DESCRIPTION")
# idx <- sapply(ver, function (x) grepl(pattern = "Version:", x = x))
# ver <- gsub(pattern = "Version: ", replacement = "", ver[idx])
rbind(
  c("`header`", "Estrutural", "Descarregar o cabeçalho das tabelas de dados"),
  c("`standard`", "Estrutural", glue("Descarregar os padrões de codificação e nomenclatura do ___febr___")),
  c("`unit`", "Estrutural", glue("Descarregar os padrões de unidades de medida do ___febr___")),
  c("`dataset`", "Acesso", "Descarregar informações gerais sobre um conjunto de dados"),
  c("`observation`", "Acesso", "Descarregar dados das observações do solo de um conjunto de dados"),
  c("`layer`", "Acesso", "Descarregar dados das camadas das observações do solo de um conjunto de dados"),
  c("`metadata`", "Acesso", "Descarregar metadados de um conjunto de dados"),
  c("`febr`", "Acesso", "Descarregar todos os dados e metadados de um conjunto de dados"),
  c("`febr2spdf`", "Auxiliar", "Criar objeto de classe `SpatialPointsDataFrame`"),
  c("`febr2xlsx`", "Auxiliar", "Escrever dados para arquivo XLSX"),
  c("`goto`", "Auxiliar", glue("Visitar páginas do ___febr___ na Internet"))
  ) %>% 
  pandoc.table(
    # caption = glue::glue("Funções disponíveis no pacote `febr` versão {ver}."),
    caption = glue::glue("Funções disponíveis no pacote `febr` versão 1.0-0."),
    col.names = c("Função", "Grupo", "Descrição"))

## ------------------------------------------------------------------------
#  cab <- febr::header(dataset = "ctb0003", table = "camada", variable = "all")

## ------------------------------------------------------------------------
#  pad <- febr::standard(variable = c("argila", "densidade", "carbono", "ph"))

## ------------------------------------------------------------------------
#  uni <- febr::unit(source = "Mg/m^3", target = "kg/dm^3")

## ------------------------------------------------------------------------
#  conj <- febr::dataset(dataset = c("ctb0003", "ctb0036"))

## ------------------------------------------------------------------------
#  meta <- febr::metadata(dataset = c("ctb0003", "ctb0036"))

## ------------------------------------------------------------------------
#  obs <- febr::observation(dataset = "ctb0003", variable = "taxon")

## ------------------------------------------------------------------------
#  cam <- febr::layer(dataset = c("ctb0003", "ctb0036"), variable = c("argila", "carbono", "densidade"))

## ------------------------------------------------------------------------
#  tudo <- febr::febr(
#    dataset = "ctb0003", variable = "all", merge = TRUE,
#    missing = list(coord = "drop", time = "drop", depth = "drop"),
#    standardization = list(
#      crs = "EPSG:4674", time.format = "%Y-%m-%d",
#      repetition = "combine", combine.fun = "mean",
#      transition = "smooth", smoothing.fun = "mean",
#      plus.sign = "add", plus.depth = 2.5,
#      lessthan.sign = "subtract", lessthan.frac = 0.1,
#      units = TRUE, round = TRUE))

## ------------------------------------------------------------------------
#  library(magrittr)
#  obs <-
#    febr::observation(dataset = "ctb0003", variable = "taxon") %>%
#    febr::febr2spdf()

## ------------------------------------------------------------------------
#  tudo <-
#    febr::febr(dataset = "ctb0003", variable = "all") %>%
#    febr::febr2xlsx(file = "ctb0003.xlsx")

## ------------------------------------------------------------------------
#  febr::goto(dataset = "ctb0036", table = "camada")


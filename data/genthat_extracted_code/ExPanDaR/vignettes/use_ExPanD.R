## ----setup, include = FALSE----------------------------------------------
library(ExPanDaR)
library(gapminder)

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----expand_file, eval = FALSE-------------------------------------------
#  devtools::install_github("joachim-gassen/ExPanDaR")
#  library(ExPanDaR)
#  
#  ExPanD()

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_file_01.jpg")

## ----gapminder-----------------------------------------------------------
library(gapminder)
# write.csv(gapminder, file = "gapminder.csv", row.names = FALSE)
head(gapminder, 10)

## ----gapminder duplicates------------------------------------------------
any(duplicated(gapminder[,c("country", "year")]))

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_file_02.jpg")

## ----expand_simple, eval = FALSE-----------------------------------------
#  devtools::install_github("joachim-gassen/ExPanDaR")
#  library(ExPanDaR)
#  library(gapminder)
#  
#  ExPanD(df = gapminder, cs_id = "country", ts_id = "year")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_simple_01.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_simple_02.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_simple_03.jpg")

## ----simple_expland_config, eval = FALSE---------------------------------
#  ExPanD_config <- readRDS("ExPanD_config.RDS")
#  ExPanD(df = gapminder, cs_id = "country", ts_id = "year", config_list = ExPanD_config)

## ----var_def-------------------------------------------------------------
head(worldbank_var_def, 10)

## ----worldbank, eval = FALSE---------------------------------------------
#  library(ExPanDaR)
#  
#  ExPanD(df = worldbank,
#         df_def = worldbank_data_def,
#         var_def = worldbank_var_def,
#         config_list = ExPanD_config_worldbank)

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_worldbank_01.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_worldbank_02.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_worldbank_03.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_worldbank_04.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_worldbank_05.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_worldbank_06.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_worldbank_07.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_worldbank_08.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_worldbank_09.jpg")

## ----expand_two_samples, eval = FALSE------------------------------------
#  library(ExPanDaR)
#  set.seed(42)
#  training_sample <- sample(nrow(russell_3000), round(.5*nrow(russell_3000)))
#  test_sample <- setdiff(1:nrow(russell_3000), training_sample)
#  
#  ExPanD(df = list(russell_3000[training_sample, ], russell_3000[test_sample, ]),
#         df_def = russell_3000_data_def,
#         df_name = c("Training sample", "Test sample"))

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_two_samples_01.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_two_samples_02.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_two_samples_03.jpg")

## ---- out.width = "90%", fig.align="center", fig.border = "none", echo=FALSE----
knitr::include_graphics("figures/ExPanD_two_samples_04.jpg")


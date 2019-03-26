## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  message = FALSE,
  warning = FALSE,
  eval = FALSE
)

## ------------------------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("ropensci/essurvey")

## ------------------------------------------------------------------------
#  install.packages("essurvey")

## ---- echo = FALSE, eval = TRUE------------------------------------------
library(essurvey)

## ------------------------------------------------------------------------
#  set_email("your@email.com")

## ---- eval = TRUE--------------------------------------------------------
show_countries()

## ---- eval = TRUE--------------------------------------------------------
tk_rnds <- show_country_rounds("Turkey")
tk_rnds

## ------------------------------------------------------------------------
#  turkey <-
#    import_country(
#      country = "Turkey",
#      rounds = c(2, 4)
#      )

## ------------------------------------------------------------------------
#  import_all_cntrounds("Turkey")

## ---- eval = TRUE--------------------------------------------------------
show_rounds()

## ------------------------------------------------------------------------
#  all_rounds <- import_all_rounds()

## ------------------------------------------------------------------------
#  selected_rounds <- import_rounds(c(1, 3, 6))

## ------------------------------------------------------------------------
#  download_country("Turkey", 2,
#                   output_dir = "./myfolder/")

## ------------------------------------------------------------------------
#  download_country("Turkey", 2,
#                   output_dir = "./myfolder/",
#                   format = 'sas')

## ------------------------------------------------------------------------
#  sp <- import_country("Spain", 1)
#  mean(sp$tvtot)
#  # 4.622406

## ------------------------------------------------------------------------
#  new_coding <- recode_missings(sp)
#  mean(new_coding$tvtot, na.rm = TRUE)
#  # 4.527504

## ------------------------------------------------------------------------
#  other_newcoding <- recode_missings(sp, c("Don't know", "Refusal"))
#  table(other_newcoding$tvpol)
#  #  0   1   2   3   4   5   6   7  66
#  # 167 460 610 252  95  36  26  31  45


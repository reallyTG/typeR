## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  df <- read_rpr(col_positions=c(1,2,4),
#                 widths=c(1,2,1),
#                 col_names=c('V1','V2','V3'),
#                 filepath='data.txt')

## ---- eval = FALSE-------------------------------------------------------
#  df <- read_rpr(col_positions=c(1,2,4),
#                 widths=c(1,2,1),
#                 col_names=c('V1','V2','V3'),
#                 filepath='data.txt',
#                 card_read=1,
#                 cards=2)


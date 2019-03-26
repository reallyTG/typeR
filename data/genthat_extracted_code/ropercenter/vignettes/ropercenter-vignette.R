## ----eval = FALSE--------------------------------------------------------
#  options("roper_email" = "juanita-herrera@uppermidwest.edu",
#          "roper_password" = "password123!")

## ----eval=FALSE----------------------------------------------------------
#  roper_download(file_id = "USORCCNN2015-010")

## ----eval=FALSE----------------------------------------------------------
#  roper_download(file_id = c("USORCCNN2015-010", "USORCCNN2015-009", "USORCCNN2015-008"))

## ----eval=FALSE----------------------------------------------------------
#  orccnn2015_010 <- rio::import("roper_data/USORCCNN2015-010/USORCCNN2015-010.RData")

## ----eval=FALSE----------------------------------------------------------
#  roper_download("USAIPO1982-1197G")            # Gallup Poll for June 25-28, 1982 (ASCII only)
#  gallup1982 <- read_ascii(file = "roper_data/USAIPO1982-1197G/USAIPO1982-1197G.dat",
#                           var_names = c("q09j", "weight"),
#                           var_positions = c(38, 1),
#                           var_widths = c(1, 1))

## ----eval=FALSE----------------------------------------------------------
#  library(ropercenter)
#  roper_download("USAIPOCNUS1996-9603008")      # Gallup/CNN/USA Today Poll: Politics/1996 Election (ASCII only)
#  gallup1996 <- read_ascii(file = "roper_data/USAIPOCNUS1996-9603008/USAIPOCNUS1996-9603008.dat",
#                           var_names = c("q43a", "q44", "weight"),
#                           var_cards = c(6, 6, 1),
#                           var_positions = c(62, 64, 13),
#                           var_widths = c(1, 1, 3),
#                           total_cards = 7,
#                           card_pattern = "(?<=^.{10})\\d",
#                           respondent_pattern = "(?<=^\\s{2})\\d{4}")


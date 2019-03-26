## ----eval=F, include=T---------------------------------------------------
#  install.packages(c("ggplot2", "grDevices", "grid", "qrcode"))

## ----eval=T, include=T---------------------------------------------------

library(baRcodeR)


## ----eval=F, include=T---------------------------------------------------
#  IDcodes <- uniqID_maker(user = T)

## ----eval=T, include=T---------------------------------------------------
IDcodes <- uniqID_maker(string = "example", level = 5:10, digits = 3)
IDcodes

## ----eval=T, include=T---------------------------------------------------
number_sequence <- seq(1, 10, 2)
IDcodes <- uniqID_maker(string = "example", level = number_sequence, digits = 3)

## ----eval=T, include=F---------------------------------------------------
IDcodes

## ----eval=F, include=T---------------------------------------------------
#  write.csv(IDcodes, "IDcodes.csv")

## ----eval=F, include=T---------------------------------------------------
#  IDcodes <- uniqID_hier_maker(user = T)

## ------------------------------------------------------------------------
level_one <- c("a", 1, 3)
level_two <- c("b", 1, 2)
level_three <- c("c", 10, 12)
hier_list <- list(level_one, level_two, level_three)

## ---- eval=T, include=T--------------------------------------------------
IDcodes <- uniqID_hier_maker(hierarchy = hier_list, digits = 1)

## ----eval=T, include=T---------------------------------------------------
IDcodes

## ----eval=F, include=T---------------------------------------------------
#  write.csv(IDcodes, "IDcodes.csv")

## ----eval=F, include=T---------------------------------------------------
#  # Reading in from a csv file
#  IDcodes<-read.csv("IDcodes.csv")

## ----eval=F, include=T---------------------------------------------------
#  create_PDF(user=T, Labels=IDcodes)

## ----eval=F, include=T---------------------------------------------------
#  create_PDF(Labels = IDcodes, name = "example", ErrCorr = "Q", Fsz = 2.5)

## ----eval=F, include=T---------------------------------------------------
#  
#  ## This will create a pdf sheet where the labels are printed in columns then rows. It will skip 3 rows from the top and 1 column from the left.
#  create_PDF(Labels = Labels, name = "example_advanced", ErrCorr = "Q", Fsz = 2.5, Across = F, ERows = 3, ECol = 1)


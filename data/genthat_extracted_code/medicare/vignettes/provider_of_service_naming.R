## ---- eval = T-----------------------------------------------------------
library(medicare)
# load the package data
data(pos2010, package = "medicare")
names(pos2010)[1:10]

## ------------------------------------------------------------------------
# filepath should be changed by user
filepath <- system.file("extdata", "layout10.txt", package = "medicare")
names_2010 <- pos_names_extract(filepath, pos2010)
names_2010[1:10]

## ------------------------------------------------------------------------
pos2010_renamed <- pos2010
names(pos2010_renamed) <- names_2010

## ---- error = T----------------------------------------------------------
pos2010_short <- pos2010[, 1:500]
names_2010_short <- pos_names_extract(filepath, pos2010_short)

## ---- error = T----------------------------------------------------------
pos2010_wrong_names <- pos2010
names(pos2010_wrong_names)[1:3] <- c("wrong1", "wrong2", "wrong3")
names_2010_wrong_names <- pos_names_extract(filepath, pos2010_wrong_names)

## ------------------------------------------------------------------------
for (year in 2000:2010) {
  print(year)
  print(pos_names(year)[200:205])
}


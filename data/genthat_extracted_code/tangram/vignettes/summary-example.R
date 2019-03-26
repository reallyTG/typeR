## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(tangram)

## ----iris1, comment=''---------------------------------------------------
tangram(iris)

## ----iris2, comment=''---------------------------------------------------
iris_descrip <- tangram(Species ~ Petal.Length + Petal.Width + Sepal.Length + Sepal.Width, iris)
iris_descrip

## ---- results="asis"-----------------------------------------------------
html5(iris_descrip,
      fragment=TRUE, inline="nejm.css", caption = "Iris Stats", id="tbl_iris")


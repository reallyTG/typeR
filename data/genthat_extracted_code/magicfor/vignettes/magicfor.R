## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)

## ------------------------------------------------------------------------
for (i in 1:3) {
  squared <- i ^ 2
  print(squared)
}

## ------------------------------------------------------------------------
result <- vector("numeric", 3) # prepare a container
for (i in 1:3) {
  squared <- i ^ 2
  result[i] <- squared         # change to assignment
}
result

## ------------------------------------------------------------------------
result <- data.frame(matrix(nrow = 3, ncol = 2))
colnames(result) <- c("i", "squared")
for (i in 1:3) {
  squared <- i ^ 2
  result[i, 1] <- i
  result[i, 2] <- squared
}
result

## ------------------------------------------------------------------------
library(magicfor)               # load library
magic_for(print, silent = TRUE) # call magic_for()

for (i in 1:3) {
  squared <- i ^ 2
  print(squared)
}

magic_result_as_dataframe()     # get the result

## ------------------------------------------------------------------------
magic_for(silent = TRUE)

for (i in 1:3) {
  squared <- i ^ 2
  cubed <- i ^ 3
  put(squared, cubed)
}

magic_result_as_dataframe()

## ----eval=FALSE----------------------------------------------------------
#  install.packages("devtools") # if you have not installed "devtools" package
#  devtools::install_github("hoxo-m/magicfor")

## ----eval=FALSE----------------------------------------------------------
#  install.packages("githubinstall") # if you have not installed "githubinstall" package
#  githubinstall::githubinstall("magicfor")

## ------------------------------------------------------------------------
library(magicfor)

## ------------------------------------------------------------------------
magic_for()

for (i in 1:3) {
  squared <- i ^ 2
  put(squared)
}

## ------------------------------------------------------------------------
x <- 1
put(x)

## ------------------------------------------------------------------------
magic_result_as_vector()

## ------------------------------------------------------------------------
magic_for(cat)

for (i in 1:3) {
  squared <- i ^ 2
  cat(squared, " ")
}

## ----eval=FALSE----------------------------------------------------------
#  magic_for(progress = TRUE)
#  
#  for (i in 1:3) {
#    squared <- i ^ 2
#    put(squared)
#  }

## ------------------------------------------------------------------------
magic_for(test = 2)

for (i in 1:100) {
  squared <- i ^ 2
  put(squared)
}

## ------------------------------------------------------------------------
magic_for(temp = TRUE)
is_magicalized()

for (i in 1:3) {
  squared <- i ^ 2
  put(squared)
}

is_magicalized()

## ------------------------------------------------------------------------
magic_for()
is_magicalized()

magic_free()
is_magicalized()

## ------------------------------------------------------------------------
magic_for(silent = TRUE)

for (i in 1:3) {
  squared <- i ^ 2
  put(squared)
}

magic_result_as_vector()

magic_free()
magic_result_as_vector()

## ------------------------------------------------------------------------
magic_for(silent = TRUE)

for (i in 1:3) {
  squared <- i ^ 2
  put(squared)
}

## ------------------------------------------------------------------------
magic_result()

## ------------------------------------------------------------------------
magic_result_as_vector()

## ------------------------------------------------------------------------
magic_result_as_dataframe()

## ------------------------------------------------------------------------
x <- 2
y <- 3
put(x)
put(x, y)
put(x, x ^ 2, x ^ 3)
put(x, squared = x ^ 2, cubed = x ^ 3)

## ------------------------------------------------------------------------
magic_for()

for (i in 1:3) {
  put(x = i, squared = i ^ 2, cubed = i ^ 3)
}

magic_result_as_dataframe(F)

## ------------------------------------------------------------------------
magic_for()

for (i in 1:3) {
  squared <- i ^ 2
  squared
}

magic_result_as_vector()

## ------------------------------------------------------------------------
magic_for()

for (i in 1:3) {
  squared <- i ^ 2
  if(i == 3) put(squared)
}

magic_result_as_vector()

## ------------------------------------------------------------------------
magic_for()

for (i in 1:2) {
  for (j in 1:2) {
    put(i, j, i * j)
  }
}

magic_result_as_vector()


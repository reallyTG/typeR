## ----setup, echo = FALSE, warning = FALSE--------------------------------
library(knitr)
opts_chunk$set(message = FALSE, warning = FALSE)

## ---- echo = FALSE-------------------------------------------------------
library(labelVector)

mtcars <- 
  set_label(mtcars,
            qsec = "Quarter mile time",
            am = "Automatic / Manual",
            wt = "Vehicle weight")

fit <- lm(mpg ~ qsec + am + wt, 
          data = mtcars)

# Create a summary table
res <- as.data.frame(coef(summary(fit)), 
                     stringsAsFactors = FALSE)
res <- cbind(rownames(res), res)
rownames(res) <- NULL
names(res) <- c("term", "estimate", "se", "t", "p")
res$term <- as.character(res$term)

kable(res)

## ---- echo = FALSE-------------------------------------------------------
res$term[-1] <- get_label(mtcars, vars = res$term[-1])
kable(res)

## ------------------------------------------------------------------------
library(labelVector)
x <- 1:10
x <- set_label(x, "some integers")

x

## ------------------------------------------------------------------------
get_label(x)

## ------------------------------------------------------------------------
y <- letters

attr(y, "label") # y has no label attribute

get_label(y)

## ------------------------------------------------------------------------
get_label(mtcars$am)

## ------------------------------------------------------------------------
mtcars2 <- 
  set_label(mtcars,
            am = "Automatic",
            mpg = "Miles per gallon",
            cyl = "Cylinders",
            qsec = "Quarter mile time")

## ------------------------------------------------------------------------
get_label(mtcars2)

## ------------------------------------------------------------------------
get_label(mtcars2, vars = c("am", "mpg", "cyl", "qsec"))

## ------------------------------------------------------------------------
library(Hmisc)

var_with_Hmisc_label <- 1:10
label(var_with_Hmisc_label) <- "This label created with Hmisc"

label(var_with_Hmisc_label)
get_label(var_with_Hmisc_label)

var_with_Hmisc_label

## ------------------------------------------------------------------------
var_with_labelVector_label <- 1:10
var_with_labelVector_label <- 
  set_label(var_with_labelVector_label, "This label created with labelVector")

get_label(var_with_labelVector_label)
label(var_with_labelVector_label)

## ------------------------------------------------------------------------
library(labelVector)

mtcars <- 
  set_label(mtcars,
            qsec = "Quarter mile time",
            am = "Automatic / Manual",
            wt = "Vehicle weight")

fit <- lm(mpg ~ qsec + am + wt, 
          data = mtcars)

# Create a summary table
res <- as.data.frame(coef(summary(fit)), 
                     stringsAsFactors = FALSE)
res <- cbind(rownames(res), res)
rownames(res) <- NULL
names(res) <- c("term", "estimate", "se", "t", "p")
res$term <- as.character(res$term)



res$term[-1] <- get_label(mtcars, vars = res$term[-1])
kable(res)


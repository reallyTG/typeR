## ----setup1, echo=FALSE, message=FALSE-----------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE, echo = FALSE)
library(dplyr)
library(readr)
library(purrr)
library(tidyr)
library(stringr)
library(ggplot2)
library(dynutils)
set.seed(1)

## ----echo=FALSE, results='asis'------------------------------------------
lines <- read_lines("functionality.Rmd")
headings <- c(which(grepl("^## ", lines)), length(lines))
subheadings <- which(grepl("^### .*`", lines))

strs <- map_chr(seq_len(length(headings) - 1), function(i) {
  head <- lines[[headings[[i]]]]
  subhead <- subheadings %>% keep(~ headings[[i]] < . & . < headings[[i+1]]) %>% lines[.]
  
  if (length(subhead) > 0) {
    fun_texts <- gsub("[^`]*(`[^`]*`).*", "\\1", subhead)
    fun_links <- subhead %>% 
      tolower() %>% 
      str_replace_all(" ", "-") %>%
      str_replace_all("[^a-z\\-_]", "") %>% 
      str_replace("^-*", "functionality.md#")
    
    paste0(
      gsub("## ", "* ", head), ": \n",
      paste0("  [", fun_texts, "](", fun_links, ")", collapse = ",\n", sep = ""),
      "\n"
    )
  } else {
    ""
  }
})
cat(strs, sep = "")

## ----add_class-----------------------------------------------------------
l <- list(important_number = 42) %>% add_class("my_list")
l

## ----extend_with---------------------------------------------------------
l %>% extend_with(
  .class_name = "improved_list", 
  url = "https://github.com/dynverse/dynverse"
)

## ----calculate_distance--------------------------------------------------
x <- matrix(runif(30), ncol = 10)
y <- matrix(runif(50), ncol = 10)
calculate_distance(x, y, method = "euclidean")

## ----dist----------------------------------------------------------------
as.matrix(dist(rbind(x, y)))[1:3, -1:-3]

## ----project_to_segments-------------------------------------------------
x <- matrix(rnorm(50, 0, .5), ncol = 2)
segfrom <- matrix(c(0, 1, 0, -1, 1, 0, -1, 0), ncol = 2, byrow = TRUE)
segto <- segfrom / 10
fit <- project_to_segments(x, segfrom, segto)

ggplot() +
  geom_segment(aes(x = x[,1], xend = fit$x_proj[,1], y = x[,2], yend = fit$x_proj[,2], colour = "projection"), linetype = "dashed") +
  geom_point(aes(x[,1], x[,2], colour = "point")) +
  geom_segment(aes(x = segfrom[,1], xend = segto[,1], y = segfrom[,2], yend = segto[,2], colour = "segment")) +
  scale_colour_brewer(palette = "Dark2") +
  scale_x_continuous(name = NULL, breaks = NULL) +
  scale_y_continuous(name = NULL, breaks = NULL) +
  labs(colour = "Object type") +
  theme_classic()

str(fit)

## ----expand_matrix-------------------------------------------------------
x <- matrix(runif(12), ncol = 4, dimnames = list(c("a", "c", "d"), c("D", "F", "H", "I")))
expand_matrix(x, letters[1:5], LETTERS[1:10], fill = 0)

## ----scale_uniform_gen---------------------------------------------------
x <- matrix(rnorm(200*2, sd = 10, mean = 5), ncol = 2)

## ----scale_uniform-------------------------------------------------------
x_scaled <- scale_uniform(x, center = 0, max_range = 1)

## ----scale_uniform_verify------------------------------------------------
ranges <- apply(x_scaled, 2, range)
ranges                   # should all lie between -.5 and .5
colMeans(ranges)         # should all be equal to 0
apply(ranges, 2, diff)   # max should be 1

## ----scale_minmax--------------------------------------------------------
x_scaled2 <- scale_minmax(x)

## ----scale_minmax_verify-------------------------------------------------
apply(x_scaled2, 2, range)  # each column should be [0, 1]

## ----scale_quantile------------------------------------------------------
x_scaled3 <- scale_quantile(x, .05)

## ----scale_quantile_verify-----------------------------------------------
apply(x_scaled3, 2, range)   # each column should be [0, 1]
qplot(x_scaled2[,1], x_scaled3[,1]) + theme_bw()

## ----inherit_default_params----------------------------------------------
fun1 <- function(a = 10, b = 7) runif(a, -b, b)
fun2 <- function(c = 9) 2^c

fun3 <- inherit_default_params(
  super = list(fun1, fun2),
  fun = function(a, b, c) {
    list(x = fun1(a, b), y = fun2(c))
  }
)

fun3

## ----check_packages------------------------------------------------------
check_packages("SCORPIUS", "dynutils", "wubbalubbadubdub")
check_packages(c("princurve", "mlr", "tidyverse"))

## ----install_packages, eval = FALSE--------------------------------------
#  install_packages("SCORPIUS", package = "dynmethods", prompt = TRUE)

## ----pritt---------------------------------------------------------------
a <- 10
pritt("a: {a}")

comparison <- glue::glue("a: {a}")
comparison            # glue::glue prints differently than base R
class(comparison)     # glue::glue adds a class to the output

## ----random_time_string--------------------------------------------------
random_time_string("test")

random_time_string("test")

random_time_string("test")

## ----list_as_tibble------------------------------------------------------
li <- list(
  list(a = 1, b = log10, c = "parrot") %>% add_class("myobject"), 
  list(a = 2, b = sqrt, c = "quest") %>% add_class("yourobject")
)

tib <- list_as_tibble(li)

tib

## ----tibble_as_list------------------------------------------------------
li <- tibble_as_list(tib)

li

## ----extract_row_to_list-------------------------------------------------
extract_row_to_list(tib, 2)

## ----mapdf_function------------------------------------------------------
tib %>% mapdf(class)

## ----mapdf_anonfun-------------------------------------------------------
tib %>% mapdf(function(row) paste0(row$b(row$a), "_", row$c))

## ----mapdf_formula-------------------------------------------------------
tib %>% mapdf(~ .$b)

## ----mapdf_more----------------------------------------------------------
tib %>% mapdf_lgl(~ .$a > 1)
tib %>% mapdf_chr(~ paste0("~", .$c, "~"))
tib %>% mapdf_int(~ nchar(.$c))
tib %>% mapdf_dbl(~ .$a * 1.234)


## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(tangram)

## ----style, results='asis'-----------------------------------------------
cat(custom_css("lancet.css"))

## ------------------------------------------------------------------------
head(pbc)

## ---- results="asis"-----------------------------------------------------
html5(tangram("drug ~ bili[2] + albumin + stage::Categorical + protime + sex + age + spiders", tangram::pbc),
      fragment=TRUE, caption = "Hmisc::PBC", id="tbl2")

## ---- results='asis'-----------------------------------------------------
set.seed(1234)
x <- round(rnorm(375, 79, 10))
y <- round(rnorm(375, 80,  9))
y[rbinom(375, 1, prob=0.05)] <- NA
attr(x, "label") <- "Global score, 3m"
attr(y, "label") <- "Global score, 12m"
html5(tangram(1 ~ x+y,
                    data.frame(x=x, y=y),
                    after=hmisc_intercept_cleanup),
      fragment=TRUE, caption="Intercept", id="tbl5")


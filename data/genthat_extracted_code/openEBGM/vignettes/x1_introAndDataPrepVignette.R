## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----Load data-----------------------------------------------------------
library(openEBGM)
data(caers_raw)
head(caers_raw, 4)

## ----One adverse event per row-------------------------------------------
dat <- tidyr::separate_rows(caers_raw, SYM_One.Row.Coded.Symptoms, sep = ", ")
dat[1:4, c("RA_Report..", "PRI_Reported.Brand.Product.Name", 
           "SYM_One.Row.Coded.Symptoms")]

## ----Rename columns------------------------------------------------------
dat$id   <- dat$RA_Report..
dat$var1 <- dat$PRI_Reported.Brand.Product.Name
dat$var2 <- dat$SYM_One.Row.Coded.Symptoms

## ----Rename gender column------------------------------------------------
dat$strat_gender <- dat$CI_Gender
table(dat$strat_gender, useNA = "always")

## ----Categorize continuous variables-------------------------------------
dat$age_yrs <-
  ifelse(dat$CI_Age.Unit == "Day(s)", dat$CI_Age.at.Adverse.Event / 365,
  ifelse(dat$CI_Age.Unit == "Decade(s)", dat$CI_Age.at.Adverse.Event * 10,
  ifelse(dat$CI_Age.Unit == "Month(s)", dat$CI_Age.at.Adverse.Event / 12,
  ifelse(dat$CI_Age.Unit == "Week(s)", dat$CI_Age.at.Adverse.Event / 52,
  ifelse(dat$CI_Age.Unit == "Year(s)", dat$CI_Age.at.Adverse.Event,
         NA)))))
dat$strat_age <- ifelse(is.na(dat$age_yrs), "unknown",
                 ifelse(dat$age_yrs < 18, "under_18",
                        "18_plus"))
table(dat$strat_age, useNA = "always")

## ----Display prepared data-----------------------------------------------
vars <- c("id", "var1", "var2", "strat_gender", "strat_age")
dat[1:5, vars]


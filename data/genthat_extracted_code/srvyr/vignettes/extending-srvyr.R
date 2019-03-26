## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

if (!require(convey) | !require(vardpoor)) {
  knitr::opts_chunk$set(eval = FALSE)
  message("Missing convey and vardpoor packages. Install them to run vignette.")
}

## ------------------------------------------------------------------------
# S3 generic function
survey_gini <- function(
  x, na.rm = FALSE, vartype = c("se", "ci", "var", "cv"), .svy = current_svy(), ...
) {
  UseMethod("survey_gini", .svy)
}

## ------------------------------------------------------------------------
survey_gini.tbl_svy <- function(
  x, na.rm = FALSE, vartype = c("se", "ci", "var", "cv"), .svy = current_svy(), ...
) {
  if (missing(vartype)) vartype <- "se"
  vartype <- match.arg(vartype, several.ok = TRUE)
  .svy <- srvyr::set_survey_vars(.svy, x)
  
  out <- convey::svygini(~`__SRVYR_TEMP_VAR__`, na.rm = na.rm, design = .svy)
  out <- srvyr::get_var_est(out, vartype)
  out
}

## ------------------------------------------------------------------------
survey_gini.grouped_svy <- function(
  x, na.rm = FALSE, vartype = c("se", "ci", "var", "cv"), .svy = current_svy(), ...
) {
  if (missing(vartype)) vartype <- "se"
  vartype <- match.arg(vartype, several.ok = TRUE)
  .svy <- srvyr::set_survey_vars(.svy, x)
  grps_formula <- survey::make.formula(group_vars(.svy))
  
  out <- survey::svyby(
    ~`__SRVYR_TEMP_VAR__`, grps_formula, convey::svygini, na.rm = na.rm, design = .svy
  )
  out <- srvyr::get_var_est(out, vartype, grps = group_vars(.svy))
  out
}

## ------------------------------------------------------------------------
# Example from ?convey::svygini
suppressPackageStartupMessages({
  library(srvyr)
  library(survey)
  library(convey)
  library(vardpoor)
})
data(eusilc) ; names( eusilc ) <- tolower( names( eusilc ) )

# Setup for survey package
des_eusilc <- svydesign(
  ids = ~rb030, 
  strata = ~db040,  
  weights = ~rb050, 
  data = eusilc
)
des_eusilc <- convey_prep(des_eusilc)

# Setup for srvyr package
srvyr_eusilc <- eusilc %>% 
  as_survey(
    ids = rb030,
    strata = db040,
    weights = rb050
  ) %>%
  convey_prep()

## Ungrouped
# Calculate ungrouped for survey package
svygini(~eqincome, design = des_eusilc)

# With our new function
survey_gini(srvyr_eusilc$variables$eqincome, .svy = srvyr_eusilc)

# And finally, the more typical way through summarize
srvyr_eusilc %>% 
  summarize(eqincome = survey_gini(eqincome))

## Groups
# Calculate by groups for survey
survey::svyby(~eqincome, ~rb090, des_eusilc, convey::svygini)

# With our new function
survey_gini(srvyr_eusilc$variables$eqincome, .svy = group_by(srvyr_eusilc, rb090))

# And finally, the more typical way through summarize
srvyr_eusilc %>% 
  group_by(rb090) %>%
  summarize(eqincome = survey_gini(eqincome))



library(panelvar)


### Name: pvargmm
### Title: GMM Estimation of Panel VAR Models
### Aliases: pvargmm

### ** Examples

## Not run: 
##D library(panelvar)
##D data(abdata)
##D ex3_abdata <-pvargmm(
##D  dependent_vars = c("emp"),
##D  lags = 4,
##D  predet_vars = c("wage"),
##D  exog_vars = c("cap"),
##D  transformation = "fd",
##D  data = abdata,
##D  panel_identifier = c("id", "year"),
##D  steps = c("twostep"),
##D  system_instruments = TRUE,
##D  max_instr_dependent_vars = 99,
##D  max_instr_predet_vars = 99,
##D  min_instr_dependent_vars = 2L,
##D  min_instr_predet_vars = 1L,
##D  collapse = FALSE
##D )
## End(Not run)
data("ex3_abdata")
summary(ex3_abdata)

data("Dahlberg")
## Not run: 
##D ex1_dahlberg_data <- pvargmm(dependent_vars = c("expenditures", "revenues", "grants"),
##D                              lags = 1,
##D                              transformation = "fod",
##D                              data = Dahlberg,
##D                              panel_identifier=c("id", "year"),
##D                              steps = c("twostep"),
##D                              system_instruments = FALSE,
##D                              max_instr_dependent_vars = 99,
##D                              max_instr_predet_vars = 99,
##D                              min_instr_dependent_vars = 2L,
##D                              min_instr_predet_vars = 1L,
##D                              collapse = FALSE
##D )
## End(Not run)
data("ex1_dahlberg_data")
summary(ex1_dahlberg_data)




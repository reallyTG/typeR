library(gustave)


### Name: qvar
### Title: Quickly perform a variance estimation in common cases
### Aliases: qvar

### ** Examples

### Example from the Information and communication technologies (ICT) survey

# The (simulated) Information and communication technologies (ICT) survey 
# has the following characteristics: 
# - stratified one-stage sampling design
# - non-response correction through reweighting in homogeneous response groups
# - calibration on margins.

# The ict_survey data.frame is a (simulated) subset of the ICT 
# survey file containing the variables of interest for the 612
# responding firms.

# The ict_sample data.frame is the (simulated) sample of 650
# firms corresponding to the ict_survey file. It contains all
# technical information necessary to estimate a variance with
# the qvar() function.

## Methodological description of the survey

# Direct call of qvar()
qvar(

  # Sample file
  data = ict_sample,
  
  # Dissemination and identification information
  dissemination_dummy = "dissemination",
  dissemination_weight = "w_calib",
  id = "firm_id",
  
  # Scope
  scope_dummy = "scope",
  
  # Sampling design
  sampling_weight = "w_sample", 
  strata = "strata",
  
  # Non-response correction
  nrc_weight = "w_nrc", 
  response_dummy = "resp", 
  hrg = "hrg",
  
  # Calibration
  calibration_weight = "w_calib",
  calibration_var = c(paste0("N_", 58:63), paste0("turnover_", 58:63)),
  
  # Statistic(s) and variable(s) of interest
  mean(employees)
 
)

# Definition of a variance estimation wrapper
precision_ict <- qvar(

  # As before
  data = ict_sample,
  dissemination_dummy = "dissemination",
  dissemination_weight = "w_calib",
  id = "firm_id",
  scope_dummy = "scope",
  sampling_weight = "w_sample", 
  strata = "strata",
  nrc_weight = "w_nrc", 
  response_dummy = "resp", 
  hrg = "hrg",
  calibration_weight = "w_calib",
  calibration_var = c(paste0("N_", 58:63), paste0("turnover_", 58:63)),
  
  # Replacing the variables of interest by define = TRUE
  define = TRUE
  
)

# Use of the variance estimation wrapper
precision_ict(ict_sample, mean(employees))

# The variance estimation wrapper can also be used on the survey file
precision_ict(ict_survey, mean(speed_quanti))

## Features of the variance estimation wrapper

# Several statistics in one call (with optional labels)
precision_ict(ict_survey, 
  "Mean internet speed in Mbps" = mean(speed_quanti), 
  "Turnover per employee" = ratio(turnover, employees)
)

# Domain estimation with where and by arguments
precision_ict(ict_survey, 
  mean(speed_quanti), 
  where = employees >= 50
)
precision_ict(ict_survey, 
  mean(speed_quanti), 
  by = division
)

# Domain may differ from one estimator to another
precision_ict(ict_survey, 
  "Mean turnover, firms with 50 employees or more" = mean(turnover, where = employees >= 50),
  "Mean turnover, firms with 100 employees or more" = mean(turnover, where = employees >= 100)
)

# On-the-fly evaluation (e.g. discretization)
precision_ict(ict_survey, mean(speed_quanti > 100))

# Automatic discretization for qualitative (character or factor) variables
precision_ict(ict_survey, mean(speed_quali))

# Standard evaluation capabilities
variables_of_interest <- c("speed_quanti", "speed_quali")
precision_ict(ict_survey, mean(variables_of_interest))

# Integration with %>% and dplyr
library(magrittr)
library(dplyr)
ict_survey %>% 
  precision_ict("Internet speed above 100 Mbps" = mean(speed_quanti > 100)) %>% 
  select(label, est, lower, upper)





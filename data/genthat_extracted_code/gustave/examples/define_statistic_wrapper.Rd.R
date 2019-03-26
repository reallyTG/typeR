library(gustave)


### Name: define_statistic_wrapper
### Title: Define a statistic wrapper
### Aliases: define_statistic_wrapper

### ** Examples

### Example from the Information and communication technologies (ICT) survey

# Let's define a variance wrapper asfor the ICT survey 
# as in the examples of the qvar function: 
precision_ict <- qvar(
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
  define = TRUE
)
precision_ict(ict_survey, mean(speed_quanti))

# Let's now redefine the mean statistic wrapper
mean2 <- define_statistic_wrapper(
  statistic_function = function(y, weight){
    point <- sum(y * weight) / sum(weight)
    lin <- (y - point) / sum(weight)
    list(point = point, lin = lin, metadata = list(n = length(y)))
  },
  arg_type = list(data = "y", weight = "weight")
)

# mean2 can now be used inside precision_ict (and yields
# the same results as the mean statistic wrapper)
precision_ict(ict_survey, mean(speed_quanti), mean2(speed_quanti))





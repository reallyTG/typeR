library(mkin)


### Name: synthetic_data_for_UBA_2014
### Title: Synthetic datasets for one parent compound with two metabolites
### Aliases: synthetic_data_for_UBA_2014
### Keywords: datasets

### ** Examples

## Not run: 
##D # The data have been generated using the following kinetic models
##D m_synth_SFO_lin <- mkinmod(parent = list(type = "SFO", to = "M1"),
##D                            M1 = list(type = "SFO", to = "M2"),
##D                            M2 = list(type = "SFO"), use_of_ff = "max")
##D 
##D 
##D m_synth_SFO_par <- mkinmod(parent = list(type = "SFO", to = c("M1", "M2"),
##D                                          sink = FALSE),
##D                            M1 = list(type = "SFO"),
##D                            M2 = list(type = "SFO"), use_of_ff = "max")
##D 
##D m_synth_DFOP_lin <- mkinmod(parent = list(type = "DFOP", to = "M1"),
##D                             M1 = list(type = "SFO", to = "M2"),
##D                             M2 = list(type = "SFO"), use_of_ff = "max")
##D 
##D m_synth_DFOP_par <- mkinmod(parent = list(type = "DFOP", to = c("M1", "M2"),
##D                                           sink = FALSE),
##D                             M1 = list(type = "SFO"),
##D                             M2 = list(type = "SFO"), use_of_ff = "max")
##D 
##D # The model predictions without intentional error were generated as follows
##D sampling_times = c(0, 1, 3, 7, 14, 28, 60, 90, 120)
##D 
##D d_synth_SFO_lin <- mkinpredict(m_synth_SFO_lin,
##D                                c(k_parent = 0.7, f_parent_to_M1 = 0.8,
##D                                  k_M1 = 0.3, f_M1_to_M2 = 0.7,
##D                                  k_M2 = 0.02),
##D                                c(parent = 100, M1 = 0, M2 = 0),
##D                                sampling_times)
##D 
##D d_synth_DFOP_lin <- mkinpredict(m_synth_DFOP_lin,
##D                                 c(k1 = 0.2, k2 = 0.02, g = 0.5,
##D                                   f_parent_to_M1 = 0.5, k_M1 = 0.3,
##D                                   f_M1_to_M2 = 0.7, k_M2 = 0.02),
##D                                  c(parent = 100, M1 = 0, M2 = 0),
##D                                  sampling_times)
##D 
##D d_synth_SFO_par <- mkinpredict(m_synth_SFO_par,
##D                                c(k_parent = 0.2,
##D                                  f_parent_to_M1 = 0.8, k_M1 = 0.01,
##D                                  f_parent_to_M2 = 0.2, k_M2 = 0.02),
##D                                  c(parent = 100, M1 = 0, M2 = 0),
##D                                  sampling_times)
##D 
##D d_synth_DFOP_par <- mkinpredict(m_synth_DFOP_par,
##D                                c(k1 = 0.3, k2 = 0.02, g = 0.7,
##D                                  f_parent_to_M1 = 0.6, k_M1 = 0.04,
##D                                  f_parent_to_M2 = 0.4, k_M2 = 0.01),
##D                                  c(parent = 100, M1 = 0, M2 = 0),
##D                                  sampling_times)
##D 
##D # Construct names for datasets with errors
##D d_synth_names = paste0("d_synth_", c("SFO_lin", "SFO_par",
##D                                      "DFOP_lin", "DFOP_par"))
##D 
##D # Function for adding errors. The add_err function now published with this
##D # package is a slightly generalised version where the names of secondary
##D # compartments that should have an initial value of zero (M1 and M2 in this
##D # case) are not hardcoded any more.
##D add_err = function(d, sdfunc, LOD = 0.1, reps = 2, seed = 123456789)
##D {
##D   set.seed(seed)
##D   d_long = mkin_wide_to_long(d, time = "time")
##D   d_rep = data.frame(lapply(d_long, rep, each = 2))
##D   d_rep$value = rnorm(length(d_rep$value), d_rep$value, sdfunc(d_rep$value))
##D 
##D   d_rep[d_rep$time == 0 & d_rep$name ##D 
##D   d_NA <- transform(d_rep, value = ifelse(value < LOD, NA, value))
##D   d_NA$value <- round(d_NA$value, 1)
##D   return(d_NA)
##D }
##D 
##D # The following is the two-component model of Rocke and Lorenzato (1995)
##D sdfunc_twocomp = function(value, sd_low, rsd_high) {
##D   sqrt(sd_low^2 + value^2 * rsd_high^2)
##D }
##D 
##D # Add the errors.
##D for (d_synth_name in d_synth_names)
##D {
##D   d_synth = get(d_synth_name)
##D   assign(paste0(d_synth_name, "_a"), add_err(d_synth, function(value) 3))
##D   assign(paste0(d_synth_name, "_b"), add_err(d_synth, function(value) 7))
##D   assign(paste0(d_synth_name, "_c"), add_err(d_synth,
##D                            function(value) sdfunc_twocomp(value, 0.5, 0.07)))
##D 
##D }
##D 
##D d_synth_err_names = c(
##D   paste(rep(d_synth_names, each = 3), letters[1:3], sep = "_")
##D )
##D 
##D # This is just one example of an evaluation using the kinetic model used for
##D # the generation of the data
##D fit <- mkinfit(m_synth_SFO_lin, synthetic_data_for_UBA_2014[[1]]$data,
##D                quiet = TRUE)
##D plot_sep(fit)
##D summary(fit)
## End(Not run)




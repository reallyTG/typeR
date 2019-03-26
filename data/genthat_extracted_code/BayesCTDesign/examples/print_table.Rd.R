library(BayesCTDesign)


### Name: print_table
### Title: Print Data from Two Arm Bayesian Clinical Trial Simulation.
### Aliases: print_table

### ** Examples

#Run a Weibull simulation, using simple_sim().
#For meaningful results, trial_reps needs to be much larger than 2.
weibull_test <- simple_sim(trial_reps = 2, outcome_type = "weibull",
                           subj_per_arm = c(50, 100, 150, 200),
                           effect_vals = c(0.6, 1, 1.4),
                           control_parms = c(2.82487,3),
                           time_vec = NULL, censor_value = NULL,
                           alpha = 0.05, get_var = TRUE,
                           get_bias = TRUE, get_mse = TRUE,
                           seedval=123, quietly=TRUE)

#Tabulate the simulation results for power.
test_table <- print_table(bayes_ctd_array=weibull_test, measure="power",
                          tab_type=NULL, subj_per_arm_val=NULL, a0_val=NULL,
                          effect_val=NULL, rand_control_diff_val=NULL)
print(test_table)

#Tabulate the simulation results for estimates.
print_table(bayes_ctd_array=weibull_test, measure="est")

#Tabulate the simulation results for variance.
print_table(bayes_ctd_array=weibull_test, measure="var")

#Tabulate the simulation results for bias.
print_table(bayes_ctd_array=weibull_test, measure="bias")

#Tabulate the simulation results for mse.
print_table(bayes_ctd_array=weibull_test, measure="mse")

## No test: 
#Run another weibull simulation, using historic_sim().
#Note: historic_sim() can take a while to run.
#Generate a sample of historical data for use in example.
set.seed(2250)
SampleHistData <- genweibulldata(sample_size=60, scale1=2.82487,
                                 hazard_ratio=0.6, common_shape=3,
                                 censor_value=3)
histdata <- subset(SampleHistData, subset=(treatment==0))
histdata$id <- histdata$id+10000

#For meaningful results, trial_reps needs to be larger than 100.
weibull_test2 <- historic_sim(trial_reps = 100, outcome_type = "weibull",
                              subj_per_arm = c(50, 100, 150, 200, 250),
                              a0_vals = c(0, 0.33, 0.67, 1),
                              effect_vals = c(0.6, 1, 1.4),
                              rand_control_diff = c(0.8, 1, 1.2),
                              hist_control_data = histdata, time_vec = NULL,
                              censor_value = 3, alpha = 0.05, get_var = TRUE,
                              get_bias = TRUE, get_mse = TRUE, seedval=123,
                              quietly=TRUE)

#Tabulate the simulation results for power.
test_table <- print_table(bayes_ctd_array=weibull_test2, measure="power",
                          tab_type="WX|YZ", effect_val=0.6,
                          rand_control_diff_val=1.0)
print(test_table)

#Tabulate the simulation results for estimates.
print_table(bayes_ctd_array=weibull_test2, measure="est", tab_type="WX|YZ",
            effect_val=0.6, rand_control_diff_val=1.0)

#Tabulate the simulation results for variance.
print_table(bayes_ctd_array=weibull_test2, measure="var", tab_type="WX|YZ",
            effect_val=0.6, rand_control_diff_val=1.0)

#Tabulate the simulation results for bias.
print_table(bayes_ctd_array=weibull_test2, measure="bias", tab_type="WX|YZ",
            effect_val=0.6, rand_control_diff_val=1.0)

#Tabulate the simulation results for mse.
print_table(bayes_ctd_array=weibull_test2, measure="mse", tab_type="WX|YZ",
            effect_val=0.6, rand_control_diff_val=1.0)
## End(No test)

## No test: 
#Run a Bernoulli simulation, using historic_sim().
#Generate a sample of historical Bernoulli data for use in example.
set.seed(2250)
samplehistdata <- genbernoullidata(sample_size=60, prob1=0.6, odds_ratio=0.6)
histdata <- subset(samplehistdata, subset=(treatment==0))
histdata$id <- histdata$id+10000

#For meaningful results, trial_reps needs to be larger than 100.
bernoulli_test <- historic_sim(trial_reps = 100, outcome_type = "bernoulli",
                              subj_per_arm = c(150),
                              a0_vals = c(1.0),
                              effect_vals = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0),
                              rand_control_diff = c(1.8),
                              hist_control_data = histdata, time_vec = NULL,
                              censor_value = 3, alpha = 0.05, get_var = TRUE,
                              get_bias = TRUE, get_mse = TRUE, seedval=123,
                              quietly=TRUE)
test_table <- print_table(bayes_ctd_array=bernoulli_test, measure="power",
                         tab_type=NULL, effect_val=NULL,
                         subj_per_arm_val=NULL)
print(test_table)

#If only one or two of the subj_per_arm, a0_vals, effect_vals, or
#rand_control_diff parameters have length greater than 1, then
#only bayes_ctd_array and measure parameters are needed.
#Tabulate the simulation results for estimates.
print_table(bayes_ctd_array=bernoulli_test, measure="est")

#Tabulate the simulation results for variance.
print_table(bayes_ctd_array=bernoulli_test, measure="var")

#Tabulate the simulation results for bias.
print_table(bayes_ctd_array=bernoulli_test, measure="bias")

#Tabulate the simulation results for mse.
print_table(bayes_ctd_array=bernoulli_test, measure="mse")
## End(No test)





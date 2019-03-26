library(BayesCTDesign)


### Name: historic_sim
### Title: Two Arm Bayesian Clinical Trial Simulation with Historical Data
### Aliases: historic_sim

### ** Examples

#Generate a sample of historical data for use in example.
set.seed(2250)
SampleHistData <- genweibulldata(sample_size=60, scale1=2.82487,
                                 hazard_ratio=0.6, common_shape=3,
                                 censor_value=3)
histdata <- subset(SampleHistData, subset=(treatment==0))
histdata$id <- histdata$id+10000

#Run a Weibull simulation, using historic_sim().
#For meaningful results, trial_reps needs to be much larger than 2.
weibull_test <- historic_sim(trial_reps = 2, outcome_type = "weibull",
                             subj_per_arm = c(50, 100, 150),
                             a0_vals = c(0, 0.50, 1),
                             effect_vals = c(0.6, 1),
                             rand_control_diff = c(0.8, 1),
                             hist_control_data = histdata, time_vec = NULL,
                             censor_value = 3, alpha = 0.05, get_var = TRUE,
                             get_bias = TRUE, get_mse = TRUE, seedval=123,
                             quietly=TRUE)

#Tabulate the simulation results for power.
test_table <- print_table(bayes_ctd_array=weibull_test, measure="power",
                          tab_type="WX|YZ", effect_val=0.6,
                          rand_control_diff_val=1.0)
print(test_table)

## No test: 
#Create a plot of the power simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="power", tab_type="WX|YZ",
           smooth=FALSE, plot_out=TRUE, effect_val=0.6,
           rand_control_diff_val=1.0)
#Create a plot of the estimated hazard ratio simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="est", tab_type="WX|YZ",
           smooth=FALSE, plot_out=TRUE, effect_val=0.6,
           rand_control_diff_val=1.0)
#Create a plot of the hazard ratio variance simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="var", tab_type="WX|YZ",
           smooth=FALSE, plot_out=TRUE, effect_val=0.6,
           rand_control_diff_val=1.0)
#Create a plot of the hazard ratio bias simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="bias", tab_type="WX|YZ",
           smooth=FALSE, plot_out=TRUE, effect_val=0.6,
           rand_control_diff_val=1.0)
#Create a plot of the hazard ratio mse simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="mse", tab_type="WX|YZ",
           smooth=FALSE, plot_out=TRUE, effect_val=0.6,
           rand_control_diff_val=1.0)

#Create other power plots using different values for tab_type
plot_table(bayes_ctd_array=weibull_test, measure="power", tab_type="XY|WZ",
           smooth=FALSE, plot_out=TRUE, subj_per_arm_val=150,
           rand_control_diff_val=1.0)

plot_table(bayes_ctd_array=weibull_test, measure="power", tab_type="XZ|WY",
           smooth=FALSE, plot_out=TRUE, subj_per_arm_val=150, effect_val=0.6)

plot_table(bayes_ctd_array=weibull_test, measure="power", tab_type="YZ|WX",
           smooth=FALSE, plot_out=TRUE, subj_per_arm_val=150, a0_val=0.5)

plot_table(bayes_ctd_array=weibull_test, measure="power", tab_type="WY|XZ",
           smooth=FALSE, plot_out=TRUE, rand_control_diff_val=1, a0_val=0.5)

plot_table(bayes_ctd_array=weibull_test, measure="power", tab_type="WZ|XY",
           smooth=FALSE, plot_out=TRUE, effect_val=0.6, a0_val=0.5)
## End(No test)

## No test: 
#Run Poisson simulation, using historic_sim(), but set two design characteristic
# parameters to only 1 value.
#Note: historic_sim() can take a while to run.
#Generate a sample of historical poisson data for use in example.
set.seed(2250)
samplehistdata <- genpoissondata(sample_size=60, mu1=1, mean_ratio=1.0)
histdata <- subset(samplehistdata, subset=(treatment==0))
histdata$id <- histdata$id+10000

#For meaningful results, trial_reps needs to be larger than 100.
poisson_test <- historic_sim(trial_reps = 100, outcome_type = "poisson",
                              subj_per_arm = c(50, 75, 100, 125, 150, 175, 200, 225, 250),
                              a0_vals = c(1),
                              effect_vals = c(0.6),
                              rand_control_diff = c(0.6, 1, 1.6),
                              hist_control_data = histdata, time_vec = NULL,
                              censor_value = 3, alpha = 0.05, get_var = TRUE,
                              get_bias = TRUE, get_mse = TRUE, seedval=123,
                              quietly=TRUE)

#Tabulate the simulation results for power.
test_table <- print_table(bayes_ctd_array=poisson_test, measure="power",
                          tab_type=NULL)
print(test_table)

#Create a plot of the power simulation results.
plot_table(bayes_ctd_array=poisson_test, measure="power", tab_type=NULL,
           smooth=FALSE, plot_out=TRUE)
## End(No test)

## No test: 
#At least one of subj_per_arm, a0_vals, effect_vals, or rand_control_diff
#must contain at least 2 values.
#Generate a sample of historical lognormal data for use in example.
set.seed(2250)
samplehistdata <- genlognormaldata(sample_size=60, mu1=1.06, mean_ratio=0.6, common_sd=1.25,
                                   censor_value=3)
histdata <- subset(samplehistdata, subset=(treatment==0))
histdata$id <- histdata$id+10000

#Run a Lognormal simulation, using historic_sim().
#For meaningful results, trial_reps needs to be larger than 100.
lognormal_test <- historic_sim(trial_reps = 100, outcome_type = "lognormal",
                               subj_per_arm = c(25,50,75,100,125,150,175,200,225,250),
                               a0_vals = c(1.0),
                               effect_vals = c(0.6),
                               rand_control_diff = c(1.8),
                               hist_control_data = histdata, time_vec = NULL,
                               censor_value = 3, alpha = 0.05, get_var = TRUE,
                               get_bias = TRUE, get_mse = TRUE, seedval=123,
                               quietly=TRUE)

test_table <- print_table(bayes_ctd_array=lognormal_test, measure="power",
                          tab_type=NULL)
print(test_table)
#Create a plot of the power simulation results.
plot_table(bayes_ctd_array=lognormal_test, measure="power", tab_type=NULL,
           smooth=TRUE, plot_out=TRUE)
## End(No test)





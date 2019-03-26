library(BayesCTDesign)


### Name: plot_table.bayes_ctd_array
### Title: Plot Data from Two Arm Bayesian Clinical Trial Simulation.
### Aliases: plot_table.bayes_ctd_array

### ** Examples

#Run a Weibull simulation, using simple_sim().
#For meaningful results, trial_reps needs to be much larger than 2.
weibull_test <- simple_sim(trial_reps = 2, outcome_type = "weibull",
                           subj_per_arm = c(50, 100, 150, 200),
                           effect_vals = c(0.6, 1),
                           control_parms = c(2.82487,3), time_vec = NULL,
                           censor_value = NULL, alpha = 0.05,
                           get_var = TRUE, get_bias = TRUE, get_mse = TRUE,
                           seedval=123, quietly=TRUE)

#Tabulate the simulation results for power.
test_table <- print_table(bayes_ctd_array=weibull_test, measure="power",
                          tab_type=NULL, subj_per_arm_val=NULL, a0_val=NULL,
                          effect_val=NULL, rand_control_diff_val=NULL)
print(test_table)

#Create a plot of the power simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="power", tab_type=NULL,
           smooth=FALSE, plot_out=TRUE, subj_per_arm_val=NULL, a0_val=NULL,
           effect_val=NULL, rand_control_diff_val=NULL)
#Create a plot of the hazard ratio simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="est", tab_type=NULL,
           smooth=FALSE, plot_out=TRUE, subj_per_arm_val=NULL, a0_val=NULL,
           effect_val=NULL, rand_control_diff_val=NULL)
#Create a plot of the hazard ratio variance simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="var", tab_type=NULL,
           smooth=FALSE, plot_out=TRUE, subj_per_arm_val=NULL, a0_val=NULL,
           effect_val=NULL, rand_control_diff_val=NULL)
#Create a plot of the hazard ratio bias simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="bias", tab_type=NULL,
           smooth=FALSE, plot_out=TRUE, subj_per_arm_val=NULL, a0_val=NULL,
           effect_val=NULL, rand_control_diff_val=NULL)
#Create a plot of the hazard ratio mse simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="mse", tab_type=NULL,
           smooth=FALSE, plot_out=TRUE, subj_per_arm_val=NULL, a0_val=NULL,
           effect_val=NULL, rand_control_diff_val=NULL)

## No test: 
#Run a second Weibull simulation, using simple_sim() and smooth the plot.
#For meaningful results, trial_reps needs to be larger than 100.
weibull_test2 <- simple_sim(trial_reps = 100, outcome_type = "weibull",
                            subj_per_arm = c(50, 75, 100, 125, 150, 175, 200, 225, 250),
                            effect_vals = c(0.6, 1, 1.4),
                            control_parms = c(2.82487,3), time_vec = NULL,
                            censor_value = NULL, alpha = 0.05, get_var = TRUE,
                            get_bias = TRUE, get_mse = TRUE, seedval=123,
                            quietly=TRUE)

#Tabulate the simulation results for power.
test_table <- print_table(bayes_ctd_array=weibull_test2, measure="power",
                          tab_type=NULL, subj_per_arm_val=NULL, a0_val=NULL,
                          effect_val=NULL, rand_control_diff_val=NULL)
print(test_table)

#Create a plot of the power simulation results.
plot_table(bayes_ctd_array=weibull_test2, measure="power", tab_type=NULL,
           smooth=TRUE, plot_out=TRUE, subj_per_arm_val=NULL, a0_val=NULL,
           effect_val=NULL, rand_control_diff_val=NULL, span=c(1,1,1))
## End(No test)

## No test: 
#Run a third weibull simulation, using historic_sim().
#Note: historic_sim() can take a while to run.
#Generate a sample of historical data for use in example.
set.seed(2250)
SampleHistData <- genweibulldata(sample_size=60, scale1=2.82487,
                                 hazard_ratio=0.6, common_shape=3,
                                 censor_value=3)
histdata <- subset(SampleHistData, subset=(treatment==0))
histdata$id <- histdata$id+10000

#For meaningful results, trial_reps needs to be larger than 100.
weibull_test3 <- historic_sim(trial_reps = 100, outcome_type = "weibull",
                              subj_per_arm = c(50, 100, 150, 200, 250),
                              a0_vals = c(0, 0.33, 0.67, 1),
                              effect_vals = c(0.6, 1, 1.4),
                              rand_control_diff = c(0.8, 1, 1.2),
                              hist_control_data = histdata, time_vec = NULL,
                              censor_value = 3, alpha = 0.05, get_var = TRUE,
                              get_bias = TRUE, get_mse = TRUE, seedval=123,
                              quietly=TRUE)

#Tabulate the simulation results for power.
test_table <- print_table(bayes_ctd_array=weibull_test3, measure="power",
                          tab_type="WX|YZ", effect_val=0.6,
                          rand_control_diff_val=1.0)
print(test_table)

#Create a plot of the power simulation results.
plot_table(bayes_ctd_array=weibull_test3, measure="power", tab_type="WX|YZ",
           smooth=FALSE, plot_out=TRUE, effect_val=0.6,
           rand_control_diff_val=1.0)
## End(No test)

## No test: 
#Run a Gaussian simulation, using historic_sim()
#Generate a sample of historical Gaussian data for use in example.
set.seed(2250)
samplehistdata <- gengaussiandata(sample_size=60, mu1=25, mean_diff=0, common_sd=3)
histdata <- subset(samplehistdata, subset=(treatment==0))
histdata$id <- histdata$id+10000

#For meaningful results, trial_reps needs to be larger than 100.
gaussian_test <- historic_sim(trial_reps = 100, outcome_type = "gaussian",
                             subj_per_arm = c(150),
                             a0_vals = c(1.0),
                             effect_vals = c(0.15),
                             rand_control_diff = c(-4.0,-3.5,-3.0,-2.5,-2.0,
                                                   -1.5,-1.0,-0.5,0,0.5,1.0),
                             hist_control_data = histdata, time_vec = NULL,
                             censor_value = 3, alpha = 0.05, get_var = TRUE,
                             get_bias = TRUE, get_mse = TRUE, seedval=123,
                             quietly=TRUE)
test_table <- print_table(bayes_ctd_array=gaussian_test, measure="power",
                         tab_type=NULL, effect_val=NULL,
                         subj_per_arm_val=NULL)
print(test_table)
#Create a plot of the power simulation results.
plot_table(bayes_ctd_array=gaussian_test, measure="power", tab_type=NULL,
          smooth=TRUE, plot_out=TRUE, effect_val=NULL,
          rand_control_diff_val=NULL)
## End(No test)

## No test: 
#Generate a sample of historical pwe data for use in example.
set.seed(2250)
nvalHC <- 60
time.vec <- c(0.3,0.9,1.5,2.1,2.4)
lambdaHC.vec <- c(0.19,0.35,0.56,0.47,0.38,0.34)
censor.value <- 3

SampleHistData <- genpwedata(nvalHC, lambdaHC.vec, 1.0, time.vec, censor.value)
histdata <- subset(SampleHistData, subset=(treatment==0))
histdata$indicator <- 2 #If set to 2, then historical controls will be collapsed with
#randomized controls, when time_vec is re-considered and
#potentially restructured.  If set to 1, then historical
#controls will be treated as a separated cohort when
#time_vec is being assessed for restructuring.
histdata$id <- histdata$id+10000

#Run a pwe simulation, using historic_sim().
#For meaningful results, trial_reps needs to be larger than 100.
pwe_test <- historic_sim(trial_reps = 100, outcome_type = "pwe",
                        subj_per_arm = c(25,50,75,100,125,150,175,200,225,250),
                        a0_vals = c(1.0),
                        effect_vals = c(0.6),
                        rand_control_diff = c(1.8),
                        hist_control_data = histdata, time_vec = time.vec,
                        censor_value = 3, alpha = 0.05, get_var = TRUE,
                        get_bias = TRUE, get_mse = TRUE, seedval=123,
                        quietly=TRUE)

test_table <- print_table(bayes_ctd_array=pwe_test, measure="power",
                         tab_type=NULL, effect_val=NULL,
                         subj_per_arm_val=NULL)
print(test_table)

#Create a plot of the power simulation results.
plot_table(bayes_ctd_array=pwe_test, measure="power", tab_type=NULL,
          smooth=TRUE, plot_out=TRUE, effect_val=NULL,
          rand_control_diff_val=NULL)
## End(No test)





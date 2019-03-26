## ---- eval = FALSE-------------------------------------------------------
#  # Load statnet which contains the ergm package and the faux.mesa.high network.
#  library(statnet)
#  
#  # Set seed for replication
#  set.seed(1)
#  
#  # Load faux.mea.high daa
#  data("faux.mesa.high")
#  
#  # Rename the object
#  mesa <- faux.mesa.high

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  # ERGM fit
#  ergm.fit <- ergm(mesa ~ edges +
#                     nodematch('Sex') +
#                     nodematch('Grade', diff = FALSE) +
#                     nodematch('Race', diff = FALSE) +
#                     gwesp(decay = 0.2, fixed = TRUE) +
#                     altkstar(lambda = 0.6, fixed = TRUE))
#  
#  # FERGM fit
#  library(fergm)
#  form <- c("edges + nodematch('Sex') + nodematch('Grade', diff = FALSE) +
#          nodematch('Race', diff = FALSE) + gwesp(decay = 0.2, fixed = TRUE) +
#          altkstar(lambda = 0.6, fixed = TRUE)")
#  
#  fergm.fit <- fergm(net = mesa, form = form, chains = 1)
#  

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  # Conventional rstan approach to extracting posterior summary
#  stan.smry <- summary(fergm.fit$stan.fit)$summary
#  beta_df <- stan.smry[grep("beta", rownames(stan.smry)),]
#  est <- round(beta_df[,c(1,4,8)], 3)
#  est # in order of "form"
#  
#  # fergm built-in function to summarize posteior
#  est <- clean_summary(fergm.fit)
#  est <- clean_summary(fergm.fit,
#                       custom_var_names = c("Edges", "Sex Homophily",
#                                            "GradeHomophily", "Race Homophily",
#                                            "GWESP", "Alternating K-Stars"))
#  est
#  # Compare substantive implications via coef plot, these are with 95% credible intervals
#  coef_plot(fergm.fit = fergm.fit)
#  
#  coef_plot(fergm.fit = fergm.fit,
#            custom_var_names =  c("Edges", "Sex Homophily", "Grade Homophily",
#                                  "Race Homophily", "GWESP", "Alternating K-Stars"))
#  coef_plot(fergm.fit = fergm.fit,
#            ergm.fit = ergm.fit,
#            custom_var_names =  c("Edges", "Sex Homophily", "Grade Homophily",
#                                  "Race Homophily", "GWESP", "Alternating K-Stars"))
#  
#  
#  # You can also look at the density of particular variables using the following:
#  
#  densities <- coef_posterior_density(fergm.fit = fergm.fit)
#  
#  densities <- coef_posterior_density(fergm.fit = fergm.fit,
#                                      custom_var_names = c("Edges", "Sex Homophily",
#                                                           "Grade Homophily", "Race Homophily",
#                                                           "GWESP", "Alternating K-Stars"))
#  densities[[1]]
#  densities[[2]]

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  # Use rstan functions to assess whether chains have evidence of converging
#  trace <- rstan::traceplot(fergm.fit$stan.fit, pars = "beta")
#  trace
#  
#  # We have our own version that includes variable names and tidies it up a bit
#  fergm_beta_traceplot(fergm.fit)
#  
#  fergm_beta_traceplot(fergm.fit,
#                       custom_var_names =  c("Edges", "Sex Homophily",
#                                             "Grade Homophily", "Race Homophily",
#                                             "GWESP", "Alternating K-Stars"))

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  # Use fergm built in compare_predictions function to compare predictions of ERGM and FERGM
#  net <- ergm.fit$network
#  predict_out <- compare_predictions(ergm.fit = ergm.fit, fergm.fit = fergm.fit, replications = 100)
#  
#  # Use the built in compare_predictions_plot function to examine the densities of correctly predicted
#    # ties from the compare_predictions simulations
#  compare_predictions_plot(predict_out)
#  
#  # We can also conduct a KS test to determine if the FERGM fit it statistically disginguishable
#    # from the ERGM fit
#  compare_predictions_test(predict_out)


## ----setup, include = FALSE,echo=F---------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = F
)

## ----libraries, message=F,warning=F--------------------------------------
#  library(dplyr)
#  library(ggplot2)
#  library(tidyr)
#  library(rstap)

## ----initialize_data-----------------------------------------------------
#  set.seed(1214)
#  num_subj <- 9.5E2
#  num_bef <- 55
#  sub_df <- data_frame(x = runif(n = num_subj, min = 1, max = 2.0),
#                       y = runif(n = num_subj, min = 1, max = 2.0),
#                       class = "Subject")
#  bef_df <- data_frame(x = runif(n = num_bef, min = 0, max = 3.0),
#                       y = runif(n = num_bef, min = 0, max = 3.0),
#                       class = "BEF")
#  rbind(sub_df,bef_df) %>% ggplot(aes(x = x, y = y, color = class )) +
#      geom_point() + theme_bw() + ggtitle("Independence Configuration")

## ----true_pars-----------------------------------------------------------
#  alpha <- 22.5
#  Z <- rbinom(n = num_subj, prob = .45, size = 1)
#  delta <- -.8
#  theta <- .5
#  theta_2 <- 3
#  beta <- 1.2
#  sigma <- 2.3

## ----dists_df_1----------------------------------------------------------
#  dists <- fields::rdist(as.matrix(sub_df[,1:2]),
#                         as.matrix(bef_df[,1:2]))
#  X <- apply(dists,1,function(x) sum(pracma::erfc(x/theta)))
#  y <- alpha + Z*delta + X*beta + rnorm(n = num_subj, mean = 0, sd = sigma)
#  data_frame(BMI = y) %>% ggplot(aes(x=BMI)) + geom_density() + theme_bw() +
#      ggtitle("Marginal Distribution of Outcome")

## ----exposure_1----------------------------------------------------------
#  d <- seq(from = 0, to = max(dists), by = 0.01)
#  X_theta_one <- pracma::erfc(d/theta)
#  par(mfrow = c(1,2))
#  plot(d,X_theta_one,type='l',main = "Exposure Decay Function", xlab = "Distance",
#       ylab = "Exposure")
#  hist(X, main = "Exposure Dist.")

## ----subject_data--------------------------------------------------------
#  subject_data <- data_frame(subj_id = 1:num_subj,
#                             y = y,
#                             sex = factor(Z,labels=c("M","F")))
#  subject_data %>% head() %>% knitr::kable()

## ----datasets------------------------------------------------------------
#  distance_data <- dists %>% as_data_frame() %>%
#      mutate(subj_id = 1:num_subj) %>%
#      gather(contains("V"),key = 'BEF',value = 'Distance') %>%
#      mutate(BEF = 'Fast_Food')
#  
#  distance_data %>% head() %>% knitr::kable()

## ----sampling_1, cache=T,results=F---------------------------------------
#  fit <- stap_glm(formula = y ~ sex + sap(Fast_Food),
#                  subject_data = subject_data,
#                  distance_data = distance_data,
#                  family = gaussian(link = 'identity'),
#                  subject_ID = 'subj_id',
#                  prior = normal(location = 0, scale = 5,autoscale = F),
#                  prior_intercept = normal(location = 25, scale = 5, autoscale = F),
#                  prior_stap = normal(location = 0, scale = 3, autoscale = F),
#                  prior_theta = log_normal(location = 1, scale = 1),
#                  prior_aux = cauchy(location = 0,scale = 5),
#                  max_distance = max(dists),
#                  chains = 4, iter = 2E3, cores = 4) ## include all data

## ------------------------------------------------------------------------
#  fit

## ------------------------------------------------------------------------
#  summary(fit, waic=T)

## ----results_1,echo=F----------------------------------------------------
#  fd_df <- cbind(posterior_interval(fit)[1:4,1],coef(fit),posterior_interval(fit)[1:4,2],
#        c(alpha,delta,beta,theta)) %>%
#      as_data_frame() %>% transmute(lower= V1,
#                                    mid = V2,
#                                    upper = V3,
#                                    Truth = V4,
#                                    model = "Full Data") %>%
#      mutate(parameter = c("alpha","sex","Fast_Food","Fast_Food_spatial_scale"),
#             is_alpha = (parameter=="alpha") )
#  fd_df %>%
#      ggplot(aes(x=parameter,y=mid)) + geom_point() +
#      geom_linerange(aes(ymin=lower,ymax=upper)) +
#      geom_hline(aes(yintercept = Truth),linetype = 2) + coord_flip() + theme_bw() +
#      facet_wrap(~is_alpha,scales = "free") +
#      theme( strip.background = element_blank(),
#             strip.text.x = element_blank()) +
#      xlab("") + ylab("Estimate")

## ----ppc-----------------------------------------------------------------
#  pps <- posterior_predict(fit,draws = 50,seed = 34234)
#  bayesplot::ppc_dens_overlay(y = subject_data$y,
#                              yrep = pps)

## ----dists_hist----------------------------------------------------------
#  hist(dists)

## ----sampling_2,cache=T--------------------------------------------------
#  fit_125 <- stap_glm(y ~ sex + sap(Fast_Food), subject_data = subject_data,
#                  distance_data = distance_data,
#                  family = gaussian(link = 'identity'),
#                  subject_ID = 'subj_id',
#                  prior = normal(location = 0,scale = 5,autoscale = F),
#                  prior_intercept = normal(location = 25, scale = 5, autoscale = F),
#                  prior_stap = normal(location = 0, scale = 3, autoscale = F),
#                  prior_theta = log_normal(location = 1, scale = 1),
#                  prior_aux = cauchy(location = 0,scale = 5),
#                  max_distance = 1.25, chains = 4, iter = 2E3, cores = 4)

## ----exlusion_data-------------------------------------------------------
#  sum(dists<=1.25)/sum(dists>=0)

## ----results_2,echo=F----------------------------------------------------
#  d125 <- cbind(posterior_interval(fit_125)[1:4,1],coef(fit_125),posterior_interval(fit_125)[1:4,2],
#        c(alpha,delta,beta,theta)) %>%
#      as_data_frame() %>% transmute(lower= V1,
#                                    mid = V2,
#                                    upper = V3,
#                                    Truth = V4,
#                                    model = "Non-Informative Exclusion") %>%
#      mutate(parameter = c("alpha","sex","Fast_Food","Fast_Food_spatial_scale"),
#             is_alpha = (parameter=="alpha") )
#  
#  d125 %>% rbind(.,fd_df) %>%
#      ggplot() +
#      geom_pointrange(aes(x = parameter, ymin=lower,y = mid, ymax=upper, color = model),
#                      position = position_dodge(width = .2)) +
#      geom_hline(aes(yintercept = Truth),linetype = 2) + coord_flip() + theme_bw() +
#      facet_wrap(~is_alpha,scales = "free") +
#      theme( strip.background = element_blank(),
#             strip.text.x = element_blank()) +
#      xlab("") + ylab("Estimate")

## ----sampling_3,cache=T--------------------------------------------------
#  fit_25 <- stap_glm(y ~ sex + sap(Fast_Food), subject_data = subject_data,
#                  distance_data = distance_data,
#                  family = gaussian(link = 'identity'),
#                  subject_ID = 'subj_id',
#                  prior = normal(location = 0,scale = 5,autoscale = F),
#                  prior_intercept = normal(location = 25, scale = 5, autoscale = F),
#                  prior_stap = normal(location = 0, scale = 3, autoscale = F),
#                  prior_theta = log_normal(location = 1, scale = 1),
#                  prior_aux = cauchy(location = 0,scale = 5),
#                  max_distance = .25, chains = 1, iter = 6E2)

## ----results_3,echo=F----------------------------------------------------
#  d25 <- cbind(posterior_interval(fit_25)[1:4,1],coef(fit_25),posterior_interval(fit_25)[1:4,2],
#        c(alpha,delta,beta,theta)) %>%
#      as_data_frame() %>% transmute(lower= V1,
#                                    mid = V2,
#                                    upper = V3,
#                                    Truth = V4,
#                                    model = "Informative_Exlusion") %>%
#      mutate(parameter = c("alpha","sex","Fast_Food","Fast_Food_spatial_scale"),
#             is_alpha = (parameter=="alpha") )
#  
#  d25 %>% rbind(.,fd_df) %>%
#      ggplot() +
#      geom_pointrange(aes(x = parameter, ymin=lower,y = mid, ymax=upper, color = model),
#                      position = position_dodge(width = .2)) +
#      geom_hline(aes(yintercept = Truth),linetype = 2) + coord_flip() + theme_bw() +
#      facet_wrap(~is_alpha,scales = "free") +
#      theme( strip.background = element_blank(),
#             strip.text.x = element_blank()) +
#      xlab("") + ylab("Estimate")

## ------------------------------------------------------------------------
#  d <- seq(from = 0, to = max(dists), by = 0.01)
#  X_theta_one <- pracma::erfc(d/theta_2)
#  plot(d,X_theta_one,type='l',main = "Exposure Decay Function", xlab = "Distance",
#       ylab = "Exposure",ylim = c(0,1))

## ------------------------------------------------------------------------
#  plot(d,X_theta_one,type='l',main = "Exposure Decay Function - reduced domain", xlab = "Distance",
#       ylab = "Exposure",ylim = c(0,1), xlim = c(0,.5))

## ------------------------------------------------------------------------
#  dists <- fields::rdist(as.matrix(sub_df[,1:2]),
#                         as.matrix(bef_df[,1:2]))
#  X <- apply(dists,1,function(x) sum(pracma::erfc(x/theta_2)))
#  ## center and scale the exposure effect for ease of exposition/numerical stability
#  X_tilde <- (X-mean(X))/sd(X)
#  y <- alpha + Z*delta + X_tilde*beta + rnorm(n = num_subj, mean = 0, sd = sigma)
#  
#  subject_data <- data_frame(subj_id = 1:num_subj,
#                             y = y,
#                             sex = factor(Z,labels=c("M","F")))
#  
#  fit_unif <- stap_glm(y ~ sex + sap(Fast_Food), subject_data = subject_data,
#                  distance_data = distance_data,
#                  family = gaussian(link = 'identity'),
#                  subject_ID = 'subj_id',
#                  prior = normal(location = 0,scale = 5,autoscale = F),
#                  prior_intercept = normal(location = 25, scale = 5, autoscale = F),
#                  prior_stap = normal(location = 0, scale = 3, autoscale = F),
#                  prior_theta = log_normal(location = 1, scale = 1),
#                  prior_aux = cauchy(location = 0,scale = 5),
#                  max_distance = .25, chains = 4, iter = 2E3,cores = 4)

## ----unif_scale_estimates, echo=F----------------------------------------
#  as.matrix(fit_unif) %>% as_data_frame() %>%
#      gather(everything(),key= "parameter",value = "sample") %>%
#      group_by(parameter) %>%
#      summarise(lower = quantile(sample,0.025),
#                med  = median(sample),
#                upper = quantile(sample, 0.975)) %>%
#      mutate(Truth = c(alpha,beta,theta_2,delta,sigma)) %>%
#      filter(parameter!="(Intercept)") %>%
#      ggplot() + geom_pointrange(aes(x=parameter,y=med,ymin=lower,ymax=upper)) +
#      geom_point(aes(x=parameter,y=Truth),color='red') +
#      coord_flip() + theme_bw()

## ----unif_scale_full_domain, echo =F-------------------------------------
#  scale_df <-  as.matrix(fit_unif) %>% as_data_frame() %>%
#      gather(everything(), key = "parameter", value = "sample") %>%
#      group_by(parameter) %>%
#      summarise(lower = quantile(sample,0.025),
#                med = median(sample),
#                upper = quantile(sample, 0.975)) %>%
#      filter(parameter=="Fast_Food_spatial_scale")
#  
#  data_frame(lower = pracma::erfc(d/scale_df$lower),
#             median = pracma::erfc(d/scale_df$med),
#             upper = pracma::erfc(d/scale_df$upper),
#             truth = X_theta_one,
#             distance = d) %>%
#      ggplot(aes(x=distance,y=median)) + geom_line(linetype = 2) +
#      geom_ribbon(aes(ymin=lower,ymax=upper),alpha=.3) +
#      geom_line(aes(x=distance,y=truth),color='red') +
#      theme_bw() + ggtitle("Extreme Missing Information")

## ----unif_scale_red_domain,echo=F----------------------------------------
#  data_frame(lower = pracma::erfc(d/scale_df$lower),
#             median = pracma::erfc(d/scale_df$med),
#             upper = pracma::erfc(d/scale_df$upper),
#             truth = X_theta_one,
#             distance = d) %>%
#      ggplot(aes(x=distance,y=median)) + geom_line(linetype = 2) +
#      geom_ribbon(aes(ymin=lower,ymax=upper),alpha=.3) +
#      geom_line(aes(x=distance,y=truth),color='red') + xlim(0,.5) +
#      theme_bw() + ggtitle("Extreme Missing Information")
#  

## ----extra_befs,echo=F---------------------------------------------------
#  extra_befs <- data_frame(x = c(runif(min = -1, max = 0, n = 20),
#                                 runif(min = 0, max = 4, n = 20),
#                                 runif(min = 3, max = 4, n = 20),
#                                 runif(min = -1, max = 4, n = 20)),
#                           y = c(runif(min = -1, max = 4, n = 20),
#                                 runif(min = -1, max = 0, n =20 ),
#                                 runif(min = -1, max = 4, n = 20),
#                                 runif(min = 3, max = 4, n = 20)),
#                           class = 'extra_BEFs')
#  rbind(sub_df,bef_df,extra_befs) %>% ggplot(aes(x=x,y=y,colour = class)) +
#      geom_point() + theme_bw() + ggtitle("Independence Configuration - Extra BEFs")

## ----sampling_4,cache=T--------------------------------------------------
#  dists <- fields::rdist(as.matrix(sub_df[,1:2]),
#                         as.matrix(rbind(bef_df[,1:2],extra_befs[,1:2])))
#  
#  distance_data <- dists %>% as_data_frame() %>%
#      mutate(subj_id = 1:num_subj) %>%
#      tidyr::gather(contains("V"),key = 'BEF',value = 'Distance') %>%
#      mutate(BEF = 'Fast_Food')
#  
#  
#  fit <- stap_glm(formula = y ~ sex + sap(Fast_Food),
#                  subject_data = subject_data,
#                  distance_data = distance_data,
#                  family = gaussian(link = 'identity'),
#                  subject_ID = 'subj_id',
#                  prior = normal(location = 0, scale = 5,autoscale = F),
#                  prior_intercept = normal(location = 25, scale = 5, autoscale = F),
#                  prior_stap = normal(location = 0, scale = 3, autoscale = F),
#                  prior_theta = log_normal(location = 0, scale = 1),
#                  prior_aux = cauchy(location = 0,scale = 5),
#                  max_distance = max(dists), chains = 4, cores = 4, iter = 2E3)  ## including unneccessary data

## ----results_4,echo=F----------------------------------------------------
#  edf <- cbind(posterior_interval(fit)[1:4,1],coef(fit),posterior_interval(fit)[1:4,2],
#        c(alpha,delta,beta,theta)) %>%
#      as_data_frame() %>% transmute(lower= V1,
#                                    mid = V2,
#                                    upper = V3,
#                                    Truth = V4,
#                                    model = "Extra data") %>%
#      mutate(parameter = c("alpha","sex","Fast_Food","Fast_Food_spatial_scale"),
#             is_alpha = (parameter=="alpha") )
#  
#  edf %>% rbind(.,fd_df) %>%
#      ggplot() +
#      geom_pointrange(aes(x = parameter, ymin=lower,y = mid, ymax=upper, color = model),
#                      position = position_dodge(width = .2)) +
#      geom_hline(aes(yintercept = Truth),linetype = 2) + coord_flip() + theme_bw() +
#      facet_wrap(~is_alpha,scales = "free") +
#      theme( strip.background = element_blank(),
#             strip.text.x = element_blank()) +
#      xlab("") + ylab("Estimate")


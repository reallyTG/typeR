## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "sGMRFmix-images/",
  message = FALSE,
  fig.width = 5,
  fig.height = 4
)
library(ggplot2)
theme_set(theme_bw())
library(ModelMetrics)

## ------------------------------------------------------------------------
library(sGMRFmix)
set.seed(314)
train_data <- generate_train_data()
plot_multivariate_data(train_data)

## ------------------------------------------------------------------------
test_data <- generate_test_data()
plot_multivariate_data(test_data)

## ------------------------------------------------------------------------
fit <- sGMRFmix(train_data, K = 7, rho = 0.8, verbose = FALSE)
anomaly_score <- compute_anomaly_score(fit, test_data)
plot_multivariate_data(anomaly_score, fix_scale = TRUE) + ylim(NA, 50)

## ------------------------------------------------------------------------
set.seed(314)
train_data <- generate_train_data()
head(train_data)
test_data <- generate_test_data()
head(test_data)
test_labels <- generate_test_labels()
head(test_labels)

## ------------------------------------------------------------------------
plot_multivariate_data(train_data)

## ------------------------------------------------------------------------
plot_multivariate_data(test_data, label = test_labels)

## ----echo=FALSE----------------------------------------------------------
fit

## ------------------------------------------------------------------------
n_split <- 5
split_block <- sample(n_split, size = nrow(test_data), replace = TRUE)
split_test_data <- split(test_data, split_block)
split_test_labels <- split(test_labels, split_block)

rho_candidates <- 10^seq(-1, 1, length.out = 10)

library(ModelMetrics)

df <- data.frame()
for (rho in rho_candidates) {
  fit <- sGMRFmix(train_data, K = 7, rho = rho, verbose = FALSE)
  auc <- double(n_split)
  for (i in seq_len(n_split)) {
    anomaly_score <- compute_anomaly_score(fit, split_test_data[[i]])
    auc[i] <- auc(unlist(split_test_labels[[i]]), unlist(anomaly_score))
  }
  df <- rbind(df, data.frame(rho = rho, auc = auc))
}

## ------------------------------------------------------------------------
library(ggplot2)
ggplot(df, aes(rho, auc)) + geom_point() +
  stat_summary(fun.y = mean, geom = "line", color = "red") + scale_x_log10()

## ------------------------------------------------------------------------
library(dplyr)
df %>% group_by(rho) %>% summarise(mean_auc = mean(auc)) %>% 
  mutate(max = ifelse(max(mean_auc) == mean_auc, "***", "."))

## ------------------------------------------------------------------------
optimal_rho <- 0.774
fit <- sGMRFmix(train_data, K = 7, rho = optimal_rho, verbose = FALSE)

threshold_candidates <- 10^seq(-1, 1, length.out = 100)
df <- data.frame()
for (i in seq_len(n_split)) {
  anomaly_score <- compute_anomaly_score(fit, split_test_data[[i]])
  f_measure <- double(length(threshold_candidates))
  for (j in seq_along(threshold_candidates)) {
    f1 <- f1Score(unlist(split_test_labels[[i]]), unlist(anomaly_score), 
                  cutoff = threshold_candidates[j])
    f_measure[j] <- f1
  }
  df <- rbind(df, data.frame(cutoff = threshold_candidates, f_measure = f_measure))
}

## ------------------------------------------------------------------------
ggplot(df, aes(cutoff, f_measure)) + geom_point() +
  stat_summary(fun.y = mean, geom = "line", color = "red") + scale_x_log10()

## ------------------------------------------------------------------------
df %>% group_by(cutoff) %>% 
  summarise(mean_f_measure = mean(f_measure)) %>% 
  filter(mean_f_measure == max(mean_f_measure))

## ------------------------------------------------------------------------
anomaly_scores <- compute_anomaly_score(fit, test_data)
is_anomaly <- anomaly_scores > 1.71
plot_multivariate_data(test_data, label = is_anomaly)

## ------------------------------------------------------------------------
window_size <- 20

df <- data.frame()
for (i in seq_len(n_split)) {
  anomaly_score <- compute_anomaly_score(fit, split_test_data[[i]], window_size)
  f_measure <- double(length(threshold_candidates))
  for (j in seq_along(threshold_candidates)) {
    f1 <- f1Score(unlist(split_test_labels[[i]]), unlist(anomaly_score), 
                  cutoff = threshold_candidates[j])
    f_measure[j] <- f1
  }
  df <- rbind(df, data.frame(cutoff = threshold_candidates, f_measure = f_measure))
}

## ------------------------------------------------------------------------
ggplot(df, aes(cutoff, f_measure)) + geom_point() +
  stat_summary(fun.y = mean, geom = "line", color = "red") + scale_x_log10()

## ------------------------------------------------------------------------
df %>% group_by(cutoff) %>% 
  summarise(mean_f_measure = mean(f_measure)) %>% 
  filter(mean_f_measure == max(mean_f_measure))

## ------------------------------------------------------------------------
anomaly_scores <- compute_anomaly_score(fit, test_data, window_size)
is_anomaly <- anomaly_scores > 2.60
plot_multivariate_data(test_data, label = is_anomaly)

## ------------------------------------------------------------------------
fit$Kest

## ------------------------------------------------------------------------
fit$pi

## ------------------------------------------------------------------------
head(fit$mode, 10)
plot_multivariate_data(train_data, label = fit$mode, guide_title = "Mode")

## ----out.width="45%", fig.show="hold"------------------------------------
inds_mode1 <- c(1:250, 501:750)
true_mode1_values <- train_data[inds_mode1, ]
estimated_mode1_values <- train_data[fit$mode == 1, ]

pairs(true_mode1_values, main="True Mode 1 Structure")
pairs(estimated_mode1_values, main="Estimated Mode 1 Structure")

## ----out.width="45%", fig.show="hold"------------------------------------
inds_mode2 <- c(251:500, 751:1000)
true_mode2_values <- train_data[inds_mode2, ]
estimated_mode2_values <- train_data[fit$mode == 2, ]

pairs(true_mode2_values, main="True Mode 2 Structure")
pairs(estimated_mode2_values, main="Estimated Mode 2 Structure")

## ----out.width="45%", fig.show="hold"------------------------------------
true_anomlay <- test_data[501:1000, ]
estimated_anomaly <- test_data[is_anomaly, ]

pairs(true_anomlay, main="True Anomaly Structure")
pairs(estimated_anomaly, main="Estimated Anomaly Structure")


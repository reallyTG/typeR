## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,
                      warning = FALSE,
                      message = FALSE)

## ----eval = FALSE--------------------------------------------------------
#  install.packages("cvequality")

## ------------------------------------------------------------------------
# read in the data, we obtained this from the HistData package
GaltonFamilies <- read.csv("GaltonFamilies.csv")

library(knitr)
kable(head(GaltonFamilies), caption = "Preview of first few rows of the GaltonFamilies data")

## ------------------------------------------------------------------------
library(ggplot2)
library(ggbeeswarm)
ggplot(GaltonFamilies, 
       aes(gender, 
           childHeight)) +
  geom_boxplot() +
  geom_quasirandom(alpha = 0.05) +
  theme_bw()

## ------------------------------------------------------------------------
# test for difference in CVs between boys and girls
library(cvequality)
child_height_by_gender_cv_test <- 
with(GaltonFamilies, 
     asymptotic_test(childHeight,
                     gender))

## ------------------------------------------------------------------------

child_height_by_gender_cv_test_MSLRT <- 
with(GaltonFamilies, 
     mslr_test(nr = 1e4, 
               childHeight,
               gender))

## ---- echo = FALSE-------------------------------------------------------
# make a table to display the results
child_test_summary <- 
  data.frame(`Test name` = c("asymptotic", 
                           "M-SLRT"),
             `Test statistic` = c(child_height_by_gender_cv_test$D_AD,
                                  child_height_by_gender_cv_test_MSLRT$MLRT),
             `p-value` = c(child_height_by_gender_cv_test$p_value,
                                  child_height_by_gender_cv_test_MSLRT$p_value),
             check.names = FALSE)

kable(child_test_summary, 
      caption =  "Summary of tests on the equality of CVs in child heights by gender")

## ------------------------------------------------------------------------
# read in the data, we obtained this from the archdata package
handaxes <- read.csv("Handaxes.csv")

# take a quick look
kable(head(handaxes), 
      caption = "Preview of first few rows of the handaxes data")

## ------------------------------------------------------------------------
library(dplyr)
library(tidyr)
handaxes_reshape <- 
  handaxes %>% 
  select(c(L, L1, B, B1, B2, T, T1)) %>% 
  gather(variable, value) %>% 
  na.omit

# take a quick look
kable(head(handaxes_reshape), 
      caption = "Preview of first few rows of the handaxes data")

## ------------------------------------------------------------------------
ggplot(handaxes_reshape, 
       aes(variable, 
           value)) +
  geom_boxplot() +
  geom_quasirandom(alpha = 0.02) +
  theme_bw()

## ------------------------------------------------------------------------
handaxes_asymptotic_test <- 
with(handaxes_reshape, 
     asymptotic_test(value, 
                     variable))

handaxes_mlrt_test <- 
with(handaxes_reshape, 
     mslr_test(nr = 1e4, 
               value, 
               variable))

## ---- echo = FALSE-------------------------------------------------------
# make a table to display the results
handaxe_test_summary <- 
  data.frame(`Test name` = c("asymptotic", 
                           "M-SLRT"),
             `Test statistic` = c(handaxes_asymptotic_test$D_AD,
                                  handaxes_mlrt_test$MLRT),
             `p-value` = c(handaxes_asymptotic_test$p_value,
                           handaxes_mlrt_test$p_value),
             check.names = FALSE)

kable(handaxe_test_summary, caption =  "Summary of tests on the equality of CVs in measurements of different variables of handaxe size")

## ------------------------------------------------------------------------
miller <- data.frame(test = c('ELISA', 'WEHI', '`Viral inhibition`'),
                     Mean = c(6.8, 8.5, 6.0),
                     CV =   c(0.090, 0.462, 0.340),
                     N =    c(5, 5, 5))

## ------------------------------------------------------------------------
# compute SD from mean and cv
miller$SD <- with(miller, CV * Mean)

## ------------------------------------------------------------------------
ggplot(miller,
       aes(test,
           Mean)) +
  # points to show mean values
  geom_point(size = 4) +
  # lines to show standard deviations
  geom_linerange(aes(ymin = Mean - SD,
                     ymax = Mean + SD)) +
  theme_bw()

## ------------------------------------------------------------------------
miller_asymptotic_test2 <- 
asymptotic_test2(k = nrow(miller), 
                 n = miller$N, 
                 s = miller$SD, 
                 x = miller$Mean)


## ------------------------------------------------------------------------
miller_mlrt_test2 <-
mslr_test2(nr = 1e4, 
           n = miller$N, 
           s = miller$SD, 
           x = miller$Mean)


## ------------------------------------------------------------------------
set.seed(42)
df <- data.frame(x = c(rnorm(20, 5, 2), 
                       rnorm(20, 5, 4)), 
                 y = c(rep(1, 20), 
                       rep(2, 20)))

## ------------------------------------------------------------------------
set.seed(42)
mslr_test(nr = 10000, x = df$x, y = df$y)

## ------------------------------------------------------------------------
set.seed(42)
mslr_test(nr = 10000, x = df$x, y = df$y)

## ------------------------------------------------------------------------
# repeat it n times to see how the results vary
n <- 10
reps <- replicate(n, {set.seed(42); mslr_test(nr = 10000, x = df$x, y = df$y)})

# take a look
stat <- unlist(reps[seq(1, length(reps), 2)])
pvals <- unlist(reps[seq(2, length(reps), 2)])

how_many_unique_values <- data.frame(unique_stat_values = length(unique(stat)),
                                     unique_p_values = length(unique(pvals)))
kable(how_many_unique_values)


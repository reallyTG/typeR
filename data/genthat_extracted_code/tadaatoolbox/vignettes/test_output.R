## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(tadaatoolbox)

## ----descriptives--------------------------------------------------------
tadaa_nom(ngo$geschl, ngo$abschalt, print = "markdown")

tadaa_ord(ngo$urteil, ngo$leistung, print = "markdown")

## ----aov_oneway----------------------------------------------------------
tadaa_aov(deutsch ~ jahrgang, data = ngo, type = 1, print = "markdown")
tadaa_aov(deutsch ~ jahrgang, data = ngo, type = 2, print = "markdown")
tadaa_aov(deutsch ~ jahrgang, data = ngo, type = 3, print = "markdown")

## ----aov_twoway----------------------------------------------------------
tadaa_aov(deutsch ~ jahrgang * geschl, data = ngo, type = 1, print = "markdown")
tadaa_aov(deutsch ~ jahrgang * geschl, data = ngo, type = 2, print = "markdown")
tadaa_aov(deutsch ~ jahrgang * geschl, data = ngo, type = 3, print = "markdown")

## ----aov_order-----------------------------------------------------------
set.seed(0)
data.frame(A = rnorm(100, mean = c(25, 30, 45)),
           G = c(rep("a", 50), rep("b", 50)),
           R = sample(letters[3:6], size = 100, TRUE),
           Z = sample(letters[7:8], size = 100, TRUE)) %>%
  tadaa_aov(data = ., formula = A ~ G * R * Z, type = 3, print = "markdown")

## ----kruskal-------------------------------------------------------------
tadaa_kruskal(stunzahl ~ jahrgang, data = ngo, print = "markdown")

## ----chisq---------------------------------------------------------------
tadaa_chisq(ngo, abschalt, geschl, print = "markdown")

## ----t_test--------------------------------------------------------------
tadaa_t.test(data = ngo, response = deutsch, group = geschl, print = "markdown")
tadaa_t.test(data = ngo, response = deutsch, group = geschl, paired = TRUE,
             print = "markdown")
tadaa_t.test(data = ngo, response = deutsch, group = geschl, var.equal = FALSE,
             print = "markdown")
tadaa_t.test(data = ngo, response = deutsch, group = geschl, 
             direction = "less", print = "markdown")
tadaa_t.test(data = ngo, response = deutsch, group = geschl, 
             direction = "greater", print = "markdown")

## ----wilcoxon------------------------------------------------------------
tadaa_wilcoxon(ngo, deutsch, geschl, print = "markdown")
tadaa_wilcoxon(ngo, deutsch, geschl, 
               direction = "less", print = "markdown")

tadaa_wilcoxon(ngo, deutsch, geschl, paired = TRUE, print = "markdown")
tadaa_wilcoxon(ngo, deutsch, geschl, paired = TRUE, 
               direction = "less", print = "markdown")


## ----one_sample_z--------------------------------------------------------
# z: known sigma
tadaa_one_sample(data = ngo, x = deutsch, mu = 7.5, sigma = 2, print = "markdown")
tadaa_one_sample(data = ngo, x = deutsch, mu = 8, sigma = 2, 
                 direction = "less", print = "markdown")
tadaa_one_sample(data = ngo, x = deutsch, mu = 7, sigma = 2, 
                 direction = "greater", print = "markdown")

## ----one_sample_t--------------------------------------------------------
tadaa_one_sample(data = ngo, x = deutsch, mu = 7.5, print = "markdown")
tadaa_one_sample(data = ngo, x = deutsch, mu = 8, 
                 direction = "less", print = "markdown")
tadaa_one_sample(data = ngo, x = deutsch, mu = 7, 
                 direction = "greater", print = "markdown")

## ----levene--------------------------------------------------------------
tadaa_levene(ngo, deutsch ~ jahrgang, print = "markdown")
tadaa_levene(ngo, deutsch ~ jahrgang, center = "mean", print = "markdown")
tadaa_levene(ngo, deutsch ~ jahrgang * geschl, print = "markdown")


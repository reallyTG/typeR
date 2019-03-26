## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(error = FALSE, message = FALSE, fig.align = 'center', fig.height = 3.5, fig.width = 3.5)

## ----install_CRAN, eval=FALSE--------------------------------------------
#  # install package CRAN
#  install.packages('pcr')

## ----install_github, eval=FALSE------------------------------------------
#  # install package from github
#  devtools::install_github('MahShaaban/pcr')

## ----load_pcr------------------------------------------------------------
# load required libraries
library(pcr)

## ----analyze-------------------------------------------------------------
# default mode delta_delta_ct
## locate and read raw ct data
fl <- system.file('extdata', 'ct1.csv', package = 'pcr')
ct1 <- readr::read_csv(fl)

## add grouping variable
group_var <- rep(c('brain', 'kidney'), each = 6)

# calculate all values and errors in one step
## mode == 'separate_tube' default
res <- pcr_analyze(ct1,
                   group_var = group_var,
                   reference_gene = 'GAPDH',
                   reference_group = 'brain')
  
res

## ----assess--------------------------------------------------------------
## locate and read data
fl <- system.file('extdata', 'ct3.csv', package = 'pcr')
ct3 <- readr::read_csv(fl)

## make a vector of RNA amounts
amount <- rep(c(1, .5, .2, .1, .05, .02, .01), each = 3)

## calculate amplification efficiency
res <- pcr_assess(ct3,
                  amount = amount,
                  reference_gene = 'GAPDH',
                  method = 'efficiency')
res

## ----load_libraries------------------------------------------------------
library(pcr)
library(ggplot2)
library(cowplot)

## ----calculate_efficiency------------------------------------------------
## locate and read data
fl <- system.file('extdata', 'ct3.csv', package = 'pcr')
ct3 <- readr::read_csv(fl)

## make a vector of RNA amounts
amount <- rep(c(1, .5, .2, .1, .05, .02, .01), each = 3)

## calculate amplification efficiency
res <- pcr_assess(ct3,
                  amount = amount,
                  reference_gene = 'GAPDH',
                  method = 'efficiency')
knitr::kable(res, caption = 'Figure 7: amplification efficiency of c-myc')

## ----plot_efficiency, fig.cap='Figure 1: Amplification efficiency of c-myc'----
gg <- pcr_assess(ct3,
           amount = amount,
           reference_gene = 'GAPDH',
           method = 'efficiency',
           plot = TRUE)
gg + 
  labs(x = 'log10 amount', y = 'Delta Ct') +
  theme(strip.background = element_blank(),
        strip.text = element_blank())

## ----calculating_curve---------------------------------------------------
## calculate standard curve
res <- pcr_assess(ct3,
                  amount = amount,
                  method = 'standard_curve')
knitr::kable(res, caption = 'Figure 8: Standard curves of c-myc and GAPDH')

## ----retain_variable-----------------------------------------------------
intercept <- res$intercept
slope <- res$slope

## ----plot_curves, fig.width=8, fig.cap='Figure 2: Standard curve of c-myc and GAPDH'----
gg <- pcr_assess(ct3,
           amount = amount,
           method = 'standard_curve',
           plot = TRUE)
gg + 
  labs(x = 'Log 10 amount', y = 'CT value')

## ----ddct_separate_tube--------------------------------------------------
# default mode delta_delta_ct
## locate and read raw ct data
fl <- system.file('extdata', 'ct1.csv', package = 'pcr')
ct1 <- readr::read_csv(fl)

## add grouping variable
group_var <- rep(c('brain', 'kidney'), each = 6)

# calculate all values and errors in one step
## mode == 'separate_tube' default
res1 <- pcr_analyze(ct1,
  group_var = group_var,
  reference_gene = 'GAPDH',
  reference_group = 'brain')

knitr::kable(res1, caption = 'Figure 9: Double delta $C_T$ method (separate tubes)')

## ----ddct_same_tube------------------------------------------------------
# calculate all values and errors in one step
## mode == 'same_tube'
res2 <- pcr_analyze(ct2,
  group_var = group_var,
  reference_gene = 'GAPDH',
  reference_group = 'brain',
  mode = 'same_tube')

knitr::kable(res2, caption = 'Figure 10: Double delta $C_T$ method (same tube)')

## ----plot_ddct_separate_tube---------------------------------------------
gg1 <- pcr_analyze(ct1,
  group_var = group_var,
  reference_gene = 'GAPDH',
  reference_group = 'brain',
  plot = TRUE) +
  labs(x = '', y = 'Relative mRNA expression') +
  ggtitle(label = 'Separate tubes')

## ----plote_ddct_same_tube------------------------------------------------
gg2 <- pcr_analyze(ct2,
  group_var = group_var,
  reference_gene = 'GAPDH',
  reference_group = 'brain',
  mode = 'same_tube',
  plot = TRUE) +
  labs(x = '', y = 'Relative mRNA expression') +
  ggtitle(label = 'Same tubes')

## ----plot_expression, fig.width=8, fig.cap='Figure 3: Relative expression of c-myc using double delta $C_T$'----
plot_grid(gg1, gg2)

## ----make_up_dataset-----------------------------------------------------
## example to check fold change of control gens
## locate and read file
fl <- system.file('extdata', 'ct1.csv', package = 'pcr')
ct1 <- readr::read_csv(fl)

## make a data.frame of two identical columns
pcr_hk <- data.frame(
  GAPDH1 = ct1$GAPDH,
  GAPDH2 = ct1$GAPDH
  )

## add grouping variable
group_var <- rep(c('brain', 'kidney'), each = 6)

## ----dct_method----------------------------------------------------------
# delta_ct method
## calculate caliberation
res <- pcr_analyze(pcr_hk,
            group_var = group_var,
            reference_group = 'brain',
            method = 'delta_ct')

knitr::kable(res, caption = 'Figure 11: Delta $C_T$ method')

## ----plot_dct_method, fig.cap='Figure 4: GAPDH relative fold change using delta $C_T$'----
pcr_analyze(pcr_hk,
            group_var = group_var,
            reference_group = 'brain',
            method = 'delta_ct', 
            plot = TRUE) +
  theme(legend.position = 'top',
        legend.direction = 'horizontal') +
  labs(x = '', y = 'Relative fold change')

## ----standard_separate_tube----------------------------------------------
## calculate standard amounts and error
res1 <- pcr_analyze(ct1,
                   group_var = group_var,
                   reference_gene = 'GAPDH',
                   reference_group = 'brain',
                   intercept = intercept,
                   slope = slope,
                   method = 'relative_curve')

knitr::kable(res1, caption = 'Figure 12: Standard curve method (separate tubes)')

## ----standard_same_tube--------------------------------------------------
## calculate standard amounts and error
res2 <- pcr_analyze(ct2,
                   group_var = group_var,
                   reference_gene = 'GAPDH',
                   reference_group = 'brain',
                   intercept = intercept,
                   slope = slope,
                   method = 'relative_curve',
                   mode = 'same_tube')

knitr::kable(res2, caption = 'Figure 13: Standard curve method (same tube)')

## ----plot_standard_separate_tube-----------------------------------------
gg1 <- pcr_analyze(ct1,
                   group_var = group_var,
                   reference_gene = 'GAPDH',
                   reference_group = 'brain',
                   intercept = intercept,
                   slope = slope,
                   method = 'relative_curve',
                   plot = TRUE) +
  labs(x = '', y = 'Relative mRNA expression') +
  ggtitle(label = 'Separate tubes')

## ----plot_standard_same_tube---------------------------------------------
gg2 <- pcr_analyze(ct2,
                   group_var = group_var,
                   reference_gene = 'GAPDH',
                   reference_group = 'brain',
                   intercept = intercept,
                   slope = slope,
                   method = 'relative_curve',
                   mode = 'same_tube',
                   plot = TRUE) +
  labs(x = '', y = 'Relative mRNA expression') +
  ggtitle(label = 'Same tubes')

## ----plot_expression2, fig.width=8, fig.cap='Figure 5: Relative expression of c-myc using the standard curve'----
plot_grid(gg1, gg2)

## ----testing_data--------------------------------------------------------
# locate and read data
fl <- system.file('extdata', 'ct4.csv', package = 'pcr')
ct4 <- readr::read_csv(fl)

# make group variable
group <- rep(c('control', 'treatment'), each = 12)

## ----analyze_testing_data------------------------------------------------
# analyze the testing data
res <- pcr_analyze(ct4, 
            group_var = group,
            reference_gene = 'ref',
            reference_group = 'control')

## ----plot_testing data, fig.cap='Figure 6: Relative expression of target gene using delta delta $C_T$'----
ggplot(res, aes(x = group, y = relative_expression)) +
  geom_col() +
  labs(x = '', y = 'Relative mRNA expression')

## ----testing_t.test------------------------------------------------------
# test using t-test
tst1 <- pcr_test(ct4,
         group_var = group,
         reference_gene = 'ref',
         reference_group = 'control',
         test = 't.test')

knitr::kable(tst1, caption = 'Figure 14: t-test summary')

## ----testing_wilcox------------------------------------------------------
# test using wilcox.test
tst2 <- pcr_test(ct4,
         group_var = group,
         reference_gene = 'ref',
         reference_group = 'control',
         test = 'wilcox.test')

knitr::kable(tst2, caption = 'Figure 15: Wilcoxon test summary')

## ----testing_lm----------------------------------------------------------
# testing using lm
tst3 <- pcr_test(ct4,
         group_var = group,
         reference_gene = 'ref',
         reference_group = 'control',
         test = 'lm')

knitr::kable(tst3, caption = 'Figure 16: Linear regression summary')

## ----advanced_designs----------------------------------------------------
# testing advanced designs using a model matrix
# make a model matrix
group <- relevel(factor(group), ref = 'control')
dose <- rep(c(100, 80, 60, 40), each = 3, times = 2)
mm <- model.matrix(~group:dose, data = data.frame(group, dose))

# test using t-test
res <- pcr_test(ct4,
                reference_gene = 'ref',
                model_matrix = mm,
                test = 'lm')

knitr::kable(res, caption = "Figure 17: Testing advanced hypotheses")

## ----varying_rna_quality-------------------------------------------------
# using linear models to check the effect of RNA quality
# make a model matrix
group <- relevel(factor(group), ref = 'control')
set.seed(1234)
quality <- scale(rnorm(n = 24, mean = 1.9, sd = .1))
mm <- model.matrix(~group + group:quality, data = data.frame(group, quality))

# testing using lm
res <- pcr_test(ct4,
                reference_gene = 'ref',
                model_matrix = mm,
                test = 'lm')

knitr::kable(res, caption = "Figure 18: Check the effect of varying RNA quality")

## ----multiple_runs-------------------------------------------------------
# using linear model to check the effects of mixing separate runs
# make a model matrix
group <- relevel(factor(group), ref = 'control')
run <- factor(rep(c(1:3), 8))
mm <- model.matrix(~group + group:run, data = data.frame(group, run))

# test using lm
res <- pcr_test(ct4,
                reference_gene = 'ref',
                model_matrix = mm,
                test = 'lm')

knitr::kable(res, caption = "Figure 19: Combining data from multiple qPCR runs")

## ----citation, eval=FALSE------------------------------------------------
#  citation("pcr")


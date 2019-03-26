## ---- echo=FALSE, message=FALSE------------------------------------------
library(descriptr)

## ----norm_plot, fig.width=7, fig.height=7, fig.align='centre'------------
dist_norm_plot(mean = 2, sd = 0.6)

## ----norm_per1, fig.width=7, fig.height=7, fig.align='centre'------------
dist_norm_perc(0.10, 60, 3, 'upper')

## ----norm_per2, fig.width=7, fig.height=7, fig.align='centre'------------
dist_norm_perc(0.85, 60, 3, 'lower')

## ----norm_per3, fig.width=7, fig.height=7, fig.align='centre'------------
dist_norm_perc(0.5, 60, 3, 'both')

## ----norm_prob1, fig.width=7, fig.height=7, fig.align='centre'-----------
dist_norm_prob(80, mean = 90, sd = 4)

## ----norm_prob2, fig.width=7, fig.height=7, fig.align='centre'-----------
dist_norm_prob(100, mean = 90, sd = 4, type = 'upper')

## ----norm_prob3, fig.width=7, fig.height=7, fig.align='centre'-----------
dist_norm_prob(c(85, 100), mean = 90, sd = 4, type = 'both')

## ----binom_plot, fig.width=7, fig.height=7, fig.align='centre'-----------
dist_binom_plot(10, 0.3)

## ----binom_per1, fig.width=7, fig.height=7, fig.align='centre'-----------
dist_binom_perc(10, 0.5, 0.05)

## ----binom_per2, fig.width=7, fig.height=7, fig.align='centre'-----------
dist_binom_perc(10, 0.5, 0.05, 'upper')

## ----binom_prob1, fig.width=7, fig.height=7, fig.align='centre'----------
dist_binom_prob(12, 0.2, 4, type = 'exact')

## ----binom_prob2, fig.width=7, fig.height=7, fig.align='centre'----------
dist_binom_prob(12, 0.2, 1, 'lower')

## ----binom_prob3, fig.width=7, fig.height=7, fig.align='centre'----------
dist_binom_prob(12, 0.2, 8, 'upper')

## ----binom_prob4, fig.width=7, fig.height=7, fig.align='centre'----------
dist_binom_prob(12, 0.2, c(0, 4), 'interval')

## ----chi_plot, fig.width=7, fig.height=7, fig.align='centre'-------------
dist_chi_plot(df = 5)
dist_chi_plot(df = 5, normal = TRUE)

## ----chi_per1, fig.width=7, fig.height=7, fig.align='centre'-------------
dist_chi_perc(0.05, 8, 'upper')

## ----chi_per2, fig.width=7, fig.height=7, fig.align='centre'-------------
dist_chi_perc(0.10, 8, 'lower')

## ----chi_prob1, fig.width=7, fig.height=7, fig.align='centre'------------
dist_chi_prob(8.79, 12, 'upper')

## ----chi_prob2, fig.width=7, fig.height=7, fig.align='centre'------------
dist_chi_prob(8.62, 12, 'lower')

## ----f_plot, fig.width=7, fig.height=7, fig.align='centre'---------------
dist_f_plot()
dist_f_plot(6, 10, normal = TRUE)

## ----f_per1, fig.width=7, fig.height=7, fig.align='centre'---------------
dist_f_perc(0.20, 4, 5, 'upper')

## ----f_per2, fig.width=7, fig.height=7, fig.align='centre'---------------
dist_f_perc(0.35, 4, 5, 'lower')

## ----f_prob1, fig.width=7, fig.height=7, fig.align='centre'--------------
dist_f_prob(3.89, 4, 5, 'upper')

## ----f_prob2, fig.width=7, fig.height=7, fig.align='centre'--------------
dist_f_prob(2.63, 4, 5, 'lower')

## ----t_plot, fig.width=7, fig.height=7, fig.align='centre'---------------
dist_t_plot(df = 8)

## ----t_per1, fig.width=7, fig.height=7, fig.align='centre'---------------
dist_t_perc(0.15, 8, 'upper')

## ----t_per2, fig.width=7, fig.height=7, fig.align='centre'---------------
dist_t_perc(0.11, 8, 'lower')

## ----t_per3, fig.width=7, fig.height=7, fig.align='centre'---------------
dist_t_perc(0.8, 8, 'both')

## ----t_prob1, fig.width=7, fig.height=7, fig.align='centre'--------------
dist_t_prob(2, 6, 'lower')

## ----t_prob2, fig.width=7, fig.height=7, fig.align='centre'--------------
dist_t_prob(2, 6, 'upper')

## ----t_prob3, fig.width=7, fig.height=7, fig.align='centre'--------------
dist_t_prob(2, 6, 'both')

## ----t_prob4, fig.width=7, fig.height=7, fig.align='centre'--------------
dist_t_prob(2, 6, 'interval')


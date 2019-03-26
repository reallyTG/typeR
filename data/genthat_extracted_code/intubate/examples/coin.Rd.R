library(intubate)


### Name: coin
### Title: Interfaces for coin package for data science pipelines.
### Aliases: ntbt_ansari_test ntbt_chisq_test ntbt_cmh_test
###   ntbt_conover_test ntbt_fisyat_test ntbt_fligner_test
###   ntbt_friedman_test ntbt_independence_test ntbt_klotz_test
###   ntbt_koziol_test ntbt_kruskal_test ntbt_lbl_test ntbt_logrank_test
###   ntbt_maxstat_test ntbt_median_test ntbt_mh_test ntbt_mood_test
###   ntbt_normal_test ntbt_oneway_test ntbt_quade_test ntbt_quadrant_test
###   ntbt_sign_test ntbt_symmetry_test ntbt_taha_test ntbt_savage_test
###   ntbt_spearman_test ntbt_wilcox_test ntbt_wilcoxsign_test
### Keywords: intubate magrittr coin ansari_test chisq_test cmh_test
###   conover_test fisyat_test fligner_test friedman_test independence_test
###   klotz_test koziol_test kruskal_test lbl_test logrank_test
###   maxstat_test median_test mh_test mood_test normal_test oneway_test
###   quade_test quadrant_test sign_test symmetry_test taha_test
###   savage_test spearman_test wilcox_test wilcoxsign_test

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(coin)
##D 
##D ## Tests of Independence in Two- or Three-Way Contingency Tables
##D ## Please contribute better example
##D ## Original function to interface
##D chisq_test(Plant ~ Type, data = CO2)
##D cmh_test(Plant ~ Type, data = CO2)
##D lbl_test(Plant ~ Type, data = CO2)
##D 
##D ## The interface puts data as first parameter
##D ntbt_chisq_test(CO2, Plant ~ Type)
##D ntbt_cmh_test(CO2, Plant ~ Type)
##D ntbt_lbl_test(CO2, Plant ~ Type)
##D 
##D ## so it can be used easily in a pipeline.
##D CO2 %>%
##D   ntbt_chisq_test(Plant ~ Type)
##D CO2 %>%
##D   ntbt_cmh_test(Plant ~ Type)
##D CO2 %>%
##D   ntbt_lbl_test(Plant ~ Type)
##D 
##D 
##D ## Correlation Tests
##D ## Original function to interface
##D ## Asymptotic Spearman test
##D spearman_test(CONT ~ INTG, data = USJudgeRatings)
##D ## Asymptotic Fisher-Yates test
##D fisyat_test(CONT ~ INTG, data = USJudgeRatings)
##D ## Asymptotic quadrant test
##D quadrant_test(CONT ~ INTG, data = USJudgeRatings)
##D ## Asymptotic Koziol-Nemec test
##D koziol_test(CONT ~ INTG, data = USJudgeRatings)
##D 
##D ## The interface puts data as first parameter
##D ## Asymptotic Spearman test
##D ntbt_spearman_test(USJudgeRatings, CONT ~ INTG)
##D ## Asymptotic Fisher-Yates test
##D ntbt_fisyat_test(USJudgeRatings, CONT ~ INTG)
##D ## Asymptotic quadrant test
##D ntbt_quadrant_test(USJudgeRatings, CONT ~ INTG)
##D ## Asymptotic Koziol-Nemec test
##D ntbt_koziol_test(USJudgeRatings, CONT ~ INTG)
##D 
##D ## so it can be used easily in a pipeline.
##D ## Asymptotic Spearman test
##D USJudgeRatings %>%
##D   ntbt_spearman_test(CONT ~ INTG)
##D ## Asymptotic Fisher-Yates test
##D USJudgeRatings %>%
##D   ntbt_fisyat_test(CONT ~ INTG)
##D ## Asymptotic quadrant test
##D USJudgeRatings %>%
##D   ntbt_quadrant_test(CONT ~ INTG)
##D ## Asymptotic Koziol-Nemec test
##D USJudgeRatings %>%
##D   ntbt_koziol_test(CONT ~ INTG)
##D 
##D ## ntbt_independence_test: General Independence Test
##D ## Original function to interface
##D independence_test(asat ~ group, data = asat, distribution = "exact",
##D                   alternative = "greater", 
##D                   ytrafo = function(data)
##D                     trafo(data, numeric_trafo = normal_trafo),
##D                   xtrafo = function(data)
##D                       trafo(data, factor_trafo = function(x)
##D                           matrix(x == levels(x)[1], ncol = 1)))
##D 
##D ## The interface puts data as first parameter
##D ntbt_independence_test(asat, asat ~ group, distribution = "exact",
##D                        alternative = "greater", 
##D                        ytrafo = function(data)
##D                          trafo(data, numeric_trafo = normal_trafo),
##D                        xtrafo = function(data)
##D                          trafo(data, factor_trafo = function(x)
##D                            matrix(x == levels(x)[1], ncol = 1)))
##D 
##D ## so it can be used easily in a pipeline.
##D asat %>%
##D   ntbt_independence_test(asat ~ group, distribution = "exact",
##D                          alternative = "greater", 
##D                          ytrafo = function(data)
##D                            trafo(data, numeric_trafo = normal_trafo),
##D                          xtrafo = function(data)
##D                            trafo(data, factor_trafo = function(x)
##D                              matrix(x == levels(x)[1], ncol = 1)))
##D 
##D 
##D ## Two- and K-Sample Location Tests
##D ## Tritiated Water Diffusion Across Human Chorioamnion
##D ## Hollander and Wolfe (1999, p. 110, Tab. 4.1)
##D diffusion <- data.frame(
##D     pd = c(0.80, 0.83, 1.89, 1.04, 1.45, 1.38, 1.91, 1.64, 0.73, 1.46,
##D            1.15, 0.88, 0.90, 0.74, 1.21),
##D     age = factor(rep(c("At term", "12-26 Weeks"), c(10, 5)))
##D )
##D ex <- data.frame(
##D     y = c(3, 4, 8, 9, 1, 2, 5, 6, 7),
##D     x = factor(rep(c("no", "yes"), c(4, 5)))
##D )
##D 
##D ## Original function to interface
##D kruskal_test(pd ~ age, data = diffusion, distribution = "exact")
##D median_test(y ~ x, data = ex, distribution = "exact")
##D normal_test(pd ~ age, data = diffusion, distribution = "exact", conf.int = TRUE)
##D oneway_test(pd ~ age, data = diffusion)
##D savage_test(pd ~ age, data = diffusion, distribution = "exact", conf.int = TRUE)
##D wilcox_test(pd ~ age, data = diffusion, distribution = "exact", conf.int = TRUE)
##D 
##D ## The interface puts data as first parameter
##D ntbt_kruskal_test(diffusion, pd ~ age, distribution = "exact")
##D ntbt_median_test(ex, y ~ x, distribution = "exact")
##D ntbt_normal_test(diffusion, pd ~ age, distribution = "exact", conf.int = TRUE)
##D ntbt_oneway_test(diffusion, pd ~ age)
##D ntbt_savage_test(diffusion, pd ~ age, distribution = "exact", conf.int = TRUE)
##D ntbt_wilcox_test(diffusion, pd ~ age, distribution = "exact", conf.int = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D diffusion %>%
##D   ntbt_kruskal_test(pd ~ age, distribution = "exact")
##D ex %>%
##D   ntbt_median_test(y ~ x, distribution = "exact")
##D diffusion %>%
##D   ntbt_normal_test(pd ~ age, distribution = "exact", conf.int = TRUE)
##D diffusion %>%
##D   ntbt_oneway_test(pd ~ age)
##D diffusion %>%
##D   ntbt_savage_test(pd ~ age, distribution = "exact", conf.int = TRUE)
##D diffusion %>%
##D   ntbt_wilcox_test(pd ~ age, distribution = "exact", conf.int = TRUE)
##D 
##D performance <- matrix(
##D     c(794, 150,
##D        86, 570),
##D     nrow = 2, byrow = TRUE,
##D     dimnames = list(
##D          "First" = c("Approve", "Disprove"),
##D         "Second" = c("Approve", "Disprove")
##D     )
##D )
##D 
##D ## ntbt_mh_test: Marginal Homogeneity Tests
##D ## Effectiveness of different media for the growth of diphtheria
##D ## Cochran (1950, Tab. 2)
##D cases <- c(4, 2, 3, 1, 59)
##D n <- sum(cases)
##D cochran <- data.frame(
##D     diphtheria = factor(
##D         unlist(rep(list(c(1, 1, 1, 1),
##D                         c(1, 1, 0, 1),
##D                         c(0, 1, 1, 1),
##D                         c(0, 1, 0, 1),
##D                         c(0, 0, 0, 0)),
##D                    cases))
##D     ),
##D     media = factor(rep(LETTERS[1:4], n)),
##D     case =  factor(rep(seq_len(n), each = 4))
##D )
##D 
##D ## Original function to interface
##D mh_test(diphtheria ~ media | case, data = cochran)
##D 
##D ## The interface puts data as first parameter
##D ntbt_mh_test(cochran, diphtheria ~ media | case)
##D 
##D ## so it can be used easily in a pipeline.
##D cochran %>%
##D   ntbt_mh_test(diphtheria ~ media | case)
##D 
##D ## ntbt_maxstat_test: Generalized Maximally Selected Statistics
##D ## Original function to interface
##D maxstat_test(counts ~ coverstorey, data = treepipit)
##D 
##D ## The interface puts data as first parameter
##D ntbt_maxstat_test(treepipit, counts ~ coverstorey)
##D 
##D ## so it can be used easily in a pipeline.
##D treepipit %>%
##D   ntbt_maxstat_test(counts ~ coverstorey)
##D 
##D 
##D ## Two- and K-Sample Scale Tests
##D ## Serum Iron Determination Using Hyland Control Sera
##D ## Hollander and Wolfe (1999, p. 147, Tab 5.1)
##D sid <- data.frame(
##D     serum = c(111, 107, 100, 99, 102, 106, 109, 108, 104, 99,
##D               101, 96, 97, 102, 107, 113, 116, 113, 110, 98,
##D               107, 108, 106, 98, 105, 103, 110, 105, 104,
##D               100, 96, 108, 103, 104, 114, 114, 113, 108, 106, 99),
##D     method = gl(2, 20, labels = c("Ramsay", "Jung-Parekh"))
##D )
##D 
##D ## Original function to interface
##D ansari_test(serum ~ method, data = sid)
##D conover_test(serum ~ method, data = sid)
##D fligner_test(serum ~ method, data = sid)
##D klotz_test(serum ~ method, data = sid)
##D mood_test(serum ~ method, data = sid)
##D taha_test(serum ~ method, data = sid)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ansari_test(sid, serum ~ method)
##D ntbt_conover_test(sid, serum ~ method)
##D ntbt_fligner_test(sid, serum ~ method)
##D ntbt_klotz_test(sid, serum ~ method)
##D ntbt_mood_test(sid, serum ~ method)
##D ntbt_taha_test(sid, serum ~ method)
##D 
##D ## so it can be used easily in a pipeline.
##D sid %>%
##D   ntbt_ansari_test(serum ~ method)
##D sid %>%
##D   ntbt_conover_test(serum ~ method)
##D sid %>%
##D   ntbt_fligner_test(serum ~ method)
##D sid %>%
##D   ntbt_klotz_test(serum ~ method)
##D sid %>%
##D   ntbt_mood_test(serum ~ method)
##D sid %>%
##D   ntbt_taha_test(serum ~ method)
##D 
##D ## ntbt_logrank_test: Two- and K-Sample Tests for Censored Data
##D ## Example data (Callaert, 2003, Tab.1)
##D callaert <- data.frame(
##D     time = c(1, 1, 5, 6, 6, 6, 6, 2, 2, 2, 3, 4, 4, 5, 5),
##D     group = factor(rep(0:1, c(7, 8)))
##D )
##D ## Original function to interface
##D logrank_test(Surv(time) ~ group, data = callaert, distribution = "exact")
##D 
##D ## The interface puts data as first parameter
##D ntbt_logrank_test(callaert, Surv(time) ~ group, distribution = "exact")
##D 
##D ## so it can be used easily in a pipeline.
##D callaert %>%
##D   ntbt_logrank_test(Surv(time) ~ group, distribution = "exact")
##D 
##D 
##D ## ntbt_symmetry_test: General Symmetry Test
##D ## One-sided exact Fisher-Pitman test for paired observations
##D y1 <- c(1.83,  0.50,  1.62,  2.48, 1.68, 1.88, 1.55, 3.06, 1.30)
##D y2 <- c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)
##D dta <- data.frame(
##D     y = c(y1, y2),
##D     x = gl(2, length(y1)),
##D     block = factor(rep(seq_along(y1), 2))
##D )
##D 
##D ## Original function to interface
##D symmetry_test(y ~ x | block, data = dta, distribution = "exact", alternative = "greater")
##D 
##D ## The interface puts data as first parameter
##D ntbt_symmetry_test(dta, y ~ x | block, distribution = "exact", alternative = "greater")
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_symmetry_test(y ~ x | block, distribution = "exact", alternative = "greater")
##D 
##D 
##D ## Symmetry Tests
##D ## Data with explicit group and block information
##D dta <- data.frame(y = c(y1, y2), x = gl(2, length(y1)),
##D                   block = factor(rep(seq_along(y1), 2)))
##D 
##D ## Original function to interface
##D ## For two samples, the sign test is equivalent to the Friedman test...
##D sign_test(y ~ x | block, data = dta, distribution = "exact")
##D friedman_test(y ~ x | block, data = dta, distribution = "exact")
##D ## ...and the signed-rank test is equivalent to the Quade test
##D wilcoxsign_test(y ~ x | block, data = dta, distribution = "exact")
##D quade_test(y ~ x | block, data = dta, distribution = "exact")
##D 
##D ## The interface puts data as first parameter
##D ntbt_sign_test(dta, y ~ x | block, distribution = "exact")
##D ntbt_friedman_test(dta, y ~ x | block, distribution = "exact")
##D ntbt_wilcoxsign_test(dta, y ~ x | block, distribution = "exact")
##D ntbt_quade_test(dta, y ~ x | block, distribution = "exact")
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_sign_test(y ~ x | block, distribution = "exact")
##D dta %>%
##D   ntbt_friedman_test(y ~ x | block, distribution = "exact")
##D dta %>%
##D   ntbt_wilcoxsign_test(y ~ x | block, distribution = "exact")
##D dta %>%
##D   ntbt_quade_test(y ~ x | block, distribution = "exact")
## End(Not run)




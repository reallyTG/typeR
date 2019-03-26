## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(fig.width = 7)
# To avoid startup messages when loading epiphy hereinafter:
suppressPackageStartupMessages(library(epiphy))

vers <- packageVersion("epiphy")

## ----load_pkg, message=FALSE, warning=FALSE, eval=FALSE------------------
#  install.packages("devtools") # If not already installed.
#  devtools::install_github("chgigot/epiphy") # Note: Same command for the updates.
#  library(epiphy)

## ----load_data_sets------------------------------------------------------
str(arthropods)
str(tomato_tswv$field_1929)

## ----create_intensity----------------------------------------------------
# Count data
# We will use only the last assessment date for the arthropods data set:
arthropods_t6 <- arthropods[arthropods$t == 3, ]
# - Explicit mapping:
(cou_t3 <- count(arthropods_t6, mapping(x = x, y = y, t = t, i = i)))
# - Total implicit mapping:
cou_t3_bis <- count(arthropods_t6)
# - Partial implicit mapping:
cou_t3_ter <- count(arthropods_t6, mapping(i = i))
all(identical(cou_t3, cou_t3_bis), identical(cou_t3, cou_t3_ter))

# Implicit mapping for incidence data:
(inc <- incidence(tomato_tswv$field_1929))

## ----plot_count----------------------------------------------------------
plot(cou_t3, tile = FALSE, size = 5)

## ----utilities_intensity, fig.show = "hold"------------------------------
inc9 <- clump(inc, unit_size = c(x = 3, y = 3))
plot(inc)
plot(inc9)

## ----fig.width = 3, fig.show = "hold"------------------------------------
inc9_t1 <- split(inc9, by = "t")[[1]]
inc9_t1_sub <- split(inc9_t1, unit_size = c(x = 4, y = 5))[[6]]
plot(inc9_t1)
plot(inc9_t1_sub)

## ----agg_idx-------------------------------------------------------------
(inc9_t1_idx <- agg_index(inc9_t1))

## ----agg_idx_test--------------------------------------------------------
chisq.test(inc9_t1_idx)
z.test(inc9_t1_idx)
calpha.test(inc9_t1_idx)

## ----fit_distributions, warning=FALSE, fig.width=3, fig.show = "hold"----
cou_t3_distr <- fit_two_distr(cou_t3)
summary(cou_t3_distr)

inc9_t1_distr <- fit_two_distr(inc9_t1)
summary(inc9_t1_distr)

plot(cou_t3_distr, breaks = 17)
plot(inc9_t1_distr)

## ----power_laws, fig.width=3, fig.show = "hold"--------------------------
cou <- count(arthropods[arthropods$x <= 6, ])
cou <- split(cou, unit_size = c(x = 3, y = 3))
cou_plaw <- power_law(cou)
coef(summary(cou_plaw))

inc9_spl <- split(inc9, unit_size = c(x = 4, y = 5))
inc_plaw <- power_law(inc9_spl)
coef(summary(inc_plaw))

plot(cou_plaw)
plot(inc_plaw)

## ----threshold_function, fig.width = 3, fig.show = "hold"----------------
plot(inc9_t1)
plot(threshold(inc9_t1))

## ----spatial_hierarchies-------------------------------------------------
inc_low     <- split(inc9, unit_size = c(x = 4, y = 5, t = 1))
inc_high    <- lapply(inc_low, threshold)
(inc_sphier <- spatial_hier(inc_low, inc_high))
plot(inc_sphier)

## ----sadie, fig.height = 5, fig.show = "hold"----------------------------
set.seed(123)
cou_t3_m <- remap(cou_t3, mapping(x = xm, y = ym))
plot(cou_t3_m)
res <- sadie(cou_t3_m)
summary(res)
plot(res)
plot(res, isoclines = TRUE)

## ----mapcomp, fig.height = 5---------------------------------------------
set.seed(123)
res <- mapcomp(cou_t3_m, delta = 4, bandwidth = 60)
res
plot(res)

## ----pipe_analyses, warning=FALSE----------------------------------------
library(epiphy)
library(magrittr)

incidence(tomato_tswv$field_1929) %>%
    split(by = "t") %>%
    getElement(1) %>% # To keep the first assessment time.
    clump(unit_size = c(x = 3, y = 3)) %>%
    fit_two_distr() %T>%
    plot() %>%
    summary()

## ----without_pipes, eval=FALSE-------------------------------------------
#  my_data <- incidence(tomato_tswv$field_1929)
#  my_data <- split(my_data, by = "t")
#  my_data <- my_data[[1]]
#  my_data <- clump(my_data, unit_size = c(x = 3, y = 3))
#  my_res  <- fit_two_distr(my_data)
#  plot(my_res)
#  summary(my_res)

## ----pipes2, warning=FALSE-----------------------------------------------
count(arthropods) %>%
    clump(unit_size = c(x = 3, y = 3)) %>%
    split(by = "t") %>%
    lapply(agg_index) %T>%
    (function(x) plot(sapply(x, function(xx) xx$index), type = "b",
                      xlab = "Observation sequence",
                      ylab = "Aggregation index")) %>%
    sapply(function(x) chisq.test(x)$p.value)


## ---- setup, include = FALSE---------------------------------------------
require(mosaic)   # Load additional packages here 
require(ggformula)

# Some customization.  You can alter or delete as desired (if you know what you are doing).
trellis.par.set(theme = theme.mosaic()) # change default color scheme for lattice
theme_set(theme_bw())                   # change default theme for ggformula
knitr::opts_chunk$set(
  tidy = FALSE,     # display code as typed
  size = "small")   # slightly smaller font for code

## ---- hist-gg------------------------------------------------------------
library(mosaic)   # also loads ggformula 
gf_histogram(~ age, data = HELPrct)

## ---- hist-opt-gg--------------------------------------------------------
gf_histogram(~ age, data = HELPrct,
             binwidth = 5) 

## ---- hist-lattice-------------------------------------------------------
library(mosaic)     # also loads lattice
histogram(~ age, data = HELPrct)

## ---- hist-opt-lattice---------------------------------------------------
histogram(~ age, width = 5, data = HELPrct)

## ---- dens-gg, message = FALSE-------------------------------------------
gf_dens(~ age, data = HELPrct)

## ---- dens2-gg, message = FALSE------------------------------------------
gf_dens(~ age, data = HELPrct,
        color = ~ sex)

## ---- dens-lattice, message = FALSE--------------------------------------
densityplot(~ age, data = HELPrct)

## ---- dens2-lattice------------------------------------------------------
densityplot(~ age, data = HELPrct,
            groups = sex,  auto.key = TRUE)

## ---- dens-hist-gg, message = FALSE--------------------------------------
gf_dhistogram( ~ age, data = HELPrct, 
               alpha = 0.5) %>%
  gf_fitdistr(color = ~"MLE", dist = "dnorm") %>% 
  gf_dens(color = ~"KDE")   

## ---- dens-hist-lattice, message = FALSE---------------------------------
histogram(~ age, data = HELPrct, 
          fit = "normal", dcol = "red")

## ---- boxplot-gg, message = FALSE----------------------------------------
gf_boxplot(age ~ sex, data = HELPrct)

## ---- boxplot-facets-gg, message = FALSE---------------------------------
gf_boxplot(age ~ sex | homeless, 
  data = HELPrct)

## ---- boxplot-lattice, message = FALSE-----------------------------------
bwplot(age ~ sex, data = HELPrct)

## ---- boxplot-facet-lattice, message = FALSE-----------------------------
bwplot(age ~ sex | homeless, 
       data = HELPrct)

## ---- scatter-gg, message = FALSE----------------------------------------
gf_point(cesd ~ age, data = HELPrct)

## ---- scatter2-gg, message = FALSE---------------------------------------
gf_point(cesd ~ age, data = HELPrct,
         color = ~ sex) %>%
  gf_lm()

## ---- scatter-lattice, message = FALSE-----------------------------------
xyplot(cesd ~ age, data = HELPrct)

## ---- scatter2-lattice, message = FALSE----------------------------------
xyplot(cesd ~ age,  data = HELPrct,
       groups = sex, 
       type = c("p", "r"), 
       auto.key = TRUE) 

## ---- scatter3-gg, message = FALSE---------------------------------------
gf_point(cesd ~ age | sex, 
         data = HELPrct) %>%
  gf_smooth(se = FALSE)

## ---- scatter4-gg--------------------------------------------------------
gf_point(cesd ~ age, data = HELPrct,
         color = ~ sex) %>%
  gf_lm() %>% 
  gf_theme(legend.position = "top") %>% 
  gf_labs(title = "This is my ggformula plot", 
    x = "age (in years)", 
    y = "CES-D measure of \ndepressive symptoms")

## ---- scatter3-lattice, message = FALSE----------------------------------
xyplot(cesd ~ age | sex,  data = HELPrct,
       type = c("p", "smooth"), 
       auto.key = TRUE) 

## ---- scatter4-lattice, message = FALSE----------------------------------
xyplot(cesd ~ age, groups = sex, 
       type = c("p", "r"), 
       auto.key = TRUE, 
       main = "This is my lattice plot", 
       xlab = "age (in years)", 
       ylab = "CES-D measure of \ndepressive symptoms",
       data = HELPrct)

## ----log-scales-gg-------------------------------------------------------
gf_point(cesd ~ age, data = HELPrct) %>%
  gf_refine(scale_y_log10()) 

## ----refine-gg-----------------------------------------------------------
gf_dens( ~ cesd, color = ~ sex, data = HELPrct) %>%
  gf_rug(0 ~ cesd, 
         position = position_jitter(height = 0)) %>%
  gf_refine(
    scale_color_manual(values = c("navy", "red"))) 

## ---- log-scales-lattice-------------------------------------------------
xyplot(cesd ~ age, data = HELPrct,
       scales = list(y = list(log = TRUE)))

## ---- refine-lattice-----------------------------------------------------
densityplot( ~ cesd, groups = sex, data = HELPrct, 
             rug = FALSE,
             par.settings = 
               list(
                 superpose.line = 
                   list(col = c("navy", "red")),
                 superpose.symbol = 
                   list(col = c("navy", "red"))
               )) 


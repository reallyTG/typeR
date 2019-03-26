## ----setup, echo = FALSE, include = FALSE--------------------------------

knitr::opts_chunk$set(fig.width = 5,
                      fig.height = 4)


## ----head-iris-----------------------------------------------------------

head(iris)


## ----glimpse-------------------------------------------------------------
library(dplyr)
glimpse(iris)


## ----visdat-glimpse------------------------------------------------------
library(visdat)

glimpse(typical_data)


## ----load-data-----------------------------------------------------------

vis_dat(typical_data)


## ----example-vis-miss----------------------------------------------------

vis_miss(typical_data)


## ----vis_dat-------------------------------------------------------------

vis_dat(airquality)


## ----visdat-typical------------------------------------------------------

vis_dat(typical_data)

vis_dat(typical_data, 
        sort_type = FALSE)


## ----vis_miss------------------------------------------------------------

vis_miss(airquality)


## ----vismiss-new-data----------------------------------------------------

df_test <- data.frame(x1 = 1:10000,
                      x2 = rep("A", 10000),
                      x3 = c(rep(1L, 9999), NA))

vis_miss(df_test)


## ----vismiss-mtcars------------------------------------------------------

df_test <- data.frame(x1 = 1:10000,
                      x2 = rep("tidy", 10000),
                      x3 = rep("data", 10000))

vis_miss(df_test)


## ----vismiss-------------------------------------------------------------

vis_miss(airquality,
         sort_miss = TRUE)


## ----vis_miss-cluster----------------------------------------------------

vis_miss(airquality, 
         cluster = TRUE)


## ----vis-compare-iris----------------------------------------------------
chickwts_diff <- chickwts
chickwts_diff[sample(1:nrow(chickwts), 30),sample(1:ncol(chickwts), 2)] <- NA

vis_compare(chickwts_diff, chickwts)


## ----vis-compare-error, eval = FALSE-------------------------------------
#  
#  chickwts_diff_2 <- chickwts
#  chickwts_diff_2$new_col <- chickwts_diff_2$weight*2
#  
#  vis_compare(chickwts, chickwts_diff_2)
#  # Error in vis_compare(chickwts, chickwts_diff_2) :
#  #   Dimensions of df1 and df2 are not the same. vis_compare requires dataframes of identical dimensions.

## ----vis-expect----------------------------------------------------------

vis_expect(airquality, ~.x >= 25)


## ----vis-expect-bad-strings----------------------------------------------

bad_data <- data.frame(x = c(rnorm(100), rep("N/A", 10)),
                       y = c(rep("N A ", 30), rnorm(80)))

vis_expect(bad_data, ~.x %in% c("N/A", "N A "))

## ----vis-cor-------------------------------------------------------------

vis_cor(airquality)


## ----vis-cor-spearman----------------------------------------------------

vis_cor(airquality, cor_method = "spearman")


## ----vis-cor-na-action---------------------------------------------------

vis_cor(airquality,
        na_action = "complete.obs")


## ----create-messy-vec----------------------------------------------------

messy_vector <- c(TRUE,
                  T,
                  "TRUE",
                  "T",
                  "01/01/01",
                  "01/01/2001",
                  NA,
                  NaN,
                  "NA",
                  "Na",
                  "na",
                  "10",
                  10,
                  "10.1",
                  10.1,
                  "abc",
                  "$%TG")

set.seed(1114)
messy_df <- data.frame(var1 = messy_vector,
                       var2 = sample(messy_vector),
                       var3 = sample(messy_vector))


## ----vis-guess-messy-df, fig.show='hold', out.width='50%'----------------

vis_guess(messy_df)
vis_dat(messy_df)


## ----intx, eval = FALSE--------------------------------------------------
#  
#  library(plotly)
#  ggplotly(vis_dat(airquality))
#  ggplotly(vis_miss(airquality))
#  ggplotly(vis_guess(airquality))
#  


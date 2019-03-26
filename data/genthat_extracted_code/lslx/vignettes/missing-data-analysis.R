## ----comment = "", message = FALSE, setup, include=FALSE------------------------------------------
options(digits = 3)
options(width = 100)

## ----comment = "", message = FALSE----------------------------------------------------------------
data_miss <- lavaan::HolzingerSwineford1939
data_miss$x5 <- ifelse(data_miss$x1 <= quantile(data_miss$x1, .3), 
                       NA, data_miss$x5)
data_miss$age <- data_miss$ageyr + data_miss$agemo/12
data_miss$x9 <- ifelse(data_miss$age <= quantile(data_miss$age, .3), 
                       NA, data_miss$x9)

## ----comment = "", message = FALSE----------------------------------------------------------------
model_miss <- "visual  :=> x1 + x2 + x3
               textual :=> x4 + x5 + x6
               speed   :=> x7 + x8 + x9
               visual  <=> 1 * visual
               textual <=> 1 * textual
               speed   <=> 1 * speed"

## ----comment = "", message = FALSE----------------------------------------------------------------
library(lslx)
lslx_miss <- lslx$new(model = model_miss, data = data_miss,
                      auxiliary_variable = c("ageyr", "agemo"))

## ----comment = "", message = FALSE----------------------------------------------------------------
lslx_miss$penalize_block(block = "y<->y", type = "fixed", verbose = FALSE)

## ----comment = "", message = FALSE----------------------------------------------------------------
lslx_miss$fit_lasso()

## ----comment = "", message = FALSE, fig.width = 24, fig.height = 14-------------------------------
lslx_miss$summarize(selector = "raic")


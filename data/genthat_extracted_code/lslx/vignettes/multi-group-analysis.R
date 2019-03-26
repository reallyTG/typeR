## ----comment = "", message = FALSE, setup, include=FALSE------------------------------------------
options(digits = 3)
options(width = 100)

## ----comment = "", message = FALSE----------------------------------------------------------------
model_mgfa <- "visual  :=> 1 * x1 + x2 + x3 
               textual :=> 1 * x4 + x5 + x6 
               speed   :=> 1 * x7 + x8 + x9"

## ----comment = "", message = FALSE----------------------------------------------------------------
library(lslx)
lslx_mgfa <- lslx$new(model = model_mgfa,
                    data = lavaan::HolzingerSwineford1939,
                    group_variable = "school",
                    reference_group = "Pasteur")

## ----comment = "", message = FALSE----------------------------------------------------------------
lslx_mgfa$penalize_heterogeneity(block = c("y<-1", "y<-f"), group = "Grant-White")

## ----comment = "", message = FALSE----------------------------------------------------------------
lslx_mgfa$free_block(block = "f<-1", group = "Grant-White")

## ----comment = "", message = FALSE----------------------------------------------------------------
lslx_mgfa$fit_mcp()

## ----comment = "", message = FALSE, fig.width = 24, fig.height = 14-------------------------------
lslx_mgfa$summarize(selector = "hbic")


## ----set-opts, echo = FALSE----------------------------------------------
knitr::opts_chunk$set(
  fig.width = 7,
  fig.height = 4
)

## ----install-mekko-package, eval=FALSE-----------------------------------
#  install.packages("mekko")

## ----open-vignette, eval=FALSE-------------------------------------------
#  vignette("mekko-vignette")

## ----load-packages, warning = FALSE, message = FALSE---------------------
library(ggplot2)
library(mekko)

## ----create-example-data-------------------------------------------------
profits <- data.frame(
  product = c('widgets', 'sprockets', 'cogs', 'whosits', 'whatsits'),
  profit_margin = c(3.2, -1.4, 0.1, -5.5, 11.9),
  revenue = c(850, 1600, 900, 675, 250)
  )

## ----current-state-bad-example-bar-mekko---------------------------------
ggplot(profits, aes(x = product, y = profit_margin)) +
  geom_bar(stat = "identity")

## ----ggplot-bar-width-fail-----------------------------------------------
ggplot(profits, aes(x = product, y = profit_margin, width = revenue)) +
  geom_bar(stat = "identity") +
  labs(title = "Variable bar width fail :(")

## ----bar-mekko-example---------------------------------------------------
bmx <- barmekko(profits, product, profit_margin, revenue)
bmx

## ----bar-mekko-extension-------------------------------------------------
bmx + theme(axis.text.x = element_text(angle = 90, hjust = 1))


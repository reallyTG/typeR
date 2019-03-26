## ----setup, include=FALSE, echo=FALSE------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  warning = FALSE, 
  message = FALSE,
  comment = "# >"
)

## ----theme_publish-------------------------------------------------------
require(envalysis)
require(ggplot2)
p <- ggplot(mtcars) + geom_point(aes(x = wt, y = mpg,
     colour=factor(gear))) + facet_wrap( ~ am)
p
p + theme_publish() + ggsave('theme_publish.png', dpi = 96)


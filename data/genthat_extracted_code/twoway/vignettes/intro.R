## ----nomessages, echo = FALSE--------------------------------------------
# set some default options for chunks
knitr::opts_chunk$set(
  warning = FALSE,   # avoid warnings and messages in the output
  message = FALSE,
  fig.height = 5,
  fig.width = 5
)
options(digits=4)
par(mar=c(3,3,1,1)+.1)

## ----load-packages, echo=FALSE-------------------------------------------
library(twoway)   # Load additional packages here 

## ---- fig.show='hold'----------------------------------------------------
plot(1:10)
plot(10:1)


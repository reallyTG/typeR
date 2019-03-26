## ----setup, include=FALSE, echo=FALSE------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  warning = FALSE, 
  message = FALSE,
  comment = "# >"
)

## ----texture-------------------------------------------------------------
# Load envalysis
library(envalysis)

# Load and look at sample data
data(clayloam)
clayloam

# Calculate the particle size distribution
texture(Time, Reading, Blank, Temperature, data = clayloam, plot = T)


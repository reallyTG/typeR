## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE, 
  fig.width = 5.75, 
  fig.height = 4.5
)

# Load packages
library("dvmisc")
library("knitr")
library("accelerometry")

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("accelerometry")

## ---- eval = FALSE-------------------------------------------------------
#  library("devtools")
#  install_github("vandomed/accelerometry")

## ------------------------------------------------------------------------
head(unidata)
dim(unidata)

## ------------------------------------------------------------------------
seqn <- unidata[, "seqn"]
counts <- unidata[, "paxinten"]
counts.21007 <- counts[seqn == 21007]
plot(counts.21007, main = "Counts for Subject 21007")

## ------------------------------------------------------------------------
wear1 <- weartime(counts.21007)

## ------------------------------------------------------------------------
wear2 <- weartime(counts.21007, 
                  window = 90, 
                  tol = 2, 
                  tol_upper = 99)

## ---- fig.width = 8------------------------------------------------------
par(mfrow = c(1, 2))

plot(counts.21007, main = "Subject 21007 (whole week)")
points(wear1 * 5000, type = "l", col = "blue")
points(wear2 * 5100, type = "l", col = "red")

plot(counts.21007, xlim = c(4321, 5760), main = "Subject 21007 (day 4)")
points(wear1 * 5000, type = "l", col = "blue")
points(wear2 * 5100, type = "l", col = "red")

## ------------------------------------------------------------------------
mvpa <- bouts(counts = counts.21007, 
              bout_length = 10, 
              thresh_lower = 2020)
sum(mvpa)

## ------------------------------------------------------------------------
mvpa <- bouts(counts = counts.21007, 
              bout_length = 10, 
              thresh_lower = 2020, 
              tol = 2, 
              tol_lower = 100)
sum(mvpa)

## ------------------------------------------------------------------------
(intensity.data <- intensities(counts = counts.21007[wear1 == 1]))

## ------------------------------------------------------------------------
breakcount <- sedbreaks(counts = counts.21007, 
                        weartime = wear1)
sum(breakcount)

## ------------------------------------------------------------------------
(averages.21007 <- process_uni(counts.21007))

## ------------------------------------------------------------------------
averages.21007 <- process_uni(counts = counts.21007, 
                              brevity = 2)
colnames(averages.21007)

## ------------------------------------------------------------------------
averages.21007[, c("sed_percent", "sed_bouted_60min", "max_1min_counts")]

## ------------------------------------------------------------------------
(daily.21007 <- process_uni(counts = counts.21007, 
                            return_form = "daily"))

## ------------------------------------------------------------------------
head(tridata)

## ------------------------------------------------------------------------
(daily.tri <- process_tri(tridata))

## ------------------------------------------------------------------------
(daily.tri <- process_tri(counts = tridata, 
                          nonwear_axis = "sum", 
                          nonwear_window = 45))


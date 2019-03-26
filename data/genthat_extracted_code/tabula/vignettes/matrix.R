## ----setup, include = FALSE, echo=FALSE----------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(tabula)

## ----create--------------------------------------------------------------
# Create a count data matrix
CountMatrix(data = sample(0:10, 100, TRUE),
            nrow = 10, ncol = 10)

# Create an incidence (presence/absence) matrix
# Numeric values are coerced to logical as by as.logical
IncidenceMatrix(data = sample(0:1, 100, TRUE),
                nrow = 10, ncol = 10)

## ----coerce--------------------------------------------------------------
# Create a count matrix
#  Numeric values are coerced to integer and hence truncated towards zero
A1 <- CountMatrix(data = sample(0:10, 100, TRUE),
                  nrow = 10, ncol = 10)

# Coerce counts to frequencies
B <- as(A1, "FrequencyMatrix")

# Row sums are internally stored before coercing to a frequency matrix
totals(B)
# This allows to restore the source data
A2 <- as(B, "CountMatrix")
all(A1 == A2)

# Coerce to presence/absence
C <- as(A1, "IncidenceMatrix")

# Coerce to a co-occurrence matrix
D <- as(A1, "OccurrenceMatrix")


library(DTWBI)


### Name: DTWBI-package
### Title: Imputation of Time Series Based on Dynamic Time Warping
### Aliases: DTWBI-package DTWBI
### Keywords: package DTW times series imputation

### ** Examples

# Load package dataset
data(dataDTWBI)

# Create a query and a reference signal
query <- dataDTWBI$query
ref <- dataDTWBI$query

# Create a gap within query (10% of signal size)
query <- gapCreation(query, rate = 0.1)
data <- query$output_vector
begin_gap <- query$begin_gap
size_gap <- query$gap_size

# Fill gap using DTWBI algorithm
results_DTWBI <- DTWBI_univariate(data, t_gap = begin_gap, T_gap = size_gap)

# Plot
plot(ref, type = "l")
lines(results_DTWBI$output_vector, col = "red", lty = "dashed")

# Compute the similarity of imputed vector and reference
compute.sim(ref, results_DTWBI$output_vector)




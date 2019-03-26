library(bisect)


### Name: bisect_supervised
### Title: Add together two numbers.
### Aliases: bisect_supervised

### ** Examples

## Prepare the methylation and total reads matrices
methylation <- as.matrix(methylation_GSE40279)
total_reads <- as.matrix(total_reads_GSE40279)
## Remove the IDs column from the reference
Pi <- as.matrix(reference_blood[,-1])

## Run Bisect. You should use around 200 iterations. I choose than to accelarate the example.
results <- bisect_supervised(methylation, total_reads, Pi, alpha_blood, iterations = 10)




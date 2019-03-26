## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
# Load required packages
library(alakazam)

# Load example data
data(ExampleDb)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Partitions the data based on the SAMPLE column
clones <- countClones(ExampleDb, groups="SAMPLE")
head(clones, 5)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Partitions the data based on both the SAMPLE and ISOTYPE columns
# Weights the clone sizes by the DUPCOUNT column
clones <- countClones(ExampleDb, groups=c("SAMPLE", "ISOTYPE"), copy="DUPCOUNT")
head(clones, 5)

## ---- eval=TRUE, results='hide', warning=FALSE, fig.width=6, fig.height=4----
# Partitions the data on the SAMPLE column
# Calculates a 95% confidence interval via 200 bootstrap realizations
clones <- estimateAbundance(ExampleDb, group="SAMPLE", ci=0.95, nboot=200)

## ---- eval=TRUE, warning=FALSE, fig.width=6, fig.height=4----------------
# Plots a rank abundance curve of the relative clonal abundances
sample_colors <- c("-1h"="seagreen", "+7d"="steelblue")
plot(clones, colors=sample_colors, legend_title="Sample")

## ---- eval=TRUE, results='hide'------------------------------------------
# Compare diversity curve across values in the "SAMPLE" column
# q ranges from 0 (min_q=0) to 4 (max_q=4) in 0.05 incriments (step_q=0.05)
# A 95% confidence interval will be calculated (ci=0.95)
# 200 resampling realizations are performed (nboot=200)
sample_div <- rarefyDiversity(ExampleDb, "SAMPLE", min_q=0, max_q=4, step_q=0.05,
                              ci=0.95, nboot=200)

# Compare diversity curve across values in the "ISOTYPE" column
# Analyse is restricted to ISOTYPE values with at least 30 sequences by min_n=30
# Excluded groups are indicated by a warning message
isotype_div <- rarefyDiversity(ExampleDb, "ISOTYPE", min_n=30, min_q=0, max_q=4, 
                               step_q=0.05, ci=0.95, nboot=200)

## ---- eval=TRUE, fig.width=6, fig.height=4-------------------------------
# Plot a log-log (log_q=TRUE, log_d=TRUE) plot of sample diversity
# Indicate number of sequences resampled from each group in the title
sample_main <- paste0("Sample diversity (n=", sample_div@n, ")")
sample_colors <- c("-1h"="seagreen", "+7d"="steelblue")
plot(sample_div, colors=sample_colors, main_title=sample_main, 
     legend_title="Sample")

# Plot isotype diversity using default set of Ig isotype colors
isotype_main <- paste0("Isotype diversity (n=", isotype_div@n, ")")
plot(isotype_div, colors=IG_COLORS, main_title=isotype_main, 
     legend_title="Isotype")

## ---- eval=TRUE----------------------------------------------------------
# Test diversity at q=2 (equivalent to Simpson's index) across values in the "SAMPLE" column
# 200 bootstrap realizations are performed (nboot=200)
sample_test <- testDiversity(ExampleDb, 2, "SAMPLE", nboot=200)

# Print p-value table
print(sample_test)

## ---- eval=TRUE----------------------------------------------------------
# Test diversity across values in the "ISOTYPE" column
# Analyse is restricted to ISOTYPE values with at least 30 sequences by min_n=30
# Excluded groups are indicated by a warning message
isotype_test <- testDiversity(ExampleDb, 2, "ISOTYPE", min_n=30, nboot=200)

# Print p-value table
print(isotype_test)

# Plot the mean and standard deviations from the test
plot(isotype_test, colors=IG_COLORS, main_title=isotype_main, 
     legend_title="Isotype")


## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
# Subset example data to one sample
library(shazam)
data(ExampleDb, package="alakazam")

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Use nucleotide Hamming distance and normalize by junction length
dist_ham <- distToNearest(ExampleDb, vCallColumn="V_CALL_GENOTYPED", 
                          model="ham", normalize="len", nproc=1)

# Use genotyped V assignments, a 5-mer model and no normalization
dist_s5f <- distToNearest(ExampleDb, vCallColumn="V_CALL_GENOTYPED", 
                          model="hh_s5f", normalize="none", nproc=1)

## ---- eval=TRUE, warning=FALSE, fig.width=7------------------------------
# Generate Hamming distance histogram
library(ggplot2)
p1 <- ggplot(subset(dist_ham, !is.na(DIST_NEAREST)),
             aes(x=DIST_NEAREST)) + 
    theme_bw() + 
    xlab("Hamming distance") + 
    ylab("Count") +
    scale_x_continuous(breaks=seq(0, 1, 0.1)) +
    geom_histogram(color="white", binwidth=0.02) +
    geom_vline(xintercept=0.12, color="firebrick", linetype=2)
plot(p1)

## ---- eval=TRUE, warning=FALSE, fig.width=7------------------------------
# Generate HH_S5F distance histogram
p2 <- ggplot(subset(dist_s5f, !is.na(DIST_NEAREST)),
             aes(x=DIST_NEAREST)) + 
    theme_bw() + 
    xlab("HH_S5F distance") + 
    ylab("Count") +
    scale_x_continuous(breaks=seq(0, 50, 5)) +
    geom_histogram(color="white", binwidth=1) +
    geom_vline(xintercept=7, color="firebrick", linetype=2)
plot(p2)

## ---- eval=TRUE, warning=FALSE, fig.width=7------------------------------
# Find threshold using density method
output <- findThreshold(dist_ham$DIST_NEAREST, method="density")
threshold <- output@threshold

# Plot distance histogram, density estimate and optimum threshold
plot(output, title="Density Method")

# Print threshold
print(output)

## ---- eval=TRUE, warning=FALSE, fig.width=7------------------------------
# Find threshold using gmm method
output <- findThreshold(dist_ham$DIST_NEAREST, method="gmm", model="gamma-gamma")

# Plot distance histogram, Gaussian fits, and optimum threshold
plot(output, binwidth=0.02, title="GMM Method: gamma-gamma")

# Print threshold
print(output)

## ----fields, eval=TRUE, warning=FALSE------------------------------------
dist_fields <- distToNearest(ExampleDb, model="ham", normalize="len", 
                             fields="SAMPLE", nproc=1)

## ---- eval=TRUE, warning=FALSE, fig.width=7------------------------------
# Generate grouped histograms
p4 <- ggplot(subset(dist_fields, !is.na(DIST_NEAREST)), 
             aes(x=DIST_NEAREST)) + 
    theme_bw() + 
    xlab("Grouped Hamming distance") + 
    ylab("Count") +
    geom_histogram(color="white", binwidth=0.02) +
    geom_vline(xintercept=0.12, color="firebrick", linetype=2) +
    facet_grid(SAMPLE ~ ., scales="free_y")
plot(p4)

## ----cross, eval=TRUE, warning=FALSE-------------------------------------
dist_cross <- distToNearest(ExampleDb, model="ham", first=FALSE, 
                            normalize="len", cross="SAMPLE", nproc=1)

## ---- eval=TRUE, warning=FALSE, fig.width=7------------------------------
# Generate cross sample histograms
p5 <- ggplot(subset(dist_cross, !is.na(CROSS_DIST_NEAREST)), 
             aes(x=CROSS_DIST_NEAREST)) + 
    theme_bw() + 
    xlab("Cross-sample Hamming distance") + 
    ylab("Count") +
    geom_histogram(color="white", binwidth=0.02) +
    geom_vline(xintercept=0.12, color="firebrick", linetype=2) +
    facet_grid(SAMPLE ~ ., scales="free_y")
plot(p5)


## ---- echo=FALSE,message=FALSE, warning=FALSE----------------------------
#devtools::load_all()

## ------------------------------------------------------------------------
library(cdfquantreg)
data(cdfqrExampleData)
ipcc_mid <- subset(IPCC, mid == 1 & high == 0)

# Overview the data
knitr::kable(head(ipcc_mid), row.names=F)

# Distribution of the data
MASS::truehist(ipcc_mid$probm)

# Choice of CDF distribution: finite tailed
cdfqrFamily(shape='FT')

## ----fit-----------------------------------------------------------------
# We use T2-T2 distribution
fd <- "t2"
sd <- "t2"

# Fit the null model
fit_null <- cdfquantreg(probm ~ 1 | 1, fd, sd, data = ipcc_mid)

# Fit the target model
fit <- cdfquantreg(probm ~ valence | valence, fd, sd, data = ipcc_mid)

# Obtain the statistics for the null model
summary(fit)

## ----plotfit, fig.width= 7-----------------------------------------------
# Compare the empirical distribution and the fitted values distribution
plot(fit)

# Plot the fitted values
plot(fitted(fit, "full"))

# Check Residuals
plot(residuals(fit, "raw"))


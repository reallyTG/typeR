## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library("bayfoxr")

## ------------------------------------------------------------------------
data("bassriver")  # Load the "bassriver" dataframe.

head(bassriver)  # Take a quick look at what the data looks like.

## ------------------------------------------------------------------------
sst <- predict_seatemp(bassriver$d18o, d18osw = 0.0, prior_mean = 30.0, 
                       prior_std = 20.0)

## ------------------------------------------------------------------------
quants <- quantile(sst, probs = c(0.05, 0.50, 0.95))
head(quants)  # Just see the top of the data...

## ------------------------------------------------------------------------
predictplot(x = bassriver$depth, y = sst, ylim = c(20, 40), 
            ylab = "SST (°C)", xlab = "Depth (m)")

## ------------------------------------------------------------------------
d18oc <- predict_d18oc(c(24, 25, 23), d18osw = 0.0)

## ------------------------------------------------------------------------
print(quantile(d18oc))

predictplot(y=d18oc, ylab="δ18Oc (‰ VPDB)", xlab='Sample', ylim = c(-3.5, 0))

## ------------------------------------------------------------------------
d18oc <- predict_d18oc(c(24, 25, 23), d18osw = 0.0)

## ------------------------------------------------------------------------
#d18oc <- predict_d18oc(c(24, 25, 23), d18osw = 0.0, seasonal_seatemp = TRUE)  # Pooled seasonal

d18oc <- predict_d18oc(c(24, 25, 23), d18osw = 0.0, foram = "G. bulloides")  # Hierarchical annual for bulloides

# Hierarchical seasonal for bulloides:
d18oc <- predict_d18oc(c(24, 25, 23), d18osw = 0.0, seasonal_seatemp = TRUE,
                       foram = "G. bulloides")


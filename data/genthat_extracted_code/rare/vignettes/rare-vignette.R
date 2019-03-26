## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=T, include=T--------------------------------------------------
library(rare)
library(Matrix)
# Design matrix = document-term matrix
dim(data.dtm)
# Ratings for the reviews in data.dtm
length(data.rating)

## ---- fig.height=4, fig.width=7, eval=T, include=T-----------------------
hist(colMeans(sign(data.dtm)) * 100, breaks = 50, main = "Histogram of Adjective Rarity in the TripAdvisor Sample", 
     xlab = "% of Reviews Using Adjective")

## ---- results='hide', fig.height=3, fig.width=10, eval=T, include=T------
par(cex=0.35)
plot(as.dendrogram(data.hc))

## ---- eval=T, include=T--------------------------------------------------
set.seed(100)
ts <- sample(1:length(data.rating), 400) # Train set indices

## ---- eval=T, include=F--------------------------------------------------
load("vignette_results.RData")

## ---- eval=F, include=T--------------------------------------------------
#  ourfit <- rarefit(y = data.rating[ts], X = data.dtm[ts, ], hc = data.hc, lam.min.ratio = 1e-6,
#                    nlam = 20, nalpha = 10, rho = 0.01, eps1 = 1e-5, eps2 = 1e-5, maxite = 1e4)

## ---- eval=F, include=T--------------------------------------------------
#  # Cross validation
#  ourfit.cv <- rarefit.cv(ourfit, y = data.rating[ts], X = data.dtm[ts, ],
#                          rho = 0.01, eps1 = 1e-5, eps2 = 1e-5, maxite = 1e4)

## ---- eval=F, include=T--------------------------------------------------
#  # Prediction on test set
#  pred <- rarefit.predict(ourfit, ourfit.cv, data.dtm[-ts, ])
#  pred.error <- mean((pred - data.rating[-ts])^2)
#  pred.error

## ---- eval=T, include=T--------------------------------------------------
# Find recovered groups at optimal beta and gamma
ibest.lambda <- ourfit.cv$ibest[1]
ibest.alpha <- ourfit.cv$ibest[2]
beta.opt <- ourfit$beta[[ibest.alpha]][, ibest.lambda]
gamma.opt <- ourfit$gamma[[ibest.alpha]][, ibest.lambda]
groups.opt <- group.recover(gamma.opt, ourfit$A)
length(groups.opt) # total number of aggregated groups

## ---- eval=T, include=T, results='hide', fig.height=3, fig.width=10------
# Visualize the groups at optimal beta and gamma
par(cex=0.35)
group.plot(beta.opt, gamma.opt, ourfit$A, data.hc)


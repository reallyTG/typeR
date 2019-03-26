library(robustfa)


### Name: computeScores
### Title: Compute Factor Scores
### Aliases: computeScores
### Keywords: robust

### ** Examples

data("stock611")
stock604 = stock611[-c(92,2,337,338,379,539,79), ]
data = as.matrix(stock604[, 3:12])

factors = 2
cor = TRUE
scoresMethod = "regression" 

covx = Cov(data)
covmat = list(cov = getCov(covx), center = getCenter(covx), n.obs = covx@n.obs)

out = factanal(factors = factors, covmat = covmat)

out = computeScores(out, x = data, covmat = covmat, cor = cor, scoresMethod = scoresMethod)
out





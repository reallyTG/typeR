library(revdbayes)


### Name: summary.evpost
### Title: Summarizing an evpost object
### Aliases: summary.evpost

### ** Examples

# GP posterior
data(gom)
u <- stats::quantile(gom, probs = 0.65)
fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
gpg <- rpost_rcpp(n = 1000, model = "gp", prior = fp, thresh = u,
                  data = gom)
summary(gpg)




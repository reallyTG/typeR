library(revdbayes)


### Name: kgaps_mle
### Title: Maximum likelihood estimation for the K-gaps model
### Aliases: kgaps_mle

### ** Examples

thresh <- quantile(newlyn, probs = 0.90)
# MLE and SE only
kgaps_mle(newlyn, thresh)
# MLE, SE and 95% confidence interval
kgaps_mle(newlyn, thresh, conf = 95)




library(gtx)


### Name: liver.scores
### Title: Genetic risk scores for liver enzyme traits.
### Aliases: liver.scores
### Keywords: datasets

### ** Examples

data(liver.scores)
with(subset(liver.scores, score == "ALP2011"), {
  plot(pmin(coded.freq, 1 - coded.freq), coef,
       xlab = "MAF", ylab = "ALP effect",
       xlim = c(0, 0.5), ylim = c(0, 10), las = 1)
  text(pmin(coded.freq, 1 - coded.freq), coef, name,
       pos = 3, cex = 0.5)})
## compare unweighted score used by Chambers et al. 2011
## with weighted score:
with(subset(liver.scores, score == "ALP2011"),
     rbind(unlist(grs.summary(rep(1, length(coef)), beta_replication,
                              se_replication, n = 8112)),
           unlist(grs.summary(coef, beta_replication,
                              se_replication, n = 8112))))




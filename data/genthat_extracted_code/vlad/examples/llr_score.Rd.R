library(vlad)


### Name: llr_score
### Title: Compute the log-likelihood ratio score
### Aliases: llr_score

### ** Examples

require(vlad)
# see Steiner et al. (2000) p. 446 or Steiner (2014) p. 234
coeff <- c("(Intercept)"=-3.68, "Parsonnet"=0.077)
# Log-likelihood ratio scores for detecting an increase in the failure rate:
# low risk patients with a Parsonnet score of zero

llr_score(df=data.frame(as.integer(0), 0), coeff=coeff, RA=2)
llr_score(df=data.frame(as.integer(0), 1), coeff=coeff, RA=2)

# higher risk patients with a Parsonnet score of 50
llr_score(df=data.frame(as.integer(50), 0), coeff=coeff, RA=2)
llr_score(df=data.frame(as.integer(50), 1), coeff=coeff, RA=2)

# see Steiner (2014) p. 234
# Log-likelihood ratio scores for detecting an decrease in the failure rate:
# low risk patients with a Parsonnet score of zero
llr_score(df=data.frame(as.integer(0), 0), coeff=coeff, RA=1/2)
llr_score(df=data.frame(as.integer(0), 1), coeff=coeff, RA=1/2)

# higher risk patients with a Parsonnet score of 50
llr_score(df=data.frame(as.integer(50), 0), coeff=coeff, RA=1/2)
llr_score(df=data.frame(as.integer(50), 1), coeff=coeff, RA=1/2)




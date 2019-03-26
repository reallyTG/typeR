library(UncertainInterval)


### Name: nomogram
### Title: Fagan's nomogram to show the relationships between the prior
###   probability, the likelihood ratios, sensitivity and specificity, and
###   the posterior probability.
### Aliases: nomogram

### ** Examples

# Show calculated results (first 3 times about the same)
(nomogram(prob.pre.test = .10, probs.post.test=c(pos=.70, neg=.001)))
(nomogram(prob.pre.test = .10, SeSp=c(Se=0.991416309, Sp=0.952789700)))
(nomogram(prob.pre.test = .10, LR=c(pos=21, neg=0.0090090091)))
(nomogram(prob.pre.test = .10, SeSp=c(Se=0.99, Sp=0.95)))
# plot only
nomogram(prob.pre.test = .10, LR=c(pos=21, neg=0.0090090091))
# plot and display precise results
(nomogram(prob.pre.test = .10, probs.post.test=c(pos=.70, neg=.001)))

# check the influence of different values of prevalence
i=1
out=matrix(0,nrow = 9, ncol= 7)
for (prev in (seq(.1, .9, by=.1))) {
  out[i,]=nomogram(prob.pre.test=prev, probs.post.test=c(.95, .05), plot=FALSE)
  i=i+1
}
colnames(out) = names(nomogram(prob.pre.test=prev, probs.post.test=c(.95, .05), plot=FALSE))
out





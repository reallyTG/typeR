library(TeachBayes)


### Name: prior_post_plot
### Title: Graphs prior and posterior probabilities
### Aliases: prior_post_plot

### ** Examples

df <- data.frame(p=c(.1, .3, .5, .7, .9),
                 Prior=rep(1/5, 5))
y <- 5
n <- 10
df$Likelihood <- dbinom(y, prob=df$p, size=n)
df <- bayesian_crank(df)
prior_post_plot(df, "Proportion")




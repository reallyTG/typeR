library(hesim)


### Name: icea
### Title: Individualized cost-effectiveness analysis
### Aliases: icea icea_pw

### ** Examples

# simulation output
nsims <- 100
sim <- data.frame(sim = rep(seq(nsims), 4),
               c = c(rlnorm(nsims, 5, .1), rlnorm(nsims, 5, .1),
                      rlnorm(nsims, 11, .1), rlnorm(nsims, 11, .1)),
               e = c(rnorm(nsims, 8, .2), rnorm(nsims, 8.5, .1),
                     rnorm(nsims, 11, .6), rnorm(nsims, 11.5, .6)),
               strategy = rep(paste0("Strategy ", seq(1, 2)),
                             each = nsims * 2),
               grp = rep(rep(c("Group 1", "Group 2"),
                             each = nsims), 2)
)

# icea
icea.dt <- icea(sim, k = seq(0, 200000, 500), sim = "sim", strategy = "strategy",
 grp = "grp", e = "e", c = "c")
names(icea.dt)
# the probability that each strategy is the most cost-effective 
# in each group with a willingness to pay of 20,000
library("data.table")
icea.dt$mce[k == 20000]

# icea_pw
icea.pw.dt <-  icea_pw(sim,  k = seq(0, 200000, 500), comparator = "Strategy 1",
                      sim = "sim", strategy = "strategy", e = "e", c = "c")
names(icea.pw.dt)
# cost-effectiveness acceptability curve
library("ggplot2")
ggplot2::ggplot(icea.pw.dt$ceac[k < 50000], aes_string(x = "k", y = "prob")) +
 geom_line() + facet_wrap(~grp) + xlab("Willingess to pay") +
 ylab("Probability Strategy 2 is more cost-effective than Strategy 1") +
 theme(legend.position = "bottom") 




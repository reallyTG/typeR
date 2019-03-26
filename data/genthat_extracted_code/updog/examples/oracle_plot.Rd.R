library(updog)


### Name: oracle_plot
### Title: Construct an oracle plot from the output of 'oracle_joint'.
### Aliases: oracle_plot

### ** Examples

ploidy <- 6
dist <- stats::dbinom(0:ploidy, ploidy, 0.75)
jd <- oracle_joint(n = 100, ploidy = ploidy, seq = 0.001,
                   bias = 0.7, od = 0.01, dist = dist)
pl <- oracle_plot(jd = jd)
print(pl)





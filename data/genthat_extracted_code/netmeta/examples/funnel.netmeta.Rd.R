library(netmeta)


### Name: funnel.netmeta
### Title: 'Comparison-adjusted' funnel plot
### Aliases: funnel.netmeta
### Keywords: plot Funnel plot

### ** Examples

data(Senn2013)
net1 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data = Senn2013, sm = "MD")

#
# 'Comparison-adjusted' funnel plot not created as argument 'order' is
# missing
#
funnel(net1)

#
# (Non-sensical) alphabetic order of treatments with placebo as last
# treatment
#
ord <- c("a", "b", "me", "mi", "pi", "r", "si", "su", "v", "pl")
funnel(net1, order = ord)

#
# Add results for tests of funnel plot asymmetry and use different
# plotting symbols and colours
#
funnel(net1, order = ord,
       pch = rep(c(15:18, 1), 3), col = 1:3,
       linreg = TRUE, rank = TRUE, mm = TRUE, digits.pval = 2)

#
# Same results for tests of funnel plot asymmetry using reversed order
# of treatments
#
funnel(net1, order = rev(ord),
       pch = rep(c(15:18, 1), 3), col = 1:3,
       linreg = TRUE, rank = TRUE, mm = TRUE, digits.pval = 2)

#
# Calculate tests for funnel plot asymmetry
#
f1 <- funnel(net1, order = ord,
             pch = rep(c(15:18, 1), 3), col = 1:3,
             linreg = TRUE, rank = TRUE, mm = TRUE)
#
metabias(metagen(TE.adj, seTE, data = f1))
metabias(metagen(TE.adj, seTE, data = f1), method = "rank")
metabias(metagen(TE.adj, seTE, data = f1), method = "mm")




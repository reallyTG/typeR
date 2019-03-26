library(RND)


### Name: dmln
### Title: Density of Mixture Lognormal
### Aliases: dmln

### ** Examples


#
# A bimodal risk neutral density!
#

mln.alpha.1   = 0.4
mln.meanlog.1 = 6.3
mln.meanlog.2 = 6.5
mln.sdlog.1   = 0.08
mln.sdlog.2   = 0.06

k  = 300:900
dx = dmln(x = k, alpha.1 = mln.alpha.1, meanlog.1 = mln.meanlog.1, 
         meanlog.2 = mln.meanlog.2, 
         sdlog.1 = mln.sdlog.1, sdlog.2 = mln.sdlog.2)
plot(dx ~ k, type="l")




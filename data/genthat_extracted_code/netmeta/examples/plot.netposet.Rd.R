library(netmeta)


### Name: plot.netposet
### Title: Scatter plot or biplot showing partially order of treatment
###   ranks
### Aliases: plot.netposet
### Keywords: Scatter plot of partially ordered rankings Biplot of
###   partially ordered rankings Partial order of rankings (poset) plot

### ** Examples

# Use depression dataset
#
data(Linde2015)
#
# Define order of treatments
#
trts <- c("TCA", "SSRI", "SNRI", "NRI",
          "Low-dose SARI", "NaSSa", "rMAO-A", "Hypericum",
          "Placebo")
#
# Outcome labels
#
outcomes <- c("Early response", "Early remission")
#
# (1) Early response
#
p1 <- pairwise(treat = list(treatment1, treatment2, treatment3),
               event = list(resp1, resp2, resp3),
               n = list(n1, n2, n3),
               studlab = id, data = Linde2015, sm = "OR")
#
net1 <- netmeta(p1, comb.fixed = FALSE,
                seq = trts, ref = "Placebo")
#
# (2) Early remission
#
p2 <- pairwise(treat = list(treatment1, treatment2, treatment3),
               event = list(remi1, remi2, remi3),
               n = list(n1, n2, n3),
               studlab = id, data = Linde2015, sm = "OR")
#
net2 <- netmeta(p2, comb.fixed = FALSE,
                seq = trts, ref = "Placebo")
#
# Partial order of treatment rankings
#
po2 <- netposet(netrank(net1, small.values = "bad"),
                netrank(net2, small.values = "bad"),
                outcomes = outcomes)
#
# Scatter plot
#
plot(po2)

## Not run: 
##D #
##D # Same scatter plot as only two outcomes considered in netposet()
##D #
##D plot(po2, "biplot")
##D 
##D #
##D # Consider three outcomes
##D #
##D #
##D # Outcome labels
##D #
##D outcomes <- c("Early response", "Early remission", "Lost to follow-up")
##D #
##D # (3) Loss to follow-up
##D #
##D p3 <- pairwise(treat = list(treatment1, treatment2, treatment3),
##D                event = list(loss1, loss2, loss3),
##D                n = list(n1, n2, n3),
##D                studlab = id, data = Linde2015, sm = "OR")
##D #
##D net3 <- netmeta(p3, comb.fixed = FALSE,
##D                 seq = trts, ref = "Placebo")
##D #
##D # Partial order of treatment rankings (with three outcomes) 
##D #
##D po3 <- netposet(netrank(net1, small.values = "bad"),
##D                 netrank(net2, small.values = "bad"),
##D                 netrank(net3, small.values = "good"),
##D                 outcomes = outcomes)
##D #
##D # Hasse diagram
##D #
##D hasse(po3)
##D #
##D # Scatter plot
##D #
##D plot(po3)
##D #
##D # Biplot (reverse limits of y-axis as biplot is upside down)
##D #
##D plot(po3, "bi", xlim = c(-1, 1.7), ylim = c(2.5, -2.5))
## End(Not run)




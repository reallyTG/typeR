library(netmeta)


### Name: hasse
### Title: Hasse diagram
### Aliases: hasse
### Keywords: Hasse diagram plot

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
po <- netposet(netrank(net1, small.values = "bad"),
               netrank(net2, small.values = "bad"),
               outcomes = outcomes)
#
# Hasse diagram
#
hasse(po)




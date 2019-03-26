library(netmeta)


### Name: netposet
### Title: Partial order of treatments in network meta-analysis
### Aliases: netposet print.netposet
### Keywords: Partial order of rankings (poset)

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
# Partial order of treatment rankings (two outcomes)
#
po <- netposet(netrank(net1, small.values = "bad"),
               netrank(net2, small.values = "bad"),
               outcomes = outcomes)
#
# Hasse diagram
#
hasse(po)


## Not run: 
##D #
##D # Outcome labels
##D #
##D outcomes <- c("Early response", "Early remission",
##D               "Lost to follow-up", "Lost to follow-up due to AEs",
##D               "Adverse events (AEs)")
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
##D # (4) Loss to follow-up due to adverse events
##D #
##D p4 <- pairwise(treat = list(treatment1, treatment2, treatment3),
##D                event = list(loss.ae1, loss.ae2, loss.ae3),
##D                n = list(n1, n2, n3),
##D                studlab = id, data = subset(Linde2015, id != 55),
##D                sm = "OR")
##D #
##D net4 <- netmeta(p4, comb.fixed = FALSE,
##D                 seq = trts, ref = "Placebo")
##D #
##D # (5) Adverse events
##D #
##D p5 <- pairwise(treat = list(treatment1, treatment2, treatment3),
##D                event = list(ae1, ae2, ae3),
##D                n = list(n1, n2, n3),
##D                studlab = id, data = Linde2015, sm = "OR")
##D #
##D net5 <- netmeta(p5, comb.fixed = FALSE,
##D                 seq = trts, ref = "Placebo")
##D #
##D # Partial order of treatment rankings (all five outcomes)
##D #
##D po.ranks <- netposet(netrank(net1, small.values = "bad"),
##D                      netrank(net2, small.values = "bad"),
##D                      netrank(net3, small.values = "good"),
##D                      netrank(net4, small.values = "good"),
##D                      netrank(net5, small.values = "good"),
##D                      outcomes = outcomes)
##D #
##D # Same result
##D #
##D po.nets <- netposet(net1, net2, net3, net4, net5,
##D                     small.values = c("bad", "bad", "good", "good", "good"),
##D                     outcomes = outcomes)
##D #
##D all.equal(po.ranks, po.nets)
##D #
##D # Print matrix with P-scores (random effects model)
##D #
##D po.nets$P.random
##D #
##D # Hasse diagram for all outcomes (random effects model)
##D #
##D hasse(po.ranks)
##D #
##D # Hasse diagram for outcomes early response and early remission
##D #
##D po12 <- netposet(netrank(net1, small.values = "bad"),
##D                  netrank(net2, small.values = "bad"),
##D                  outcomes = outcomes[1:2])
##D hasse(po12)
##D #
##D # Scatter plot
##D #
##D oldpar <- par(pty = "s")
##D plot(po12)
##D par(oldpar)
## End(Not run)


# Example using ranking matrix with P-scores
#
# Ribassin-Majed L, Marguet S, Lee A.W., et al. (2017):
# What is the best treatment of locally advanced nasopharyngeal
# carcinoma? An individual patient data network meta-analysis.
# Journal of Clinical Oncology, 35, 498-505
#
outcomes <- c("OS", "PFS", "LC", "DC")
treatments <- c("RT", "IC-RT", "IC-CRT", "CRT",
                "CRT-AC", "RT-AC", "IC-RT-AC")
#
# P-scores (from Table 1)
#
pscore.os  <- c(15, 33, 63, 70, 96, 28, 45) / 100
pscore.pfs <- c( 4, 46, 79, 52, 94, 36, 39) / 100
pscore.lc  <- c( 9, 27, 47, 37, 82, 58, 90) / 100
pscore.dc  <- c(16, 76, 95, 48, 72, 32, 10) / 100
#
pscore.matrix <- data.frame(pscore.os, pscore.pfs, pscore.lc, pscore.dc)
rownames(pscore.matrix) <- treatments
colnames(pscore.matrix) <- outcomes
pscore.matrix
#
po <- netposet(pscore.matrix)
po12 <- netposet(pscore.matrix[, 1:2])
po
po12
#
hasse(po)
hasse(po12)
#
oldpar <- par(pty = "s")
plot(po12)
par(oldpar)




library(netmeta)


### Name: netmatrix
### Title: Create a matrix with additional information for pairwise
###   comparisons
### Aliases: netmatrix

### ** Examples

data(smokingcessation)

#
# Add variable with (fictious) risk of bias values
# with 1 = "low risk" and 2 = "high risk"
#
smokingcessation$rob <- rep(1:2, 12)

p1 <- pairwise(list(treat1, treat2, treat3),
               event=list(event1, event2, event3),
               n=list(n1, n2, n3),
               data=smokingcessation,
               sm="OR")

net1 <- netmeta(p1, comb.fixed = FALSE, ref = "A")

# Generate network graph with information on risk of bias
#
col.rob <- netmatrix(net1, rob, ties.method = "last",
                     levels = 1:2,
                     labels = c("green", "yellow"))
#
netgraph(net1, col = col.rob,
         plastic = FALSE, thickness = "number.of.studies", multi = FALSE)

n.trts <- net1$n.trts
labs <- paste(net1$trts, " (n=", n.trts, ")", sep = "")
#
netgraph(net1, col = col.rob,
         plastic = FALSE, thickness = "number.of.studies", multi = FALSE,
         points = TRUE, col.points = "blue",
         cex.points = 6 * sqrt(n.trts / max(n.trts)),
         labels = labs)




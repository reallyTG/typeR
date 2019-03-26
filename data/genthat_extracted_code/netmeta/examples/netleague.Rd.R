library(netmeta)


### Name: netleague
### Title: Create and print league table for network meta-analysis results
### Aliases: netleague print.netleague

### ** Examples

# Network meta-analysis of count mortality statistics
#
data(Woods2010)

p0 <- pairwise(treatment, event = r, n = N,
               studlab = author, data = Woods2010, sm = "OR")
net0 <- netmeta(p0)

oldopts <- options(width = 100)

# League table for fixed and random effects model with
# - network estimates in lower triangle
# - direct estimates in upper triangle
#
netleague(net0, digits = 2, bracket = "(", separator = " - ")

# League table for fixed effects model
#
netleague(net0, comb.random = FALSE, digits = 2)

# Change order of treatments according to treatment ranking
# (random effects model)
#
netleague(net0, comb.fixed = FALSE, digits = 2,
          seq = netrank(net0))
#
print(netrank(net0), comb.fixed = FALSE)

## Not run: 
##D # Create a CSV file with league table for random effects model
##D #
##D league0 <- netleague(net0, digits = 2, bracket = "(", separator = " to ")
##D #
##D write.table(league0$random, file = "league0-random.csv",
##D             row.names = FALSE, col.names = FALSE,
##D             sep = ",")
##D #
##D # Create Excel files with league tables (using R package WriteXLS)
##D #
##D library(WriteXLS)
##D #
##D # League table from random effects model
##D #
##D WriteXLS(league0$random, ExcelFileName = "league0-random.xls",
##D          SheetNames = "leaguetable (random)", col.names = FALSE)
##D #
##D # League tables from fixed and random effects models
##D #
##D WriteXLS(list(league0$fixed, league0$random),
##D          ExcelFileName = "league0-both.xls",
##D          SheetNames = c("leaguetable (fixed)", "leaguetable (random)"),
##D          col.names = FALSE)
## End(Not run)

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

options(width = 200)
netleague(net1, digits = 2)

netleague(net1, digits = 2, ci = FALSE)
netleague(net2, digits = 2, ci = FALSE)

# League table for two outcomes with
# - network estimates of first outcome in lower triangle
# - network estimates of second outcome in upper triangle
#
netleague(net1, net2, digits = 2, ci = FALSE)

netleague(net1, net2, seq = netrank(net1, small = "bad"), ci = FALSE)
netleague(net1, net2, seq = netrank(net2, small = "bad"), ci = FALSE)

print(netrank(net1, small = "bad"))
print(netrank(net2, small = "bad"))


# Report results for network meta-analysis twice
#
netleague(net1, net1, seq = netrank(net1, small = "bad"), ci = FALSE,
          backtransf = FALSE)
netleague(net1, net1, seq = netrank(net1, small = "bad"), ci = FALSE,
          backtransf = FALSE, direct = TRUE)

options(oldopts)


## Not run: 
##D # Generate a partial order of treatment rankings 
##D #
##D np <- netposet(net1, net2, outcomes = outcomes, small.values = rep("bad",2))
##D hasse(np)
##D plot(np)
## End(Not run)




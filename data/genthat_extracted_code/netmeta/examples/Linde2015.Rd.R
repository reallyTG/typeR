library(netmeta)


### Name: Linde2015
### Title: Network meta-analysis of treatments for depression
### Aliases: Linde2015
### Keywords: datasets

### ** Examples

data(Linde2015)

# Transform data from arm-based format to contrast-based format
# Outcome: early response
p1 <- pairwise(list(treatment1, treatment2, treatment3),
               event = list(resp1, resp2, resp3),
	       n = list(n1, n2, n3),
               studlab = id, data = Linde2015, sm = "OR")

# Define order of treatments
trts <- c("TCA", "SSRI", "SNRI", "NRI",
          "Low-dose SARI", "NaSSa", "rMAO-A", "Hypericum",
          "Placebo")

# Conduct random effects network meta-analysis
net1 <- netmeta(p1, comb.fixed = FALSE,
                reference = "Placebo",
		seq = trts)
print(summary(net1), digits = 2)




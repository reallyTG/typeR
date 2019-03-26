library(netmeta)


### Name: Woods2010
### Title: Count statistics of survival data
### Aliases: Woods2010
### Keywords: datasets

### ** Examples

data(Woods2010)

# Transform data from long arm-based format to contrast-based format
# Argument 'sm' has to be used for odds ratio as summary measure; by
# default the risk ratio is used in the metabin function called
# internally.
p1 <- pairwise(treatment, event = r, n = N,
               studlab = author, data = Woods2010, sm = "OR")
p1

# Conduct network meta-analysis
net1 <- netmeta(p1)
net1

## Not run: 
##D # Show forest plot
##D forest(net1, ref = "Placebo", drop = TRUE,
##D        leftlabs = "Contrast to Placebo")
## End(Not run)




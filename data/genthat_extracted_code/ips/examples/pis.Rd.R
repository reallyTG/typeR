library(ips)


### Name: pis
### Title: Number of Potentially-Informative Sites
### Aliases: pis

### ** Examples

# example data:
# -------------
data(ips.16S)	

# number of potentially-informative sites:
# ----------------------------------------
pis(ips.16S, what = "abs")
	
# proportion of potentially-informative sites:
# --------------------------------------------
pis(ips.16S, what = "frac")

# indeces of potentially-informative sites:
# --------------------------------------------
pis(ips.16S, what = "ind")




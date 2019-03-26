library(plm)


### Name: pvar
### Title: Check for Cross-Sectional and Time Variation
### Aliases: pvar pvar.data.frame pvar.pdata.frame pvar.matrix print.pvar
### Keywords: attribute

### ** Examples


# Gasoline contains two variables which are individual and time indexes
# and are the first two variables
data("Gasoline", package = "plm")
pvar(Gasoline)

# Hedonic is an unbalanced panel, townid is the individual index;
# the drop.index argument is passed to pdata.frame
data("Hedonic", package = "plm")
pvar(Hedonic, "townid", drop.index = TRUE)

# same using pdata.frame
Hed <- pdata.frame(Hedonic, "townid", drop.index = TRUE)
pvar(Hed)

# Gasoline with pvar's matrix interface
Gasoline_mat <- as.matrix(Gasoline)
pvar(Gasoline_mat)
pvar(Gasoline_mat, index=c("country", "year"))




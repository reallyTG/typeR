## ----input, fig.width=7, fig.height=5, warning = FALSE, cache = TRUE-----
# load packages
library(MTA)
library(cartography)
library(sp)
library(ineq)
library(reshape2)

# load dataset
data("GrandParisMetropole", package = "MTA")
# set row names to communes names
row.names(com) <- com$LIBCOM


library(SpATS)


### Name: plot.SpATS
### Title: Default SpATS plotting
### Aliases: plot.SpATS

### ** Examples

library(SpATS)
data(wheatdata)
wheatdata$R <- as.factor(wheatdata$row)
wheatdata$C <- as.factor(wheatdata$col)

m0 <- SpATS(response = "yield", spatial = ~ SAP(col, row, nseg = c(10,20), degree = 3, pord = 2), 
 genotype = "geno", fixed = ~ colcode + rowcode, random = ~ R + C, data = wheatdata, 
 control =  list(tolerance = 1e-03))

# Default plotting
plot(m0)
# Annotated
plot(m0, annotated = TRUE, main = "Wheat data (Gilmour et al., 1997)")




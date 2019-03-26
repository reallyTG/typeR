library(SetMethods)


### Name: cluster.diagnostics
### Title: Diagnostic tool for clustered data.
### Aliases: cluster.diagnostics
### Keywords: QCA

### ** Examples

# Import your clustered data in the long format. 
# For example:

data(SCHLF)

# Get pooled, within, and between consistencies and coverages 
# for STOCK as necessary for EXPORT:


cluster.diagnostics(SCHLF$STOCK, SCHLF$EXPORT, unit = SCHLF$COUNTRY, 
                    cluster = SCHLF$YEAR, necessity= TRUE)





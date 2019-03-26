library(SSRA)


### Name: print.tssa
### Title: Semantric Structure Analysis Print
### Aliases: print.tssa

### ** Examples

# Example data based on Takeya (1991)

# Takeya Semantic Structure Analysis
# ordering assesed according to the ordering coefficient
exdat.tssa <- TSSA(exdat, m = 5, output = FALSE)
print(exdat.tssa)

# Takeya Semantic Structure Analysis including statistical testing
# ordering assesed according to the ordering coefficient and statistical significance
exdat.tssa <- TSSA(exdat, m = 5, sig = TRUE, output = FALSE)
print(exdat.tssa)




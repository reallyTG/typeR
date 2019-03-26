library(SSRA)


### Name: seqtable
### Title: Sequential Relation Table
### Aliases: seqtable

### ** Examples

# Example data based on Takeya (1991)

# Takeya Semantic Structure Analysis
# ordering assesed according to the correlation coefficient and mean difference
exdat.tssa <- TSSA(exdat, m = 5, output = FALSE)
seqtable(exdat.tssa)

# Sakai Sequential Relation Analysis
# ordering assesed according to the correlation coefficient and mean difference
exdat.ssra <- SSRA(exdat, output = FALSE)
seqtable(exdat.ssra)




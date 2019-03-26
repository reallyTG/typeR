library(SSRA)


### Name: summary.seqtable
### Title: Sequential Relationship Table Summary
### Aliases: summary.seqtable

### ** Examples

# Example data based on Takeya (1991)

# Sakai Sequential Relation Analysis
# ordering assesed according to the correlation coefficient and mean difference
exdat.ssra <- SSRA(exdat, output = FALSE)
exdat.seqtab<- seqtable(exdat.ssra, output = FALSE)
summary(exdat.seqtab)




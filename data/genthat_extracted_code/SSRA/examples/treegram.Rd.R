library(SSRA)


### Name: treegram
### Title: Treegram
### Aliases: treegram

### ** Examples

# Example data based on Takeya (1991)

# Sakai Sequential Relation Analysis
# ordering assesed according to the correlation coefficient and mean difference
exdat.ssra <- SSRA(exdat, output = FALSE)
exdat.seqtab <- seqtable(exdat.ssra, output = FALSE)
treegram(exdat.seqtab)

# Select items to be plotted
exdat.ssra <- SSRA(exdat, output = FALSE)
exdat.seqtab <- seqtable(exdat.ssra, output = FALSE)
treegram(exdat.seqtab, select = c("Item2", "Item3", "Item4"))

# Define position for each item on the x-axis
exdat.ssra <- SSRA(exdat, output = FALSE)
exdat.seqtab <- seqtable(exdat.ssra, output = FALSE)
treegram(exdat.seqtab, pos = c(Item5 = 1, Item4 = 3,
                               Item3 = 5, Item2 = 2, Item1 = 4))

# Change colors for each path of an item
exdat.ssra <- SSRA(exdat, output = FALSE)
exdat.seqtab <- seqtable(exdat.ssra, output = FALSE)
treegram(exdat.seqtab,
         col = c(Item5 = "red3", Item4 = "blue3",
                 Item3 = "gray99", Item2 = "darkgreen", Item1 = "darkorange2"))




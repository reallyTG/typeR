library(OutliersO3)


### Name: O3plotColours
### Title: Set colours for O3 plots
### Aliases: O3plotColours

### ** Examples

c1 <- O3prep(stackloss, k1=2, method=c("HDo", "BAC"), tolHDo=0.025, tolBAC=0.01)
c2 <- O3plotM(c1)
c2$gO3
col1 <- O3plotColours(colours=c("khaki", "yellow", "red", "darkseagreen", "gold1",
"red", "slategray1", "slategray2", "slategray3", "slategray4", "orange", "red"))
c3 <- O3plotM(c1, O3control=col1)
c3$gO3




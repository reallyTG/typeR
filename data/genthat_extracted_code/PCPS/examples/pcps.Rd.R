library(PCPS)


### Name: pcps
### Title: Principal Coordinates of Phylogenetic Structure
### Aliases: pcps print.pcps summary.pcps print.summarypcps plot.pcps
###   scores.pcps plot.pcps print.pcps print.summarypcps scores.pcps
###   summary.pcps
### Keywords: PCPS

### ** Examples


data(ADRS)
res<-pcps(ADRS$community, ADRS$phylo)
res
summary(res)
summary(res, choices = c(1, 2))$scores
plot(res, display = "text", groups = c(rep("Clade-A", 2), rep("Clade-B", 4)))





library(TropFishR)


### Name: lfqRestructure
### Title: Restructuring of length frequency data
### Aliases: lfqRestructure

### ** Examples

# data and plot of catch frequencies
data(synLFQ4)
plot(synLFQ4, Fname="catch")

# restructuring and calculation of ASP
synLFQ4 <- lfqRestructure(synLFQ4, MA=11)
synLFQ4$ASP

# plot of restructured scores and fit of soVBGF growth curves
plot(synLFQ4)
lfqFitCurves(synLFQ4,
 par=list(Linf=80, K=0.5, t_anchor=0.25, C=0.75, ts=0),
 draw=TRUE
)$fASP






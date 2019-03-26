library(geneplotter)


### Name: plotChr
### Title: Plot Smoothed Sense/Anti-sense of Specified Chromosomes
### Aliases: plotChr
### Keywords: hplot

### ** Examples

example(Makesense)

if (interactive())
  op <- par(ask=TRUE)

cols <- ifelse(expressionSet133a$cov1=="test 1", "red", "green")
plotChr("21", esetobj, cols)

# plot on log-scale:

plotChr("21", esetobj, cols, log=TRUE)

# genesymbol instead of probe names:

plotChr("21", esetobj, cols, log=TRUE, geneSymbols=TRUE)

# add vertical lines at genes of interest:

gs <- c("220372_at", "35776_at", "200943_at")
plotChr("21", esetobj, cols, log=TRUE, geneSymbols=FALSE, lines.at=gs)

# add vertical lines at genes of interest
# with specified colors:

gs <- c("220372_at", "35776_at", "200943_at")
cc <- c("blue", "cyan","magenta")
plotChr("21", esetobj, cols, log=TRUE, geneSymbols=FALSE, lines.at=gs,
lines.col=cc)
if (interactive())
  par(op)




library(haplo.stats)


### Name: plot.haplo.score
### Title: Plot Haplotype Frequencies versus Haplotype Score Statistics
### Aliases: plot.haplo.score

### ** Examples

  data(hla.demo)
  geno <- as.matrix(hla.demo[,c(17,18,21:24)])
  keep <- !apply(is.na(geno) | geno==0, 1, any)
  hla.demo <- hla.demo[keep,]
  geno <- geno[keep,]
  attach(hla.demo)
  label <- c("DQB","DRB","B")
 
# For quantitative, normally distributed trait:

  score.gaus <- haplo.score(resp, geno, locus.label=label, 
                            trait.type = "gaussian")

  plot.haplo.score(score.gaus)
  ## try: locator.haplo(1)




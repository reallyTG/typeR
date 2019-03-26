library(haplo.stats)


### Name: haplo.score
### Title: Score Statistics for Association of Traits with Haplotypes
### Aliases: haplo.score
### Keywords: scores

### ** Examples

  # establish all hla.demo data, 
  # remove genotypes with missing alleles just so haplo.score runs faster 
  # with missing values included, this example takes 2-4 minutes
  # FOR REGULAR USAGE, DO NOT DISCARD GENOTYPES WITH MISSING VALUES

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
  print(score.gaus)

# For ordinal trait:
  y.ord <- as.numeric(resp.cat)
  score.ord <- haplo.score(y.ord, geno, locus.label=label,
                           trait.type="ordinal")
  print(score.ord)

# For a  binary trait and simulations,
# limit simulations to 500 in score.sim.control, default is 20000
  y.bin <-ifelse(y.ord==1,1,0)
  score.bin.sim <- haplo.score(y.bin, geno, trait.type = "binomial",
                     locus.label=label, simulate=TRUE,
                     sim.control=score.sim.control(min.sim=200,max.sim=500))

  print(score.bin.sim)

# For a binary trait, adjusted for sex and age:

  x <- cbind(male, age)
  score.bin.adj <- haplo.score(y.bin, geno, trait.type = "binomial", 
                               locus.label=label, x.adj=x)
  print(score.bin.adj)




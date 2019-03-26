library(haplo.stats)


### Name: haplo.score.slide
### Title: Score Statistics for Association of Traits with Haplotypes
### Aliases: haplo.score.slide
### Keywords: scores

### ** Examples

  data(hla.demo)

# Continuous trait slide by 2 loci on all 11 loci, uncomment to run it.
# Takes > 20 minutes to run
#  geno.11 <- hla.demo[,-c(1:4)]
#  label.11 <- c("DPB","DPA","DMA","DMB","TAP1","TAP2","DQB","DQA","DRB","B","A")
#  slide.gaus <- haplo.score.slide(hla.demo$resp, geno.11, trait.type = "gaussian",
#                                  locus.label=label.11, n.slide=2)

#  print(slide.gaus)
#  plot(slide.gaus)

# Run shortened example on 9 loci 
# For an ordinal trait, slide by 3 loci, and simulate p-values:
#  geno.9 <- hla.demo[,-c(1:6,15,16)]
#  label.9 <- c("DPA","DMA","DMB","TAP1","DQB","DQA","DRB","B","A")

#  y.ord <- as.numeric(hla.demo$resp.cat)

# data is set up, to run, run these lines of code on the data that was
# set up in this example. It takes > 15 minutes to run
#  slide.ord.sim <-  haplo.score.slide(y.ord, geno.9, trait.type = "ordinal",
#                      n.slide=3, locus.label=label.9, simulate=TRUE,
#                      sim.control=score.sim.control(min.sim=200, max.sim=500))

  # note, results will vary due to simulations
#  print(slide.ord.sim)
#  plot(slide.ord.sim)
#  plot(slide.ord.sim, pval="global.sim")
#  plot(slide.ord.sim, pval="max.sim")




library(haplo.stats)


### Name: plot.haplo.score.slide
### Title: Plot a haplo.score.slide Object
### Aliases: plot.haplo.score.slide
### Keywords: scores

### ** Examples

# This example has a long run-time, therefore it is commented

#   data(hla.demo)
#   attach(hla.demo)
#   geno.11 <- hla.demo[,-c(1:4)]
#   label.11 <- c("DPB","DPA","DMA","DMB","TAP1","TAP2","DQB","DQA","DRB","B","A")

#For an ordinal trait, slide by 3 loci, and simulate p-values:
#   y.ord <- as.numeric(resp.cat)
#   slide.ord.sim <-  haplo.score.slide(y.ord, geno.11, trait.type = "ordinal",
#                              n.slide=3, locus.label=label.11, simulate=TRUE,
#                              sim.control=score.sim.control(min.sim=500))

#   print(slide.ord.sim)
#   plot(slide.ord.sim)
#   plot(slide.ord.sim, pval="global.sim", las=2, cex.axis=.8)
#   plot(slide.ord.sim, pval="max.sim", srt=90, cex.axis=.8)




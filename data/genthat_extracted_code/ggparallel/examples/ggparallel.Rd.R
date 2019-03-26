library(ggparallel)


### Name: ggparallel
### Title: Variations of parallel coordinate plots
### Aliases: ggparallel

### ** Examples

data(mtcars)

ggparallel(list("gear", "cyl"), data=mtcars)
ggparallel(list("gear", "cyl"), data=mtcars, method="hammock", ratio=0.25)

require(RColorBrewer)
require(ggplot2)
cols <- c(brewer.pal(4, "Reds")[-1], brewer.pal(4, "Blues")[-1])
ggparallel(list("gear", "cyl"), ratio=0.2, data=mtcars,
           method="hammock", text.angle=0) +
  scale_fill_manual(values=cols) + scale_colour_manual(values=cols) +
  theme_bw()

## combination of common angle plot and hammock adjustment:
ggparallel(list("gear", "cyl"), data=mtcars, method="adj.angle",
           ratio=2)

## compare with method='parset'
ggparallel(list("gear", "cyl"), data=mtcars, method='parset')

## flip plot and rotate text
ggparallel(list("gear", "cyl"), data=mtcars, text.angle=0) +
  coord_flip()

## change colour scheme
ggparallel(list("gear", "cyl"), data=mtcars, text.angle=0) +
  coord_flip() +
  scale_fill_brewer(palette="Set1") +
  scale_colour_brewer(palette="Set1")

## example with more than two variables:
titanic <- as.data.frame(Titanic)
ggparallel(names(titanic)[c(1,4,2,1)], order=0, titanic, weight="Freq") +
  scale_fill_brewer(palette="Paired", guide="none") +
  scale_colour_brewer(palette="Paired", guide="none")

## Not run: 
##D cols <- c(brewer.pal(5,"Blues")[-1], brewer.pal(3, "Oranges")[-1],
##D           brewer.pal(3, "Greens")[-1])
##D ggparallel(names(titanic)[c(1,4,2,1)], order=0, titanic, weight="Freq") +
##D   scale_fill_manual(values=cols, guide="none") +
##D   scale_colour_manual(values=cols, guide="none") + theme_bw()
##D 
##D ## hammock plot with same width lines
##D ggparallel(names(titanic)[c(1,4,2,3)], titanic, weight=1, asp=0.5,
##D            method="hammock", ratio=0.2, order=c(0,0)) +
##D theme( legend.position="none") +
##D scale_fill_brewer(palette="Paired") +
##D scale_colour_brewer(palette="Paired")
##D 
##D ## hammock plot with line widths adjusted by frequency
##D ggparallel(names(titanic)[c(1,4,2,3)], titanic, weight="Freq",
##D            asp=0.5, method="hammock", order=c(0,0), text.angle=0,
##D            width=0.45) +
##D   theme( legend.position="none")
##D 
##D 
##D ## biological examples: genes and pathways
##D data(genes)
##D cols <- c(rep("grey80", 24), brewer.pal("YlOrRd", n = 9))
##D genes$chrom <- factor(genes$chrom, levels=c(paste("chr", 1:22, sep=""), "chrX", "chrY"))
##D ggparallel(list("path", "chrom"), text.offset=c(0.03, 0,-0.03),
##D            data = genes,  width=0.1, order=c(1,0), text.angle=0,
##D            color="white",
##D    factorlevels =  c(sapply(unique(genes$chrom), as.character),
##D      unique(genes$path))) +
##D    scale_fill_manual(values = cols, guide="none") +
##D    scale_colour_manual(values = cols, guide="none") +
##D    coord_flip()
## End(Not run)

data(Titanic)
titanic <- as.data.frame(Titanic)

titanic$SexSurvived <- with(titanic, interaction(Sex, Survived))
titanic$SexClassSurvived <- with(titanic, interaction(Sex,Class, Survived))

ggparallel(vars=list("Survived", "SexSurvived", "SexClassSurvived"), weight="Freq", data=titanic) +
  theme(legend.position="none") +
  scale_fill_manual(values = rep(c("Orange", "Steelblue"), 14)) +
  scale_colour_manual(values = rep(c("Orange", "Steelblue"), 14))




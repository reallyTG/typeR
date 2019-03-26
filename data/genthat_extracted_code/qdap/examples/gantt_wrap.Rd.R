library(qdap)


### Name: gantt_wrap
### Title: Gantt Plot
### Aliases: gantt_wrap
### Keywords: Gantt

### ** Examples

## Not run: 
##D dat <- gantt(mraja1$dialogue, list(mraja1$fam.aff, mraja1$sex),
##D     units = "sentences", col.sep = "_")
##D htruncdf(dat)
##D gantt_wrap(dat, "fam.aff_sex", title = "Gantt Plot")
##D dat$codes <- sample(LETTERS[1:3], nrow(dat), TRUE)
##D gantt_wrap(dat, "fam.aff_sex", fill.var = "codes",
##D     legend.position = "bottom")
##D 
##D dat2 <- with(rajSPLIT, gantt_rep(act, dialogue,
##D     list(fam.aff, sex), units = "words", col.sep = "_"))
##D htruncdf(dat2)
##D x <- gantt_wrap(dat2, "fam.aff_sex", facet.vars = "act",
##D     title = "Repeated Measures Gantt Plot")
##D 
##D library(ggplot2); library(scales); library(RColorBrewer)
##D x + scale_color_manual(values=rep("black",
##D     length(levels(dat2$fam.aff_sex))))
## End(Not run)




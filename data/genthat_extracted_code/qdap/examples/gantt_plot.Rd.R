library(qdap)


### Name: gantt_plot
### Title: Gantt Plot
### Aliases: gantt_plot
### Keywords: Gantt

### ** Examples

## Not run: 
##D with(rajSPLIT, gantt_plot(text.var = dialogue,
##D     grouping.var = person, size=4))
##D 
##D with(rajSPLIT, gantt_plot(text.var = dialogue,
##D     grouping.var = list(fam.aff, sex), rm.var  = act,
##D     title = "Romeo and Juliet's dialogue"))
##D 
##D with(rajSPLIT, gantt_plot(dialogue, list(fam.aff, sex), act,
##D     transform=T))
##D 
##D rajSPLIT2 <- rajSPLIT
##D 
##D rajSPLIT2$newb <- as.factor(sample(LETTERS[1:2], nrow(rajSPLIT2),
##D     replace=TRUE))
##D 
##D z <- with(rajSPLIT2, gantt_plot(dialogue, list(fam.aff, sex),
##D     list(act, newb), size = 4))
##D 
##D library(ggplot2); library(scales); library(RColorBrewer); library(grid)
##D z + theme(panel.spacing = unit(1, "lines")) + scale_colour_grey()
##D z + scale_colour_brewer(palette="Dark2")
##D 
##D ## Fill Variable Example
##D dat <- rajSPLIT[rajSPLIT$act == 1, ]
##D dat$end_mark <- factor(end_mark(dat$dialogue))
##D 
##D with(dat, gantt_plot(text.var = dialogue, grouping.var = list(person, sex),
##D     fill.var=end_mark))
##D 
##D ## Repeated Measures with Fill Example
##D rajSPLIT$end_mark <- end_mark(rajSPLIT$dialogue)
##D 
##D with(rajSPLIT, gantt_plot(text.var = dialogue,
##D     grouping.var = list(fam.aff), rm.var  = list(act),
##D     fill.var=end_mark, title = "Romeo and Juliet's dialogue"))
##D 
##D ## Repeated Measures Sentence Type Example
##D with(rajSPLIT, gantt_plot(text.var = dialogue,
##D     grouping.var = list(fam.aff, sex), rm.var  = list(end_mark, act),
##D     title = "Romeo and Juliet's dialogue"))
##D 
##D ## Reset rajSPLIT
##D rajSPLIT <- qdap::rajSPLIT
##D 
##D ## Animate It
##D ##=================
##D ani_gantt <- with(mraja1, gantt_plot(dialogue, person))
##D 
##D library(animation)
##D loc <- reports::folder(animation_gantt)
##D 
##D ## Set up the plotting function
##D oopt <- animation::ani.options(interval = 0.1)
##D 
##D FUN <- function() {
##D     out <- Animate(ani_gantt)
##D     lapply(out, function(x) {
##D         print(x)
##D         animation::ani.pause()
##D     })
##D 
##D }
##D 
##D type <- if(.Platform$OS.type == "windows") shell else system
##D saveVideo(FUN(), video.name = "animation.avi", interval = 0.1, outdir = loc)
##D 
##D saveLatex(FUN(), autoplay = TRUE, loop = FALSE, latex.filename = "tester.tex", 
##D     caption = "animated dialogue", outdir = loc, ani.type = "pdf", 
##D     ani.dev = "pdf", ani.width = 5, ani.height = 5.5, interval = 0.1)
##D 
##D 
##D saveHTML(FUN(), autoplay = FALSE, loop = TRUE, verbose = FALSE, 
##D     ani.width=600, ani.height=280,
##D     outdir = file.path(loc, "new"), single.opts = 
##D     "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")
##D 
## End(Not run)




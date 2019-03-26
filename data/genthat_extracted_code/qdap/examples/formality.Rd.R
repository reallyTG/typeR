library(qdap)


### Name: formality
### Title: Formality Score
### Aliases: formality
### Keywords: explicit, formality, parts-of-speech, pos

### ** Examples

## Not run: 
##D with(DATA, formality(state, person))
##D (x1 <- with(DATA, formality(state, list(sex, adult))))
##D plot(x1)
##D plot(x1, short.names = FALSE)
##D 
##D scores(x1)
##D counts(x1)
##D proportions(x1)
##D preprocessed(x1)
##D 
##D plot(scores(x1))
##D plot(counts(x1))
##D plot(proportions(x1), high="darkgreen")
##D plot(preprocessed(x1))
##D 
##D data(rajPOS) #A data set consisting of a pos list object
##D x2 <- with(raj, formality(rajPOS, act))
##D plot(x2)
##D cumulative(x2)
##D x3 <- with(raj, formality(rajPOS, person))
##D plot(x3, bar.colors="Dark2")
##D plot(x3, bar.colors=c("Dark2", "Set1"))
##D x4 <- with(raj, formality(rajPOS, list(person, act)))
##D plot(x4, bar.colors=c("Dark2", "Set1"))
##D 
##D rajDEM <- key_merge(raj, raj.demographics) #merge demographics with transcript.
##D x5 <- with(rajDEM, formality(rajPOS, sex))
##D plot(x5, bar.colors="RdBu")
##D x6 <- with(rajDEM, formality(rajPOS, list(fam.aff, sex)))
##D plot(x6, bar.colors="RdBu")
##D x7 <- with(rajDEM, formality(rajPOS, list(died, fam.aff)))
##D plot(x7, bar.colors="RdBu",  point.cex=2, point.pch = 3)
##D x8 <- with(rajDEM, formality(rajPOS, list(died, sex)))
##D plot(x8, bar.colors="RdBu",  point.cex=2, point.pch = "|")
##D 
##D names(x8)
##D colsplit2df(x8$formality)
##D 
##D #pass an object from pos or pos_by
##D ltruncdf(with(raj, formality(x8 , list(act, person))), 6, 4)
##D 
##D #=============#
##D ## ANIMATION ##
##D #=============#
##D ## EXAMPLE 1
##D form_ani <- formality(DATA.SPLIT$state, DATA.SPLIT$person)
##D forma <- Animate(form_ani, contextual="white", formal="blue", 
##D     current.color = "yellow", current.speaker.color="grey70")
##D 
##D bgb <- vertex_apply(forma, label.color="grey80", size=20, color="grey40")
##D bgb <- edge_apply(bgb, label.color="yellow")
##D 
##D print(bgb, bg="black", net.legend.color ="white", pause=1)
##D 
##D ## EXAMPLE 2
##D form_ani2 <- formality(raj.act.1POS, mraja1spl$person)
##D forma2 <- Animate(form_ani2, contextual="white", formal="blue",
##D     current.color = "yellow", current.speaker.color="grey70")
##D 
##D bgb2 <- vertex_apply(forma2, label.color="grey80", size=17, color="grey40")
##D bgb2 <- edge_apply(bgb2, label.color="yellow")
##D print(bgb2, bg="black", pause=.75, net.legend.color = "white")
##D 
##D ## EXAMPLE 3 (bar plot)
##D Animate(form_ani2, as.network=FALSE)
##D 
##D #=====================#
##D ## Complex Animation ##
##D #=====================#
##D library(animation)
##D library(grid)
##D library(gridBase)
##D library(qdap)
##D library(reports)
##D library(igraph)
##D library(plotrix)
##D 
##D form_ani2 <- formality(raj.act.1POS, mraja1spl$person)
##D 
##D ## Set up the network version
##D form_net <- Animate(form_ani2, contextual="white", formal="blue",
##D     current.color = "yellow", current.speaker.color="grey70")
##D bgb <- vertex_apply(form_net, label.color="grey80", size=17, color="grey40")
##D bgb <- edge_apply(bgb, label.color="yellow")
##D 
##D 
##D ## Set up the bar version
##D form_bar <- Animate(form_ani2, as.network=FALSE)
##D 
##D ## Generate a folder
##D loc <- reports::folder(animation_formality)
##D 
##D ## Set up the plotting function
##D oopt <- animation::ani.options(interval = 0.1)
##D 
##D 
##D FUN <- function(follow=FALSE, theseq = seq_along(bgb)) {
##D 
##D     Title <- "Animated Formality: Romeo and Juliet Act 1"
##D     Legend <- c(.2, -1, 1.5, -.95)
##D     Legend.cex <- 1
##D 
##D     lapply(theseq, function(i) {
##D         if (follow) {
##D             png(file=sprintf("%s/images/Rplot%s.png", loc, i),
##D                 width=650, height=725)
##D         }
##D         ## Set up the layout
##D         layout(matrix(c(rep(1, 9), rep(2, 4)), 13, 1, byrow = TRUE))
##D 
##D         ## Plot 1
##D         par(mar=c(2, 0, 2, 0), bg="black")
##D         #par(mar=c(2, 0, 2, 0))
##D         set.seed(22)
##D         plot.igraph(bgb[[i]], edge.curved=TRUE)
##D         graphics::mtext(Title, side=3, col="white")
##D         color.legend(Legend[1], Legend[2], Legend[3], Legend[4],
##D               c("Contextual", "Formal"), attributes(bgb)[["legend"]],
##D               cex = Legend.cex, col="white")
##D 
##D         ## Plot2
##D         plot.new()
##D         vps <- baseViewports()
##D 
##D         uns <- unit(c(-1.3,.5,-.75,.25), "cm")
##D         p <- form_bar[[i]] +
##D             theme(plot.margin = uns,
##D                 text=element_text(color="white"),
##D                 legend.text=element_text(color="white"),
##D                 legend.background = element_rect(fill = "black"),
##D                 plot.background = element_rect(fill = "black",
##D                     color="black"))
##D         print(p,vp = vpStack(vps$figure,vps$plot))
##D         animation::ani.pause()
##D 
##D         if (follow) {
##D             dev.off()
##D         }
##D     })
##D 
##D }
##D 
##D FUN()
##D 
##D ## Detect OS
##D type <- if(.Platform$OS.type == "windows") shell else system
##D 
##D saveHTML(FUN(, 1:20), autoplay = FALSE, loop = TRUE, verbose = FALSE,
##D     ani.height = 1000, ani.width=650,
##D     outdir = loc, single.opts =
##D     "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")
##D 
##D FUN(TRUE)
##D 
##D #==================#
##D ## Static Network ##
##D #==================#
##D (formdat <- with(sentSplit(DATA, 4), formality(state, person)))
##D m <- Network(formdat)
##D m
##D print(m, bg="grey97", vertex.color="grey75")
##D 
##D print(m, title="Formality Discourse Map", title.color="white", bg="black",
##D     legend.text.color="white", vertex.label.color = "grey70", 
##D     edge.label.color="yellow")
##D     
##D ## or use themes:
##D dev.off()
##D m + qtheme()
##D m + theme_nightheat
##D dev.off()
##D m + theme_nightheat(title="Formality Discourse Map", 
##D     vertex.label.color = "grey50")
##D     
##D #===============================#
##D ## Formality Over Time Example ##
##D #===============================#
##D formpres <- lapply(with( pres_debates2012, split(dialogue, time)), function(x) {
##D     formality(x)
##D })
##D formplots <- lapply(seq_along(formpres), function(i) {
##D     m <- plot(cumulative(formpres[[i]]))
##D     if (i != 2) m <- m + ylab("")
##D     if (i != 3) m <- m + xlab(NULL)
##D     m + ggtitle(paste("Debate", i))
##D })
##D 
##D library(grid)
##D library(gridExtra)
##D do.call(grid.arrange, formplots)
## End(Not run)




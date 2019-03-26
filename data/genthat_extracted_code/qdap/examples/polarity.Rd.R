library(qdap)


### Name: polarity
### Title: Polarity Score (Sentiment Analysis)
### Aliases: polarity
### Keywords: polarity sentiment,

### ** Examples

## Not run: 
##D with(DATA, polarity(state, list(sex, adult)))
##D (poldat <- with(sentSplit(DATA, 4), polarity(state, person)))
##D counts(poldat)
##D scores(poldat)
##D plot(poldat)
##D 
##D poldat2 <- with(mraja1spl, polarity(dialogue, 
##D     list(sex, fam.aff, died)))
##D colsplit2df(scores(poldat2))
##D plot(poldat2)
##D plot(scores(poldat2))
##D cumulative(poldat2)
##D 
##D poldat3 <- with(rajSPLIT, polarity(dialogue, person))
##D poldat3[["group"]][, "OL"] <- outlier_labeler(scores(poldat3)[, 
##D     "ave.polarity"])
##D poldat3[["all"]][, "OL"] <- outlier_labeler(counts(poldat3)[, 
##D     "polarity"])
##D htruncdf(scores(poldat3), 10)
##D htruncdf(counts(poldat3), 15, 8)
##D plot(poldat3)
##D plot(poldat3, nrow=4)
##D qheat(scores(poldat3)[, -7], high="red", order.b="ave.polarity")
##D 
##D ## Create researcher defined sentiment.frame
##D POLKEY <- sentiment_frame(positive.words, negative.words)
##D POLKEY
##D c("abrasive", "abrupt", "happy") %hl% POLKEY
##D 
##D # Augmenting the sentiment.frame
##D mycorpus <- c("Wow that's a raw move.", "His jokes are so corny")
##D counts(polarity(mycorpus))
##D 
##D POLKEY <- sentiment_frame(c(positive.words, "raw"), c(negative.words, "corny"))
##D counts(polarity(mycorpus, polarity.frame=POLKEY))
##D 
##D ## ANIMATION
##D #===========
##D (deb2 <- with(subset(pres_debates2012, time=="time 2"),
##D     polarity(dialogue, person)))
##D 
##D bg_black <- Animate(deb2, neutral="white", current.speaker.color="grey70")
##D print(bg_black, pause=.75)
##D 
##D bgb <- vertex_apply(bg_black, label.color="grey80", size=20, color="grey40")
##D bgb <- edge_apply(bgb, label.color="yellow")
##D print(bgb, bg="black", pause=.75)
##D 
##D ## Save it
##D library(animation)
##D library(igraph)
##D library(plotrix)
##D 
##D loc <- folder(animation_polarity)
##D 
##D ## Set up the plotting function
##D oopt <- animation::ani.options(interval = 0.1)
##D 
##D FUN <- function() {
##D     Title <- "Animated Polarity: 2012 Presidential Debate 2"
##D     Legend <- c(-1.1, -1.25, -.2, -1.2)
##D     Legend.cex <- 1
##D     lapply(seq_along(bgb), function(i) {
##D         par(mar=c(2, 0, 1, 0), bg="black")
##D         set.seed(10)
##D         plot.igraph(bgb[[i]], edge.curved=TRUE)
##D         mtext(Title, side=3, col="white")
##D         color.legend(Legend[1], Legend[2], Legend[3], Legend[4],
##D               c("Negative", "Neutral", "Positive"), attributes(bgb)[["legend"]],
##D               cex = Legend.cex, col="white")
##D         animation::ani.pause()
##D     })
##D }
##D 
##D FUN()
##D 
##D ## Detect OS
##D type <- if(.Platform$OS.type == "windows") shell else system
##D 
##D saveHTML(FUN(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
##D     ani.height = 500, ani.width=500,
##D     outdir = file.path(loc, "new"), single.opts =
##D     "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")
##D 
##D ## Detect OS
##D type <- if(.Platform$OS.type == "windows") shell else system
##D 
##D saveHTML(FUN(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
##D     ani.height = 1000, ani.width=650,
##D     outdir = loc, single.opts =
##D     "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")
##D     
##D  ## Animated corresponding text plot
##D  Animate(deb2, type="text")
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
##D library(gridExtra)
##D 
##D deb2dat <- subset(pres_debates2012, time=="time 2")
##D deb2dat[, "person"] <- factor(deb2dat[, "person"])
##D (deb2 <- with(deb2dat, polarity(dialogue, person)))
##D 
##D ## Set up the network version
##D bg_black <- Animate(deb2, neutral="white", current.speaker.color="grey70")
##D bgb <- vertex_apply(bg_black, label.color="grey80", size=30, label.size=22,
##D     color="grey40")
##D bgb <- edge_apply(bgb, label.color="yellow")
##D 
##D ## Set up the bar version
##D deb2_bar <- Animate(deb2, as.network=FALSE)
##D 
##D ## Generate a folder
##D loc2 <- folder(animation_polarity2)
##D 
##D ## Set up the plotting function
##D oopt <- animation::ani.options(interval = 0.1)
##D 
##D 
##D FUN2 <- function(follow=FALSE, theseq = seq_along(bgb)) {
##D 
##D     Title <- "Animated Polarity: 2012 Presidential Debate 2"
##D     Legend <- c(.2, -1.075, 1.5, -1.005)
##D     Legend.cex <- 1
##D 
##D     lapply(theseq, function(i) {
##D         if (follow) {
##D             png(file=sprintf("%s/images/Rplot%s.png", loc2, i), 
##D                 width=650, height=725)
##D         }
##D         ## Set up the layout
##D         layout(matrix(c(rep(1, 9), rep(2, 4)), 13, 1, byrow = TRUE))
##D 
##D         ## Plot 1
##D         par(mar=c(2, 0, 2, 0), bg="black")
##D         #par(mar=c(2, 0, 2, 0))
##D         set.seed(20)
##D         plot.igraph(bgb[[i]], edge.curved=TRUE)
##D         mtext(Title, side=3, col="white")
##D         color.legend(Legend[1], Legend[2], Legend[3], Legend[4],
##D               c("Negative", "Neutral", "Positive"), attributes(bgb)[["legend"]],
##D               cex = Legend.cex, col="white")
##D 
##D         ## Plot2
##D         plot.new()              
##D         vps <- baseViewports()
##D 
##D         uns <- unit(c(-1.3,.5,-.75,.25), "cm")
##D         p <- deb2_bar[[i]] + 
##D             theme(plot.margin = uns,
##D                 text=element_text(color="white"),
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
##D FUN2()
##D 
##D ## Detect OS
##D type <- if(.Platform$OS.type == "windows") shell else system
##D 
##D saveHTML(FUN2(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
##D     ani.height = 1000, ani.width=650,
##D     outdir = loc2, single.opts =
##D     "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")
##D 
##D FUN2(TRUE)
##D 
##D #=====================#
##D library(animation)
##D library(grid)
##D library(gridBase)
##D library(qdap)
##D library(reports)
##D library(igraph)
##D library(plotrix)
##D library(gplots)
##D 
##D deb2dat <- subset(pres_debates2012, time=="time 2")
##D deb2dat[, "person"] <- factor(deb2dat[, "person"])
##D (deb2 <- with(deb2dat, polarity(dialogue, person)))
##D 
##D ## Set up the network version
##D bg_black <- Animate(deb2, neutral="white", current.speaker.color="grey70")
##D bgb <- vertex_apply(bg_black, label.color="grey80", size=30, label.size=22,
##D     color="grey40")
##D bgb <- edge_apply(bgb, label.color="yellow")
##D 
##D ## Set up the bar version
##D deb2_bar <- Animate(deb2, as.network=FALSE)
##D 
##D ## Set up the line version
##D deb2_line <- plot(cumulative(deb2_bar))
##D 
##D ## Generate a folder
##D loc2b <- folder(animation_polarity2)
##D 
##D ## Set up the plotting function
##D oopt <- animation::ani.options(interval = 0.1)
##D 
##D FUN2 <- function(follow=FALSE, theseq = seq_along(bgb)) {
##D 
##D     Title <- "Animated Polarity: 2012 Presidential Debate 2"
##D     Legend <- c(.2, -1.075, 1.5, -1.005)
##D     Legend.cex <- 1
##D 
##D     lapply(theseq, function(i) {
##D         if (follow) {
##D             png(file=sprintf("%s/images/Rplot%s.png", loc2b, i),
##D                 width=650, height=725)
##D         }
##D         ## Set up the layout
##D         layout(matrix(c(rep(1, 9), rep(2, 4)), 13, 1, byrow = TRUE))
##D 
##D         ## Plot 1
##D         par(mar=c(2, 0, 2, 0), bg="black")
##D         #par(mar=c(2, 0, 2, 0))
##D         set.seed(20)
##D         plot.igraph(bgb[[i]], edge.curved=TRUE)
##D         mtext(Title, side=3, col="white")
##D         color.legend(Legend[1], Legend[2], Legend[3], Legend[4],
##D               c("Negative", "Neutral", "Positive"), attributes(bgb)[["legend"]],
##D               cex = Legend.cex, col="white")
##D 
##D         ## Plot2
##D         plot.new()
##D         vps <- baseViewports()
##D 
##D         uns <- unit(c(-1.3,.5,-.75,.25), "cm")
##D         p <- deb2_bar[[i]] +
##D             theme(plot.margin = uns,
##D                 text=element_text(color="white"),
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
##D FUN2()
##D 
##D ## Detect OS
##D type <- if(.Platform$OS.type == "windows") shell else system
##D 
##D saveHTML(FUN2(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
##D     ani.height = 1000, ani.width=650,
##D     outdir = loc2b, single.opts =
##D     "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")
##D 
##D FUN2(TRUE)
##D 
##D ## Increased complexity
##D ## --------------------
##D 
##D ## Helper function to cbind ggplots
##D cbinder <- function(x, y){
##D 
##D     uns_x <- unit(c(-1.3,.15,-.75,.25), "cm")
##D     uns_y <- unit(c(-1.3,.5,-.75,.15), "cm")
##D 
##D     x <- x + theme(plot.margin = uns_x,
##D         text=element_text(color="white"),
##D         plot.background = element_rect(fill = "black",
##D         color="black")
##D     )
##D 
##D     y <- y + theme(plot.margin = uns_y,
##D         text=element_text(color="white"),
##D         plot.background = element_rect(fill = "black", 
##D         color="black")
##D     )
##D 
##D     plots <- list(x, y)
##D     grobs <- list()
##D     heights <- list()
##D     
##D     for (i in 1:length(plots)){
##D         grobs[[i]] <- ggplotGrob(plots[[i]])
##D         heights[[i]] <- grobs[[i]]$heights[2:5]
##D     }
##D     
##D     maxheight <- do.call(grid::unit.pmax, heights)
##D     
##D     for (i in 1:length(grobs)){
##D          grobs[[i]]$heights[2:5] <- as.list(maxheight)
##D     }
##D     
##D     do.call("arrangeGrob", c(grobs, ncol = 2))
##D }
##D 
##D deb2_combo <- Map(cbinder, deb2_bar, deb2_line)
##D 
##D ## Generate a folder
##D loc3 <- folder(animation_polarity3)
##D 
##D 
##D FUN3 <- function(follow=FALSE, theseq = seq_along(bgb)) {
##D 
##D     Title <- "Animated Polarity: 2012 Presidential Debate 2"
##D     Legend <- c(.2, -1.075, 1.5, -1.005)
##D     Legend.cex <- 1
##D 
##D     lapply(theseq, function(i) {
##D         if (follow) {
##D             png(file=sprintf("%s/images/Rplot%s.png", loc3, i),
##D                 width=650, height=725)
##D         }
##D         ## Set up the layout
##D         layout(matrix(c(rep(1, 9), rep(2, 4)), 13, 1, byrow = TRUE))
##D 
##D         ## Plot 1
##D         par(mar=c(2, 0, 2, 0), bg="black")
##D         #par(mar=c(2, 0, 2, 0))
##D         set.seed(20)
##D         plot.igraph(bgb[[i]], edge.curved=TRUE)
##D         mtext(Title, side=3, col="white")
##D         color.legend(Legend[1], Legend[2], Legend[3], Legend[4],
##D               c("Negative", "Neutral", "Positive"), attributes(bgb)[["legend"]],
##D               cex = Legend.cex, col="white")
##D 
##D         ## Plot2
##D         plot.new()
##D         vps <- baseViewports()
##D         p <- deb2_combo[[i]]
##D         print(p,vp = vpStack(vps$figure,vps$plot))
##D         animation::ani.pause()
##D 
##D         if (follow) {
##D             dev.off()
##D         }
##D     })
##D }
##D 
##D FUN3()
##D 
##D type <- if(.Platform$OS.type == "windows") shell else system
##D 
##D saveHTML(FUN3(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
##D     ani.height = 1000, ani.width=650,
##D     outdir = loc3, single.opts =
##D     "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")
##D 
##D FUN3(TRUE)
##D 
##D ##-----------------------------##
##D ## Constraining between -1 & 1 ##
##D ##-----------------------------##
##D ## The old behavior of polarity constrained the output to be between -1 and 1
##D ## this can be replicated via the `constrain = TRUE` argument:
##D 
##D polarity("really hate anger")
##D polarity("really hate anger", constrain=TRUE)
##D 
##D #==================#
##D ## Static Network ##
##D #==================#
##D (poldat <- with(sentSplit(DATA, 4), polarity(state, person)))
##D m <- Network(poldat)
##D m
##D print(m, bg="grey97", vertex.color="grey75")
##D 
##D print(m, title="Polarity Discourse Map", title.color="white", bg="black",
##D     legend.text.color="white", vertex.label.color = "grey70", 
##D     edge.label.color="yellow")
##D     
##D ## or use themes:
##D dev.off()
##D m + qtheme()
##D m + theme_nightheat
##D dev.off()
##D m+ theme_nightheat(title="Polarity Discourse Map")
##D 
##D #===============================#
##D ## CUMULATIVE POLARITY EXAMPLE ##
##D #===============================#
##D #        Hedonometrics          #           
##D #===============================#
##D poldat4 <- with(rajSPLIT, polarity(dialogue, act, constrain = TRUE))
##D 
##D polcount <- na.omit(counts(poldat4)$polarity)
##D len <- length(polcount)
##D 
##D cummean <- function(x){cumsum(x)/seq_along(x)}
##D 
##D cumpolarity <- data.frame(cum_mean = cummean(polcount), Time=1:len)
##D 
##D ## Calculate background rectangles
##D ends <- cumsum(rle(counts(poldat4)$act)$lengths)
##D starts <- c(1, head(ends + 1, -1))
##D rects <- data.frame(xstart = starts, xend = ends + 1, 
##D     Act = c("I", "II", "III", "IV", "V"))
##D 
##D library(ggplot2)
##D ggplot() + theme_bw() +
##D     geom_rect(data = rects, aes(xmin = xstart, xmax = xend, 
##D         ymin = -Inf, ymax = Inf, fill = Act), alpha = 0.17) +
##D     geom_smooth(data = cumpolarity, aes(y=cum_mean, x = Time)) +
##D     geom_hline(y=mean(polcount), color="grey30", size=1, alpha=.3, linetype=2) + 
##D     annotate("text", x = mean(ends[1:2]), y = mean(polcount), color="grey30", 
##D         label = "Average Polarity", vjust = .3, size=3) +
##D     geom_line(data = cumpolarity, aes(y=cum_mean, x = Time), size=1) +
##D     ylab("Cumulative Average Polarity") + xlab("Duration") +
##D     scale_x_continuous(expand = c(0,0)) +
##D     geom_text(data=rects, aes(x=(xstart + xend)/2, y=-.04, 
##D         label=paste("Act", Act)), size=3) + 
##D     guides(fill=FALSE) +
##D     scale_fill_brewer(palette="Set1")
## End(Not run)




library(qdap)


### Name: lexical_classification
### Title: Lexical Classification Score
### Aliases: lexical_classification
### Keywords: content functional, lexical_classification, parts-of-speech,

### ** Examples

## Not run: 
##D lexical_classification("I did not like the dog.")
##D lexical_classification(DATA.SPLIT$state, DATA.SPLIT$person)
##D 
##D (out <- with(pres_debates2012, lexical_classification(dialogue, list(person, time))))
##D plot(out)
##D 
##D scores(out)
##D 
##D out2 <- preprocessed(out)
##D htruncdf(out2)
##D plot(out2)
##D 
##D plot(out[["content"]])
##D dev.new()
##D plot(out[["functional"]])
##D 
##D ## cloud of functional vs. content
##D ## Highlight Content Words
##D set.seed(10)
##D par(mar = c(0,0,0,0))
##D list(
##D         content = out[["content"]],
##D         functional = out[["functional"]]
##D     ) %>%
##D     list_df2df("type") %>%
##D     dplyr::mutate(colors = ifelse(type == "functional", "gray80", "blue")) %>%
##D     with(., wordcloud::wordcloud(
##D         word, 
##D         freq, 
##D         min.freq = 8, 
##D         random.order=FALSE,
##D         ordered.colors = TRUE,
##D         colors = colors
##D     )) 
##D mtext("2012 Presidential Debates:\nFunctional vs. Content Word Use", padj=1.25)
##D legend(
##D     .05, .12, bty = "n",
##D     legend = c("functional", "content"), 
##D     fill = c("gray80", "blue"),  
##D     cex = .7
##D )
##D 
##D ## Highlight Functional Words
##D set.seed(10)
##D par(mar = c(0,0,0,0))
##D list(
##D         content = out[["content"]],
##D         functional = out[["functional"]]
##D     ) %>%
##D     list_df2df("type") %>%
##D     dplyr::mutate(colors = ifelse(type == "functional", "red", "gray80")) %>%
##D     with(., wordcloud::wordcloud(
##D         word, 
##D         freq, 
##D         min.freq = 8, 
##D         random.order=FALSE,
##D         ordered.colors = TRUE,
##D         colors = colors
##D     )) 
##D mtext("2012 Presidential Debates:\nFunctional vs. Content Word Use", padj=1.25)
##D legend(
##D     .05, .12, bty = "n",
##D     legend = c("functional", "content"), 
##D     fill = c("red", "gray80"),  
##D     cex = .7
##D )
##D 
##D #=============#
##D ## ANIMATION ##
##D #=============#
##D ## EXAMPLE 1
##D lex_ani <- lexical_classification(DATA.SPLIT$state, DATA.SPLIT$person)
##D lexa <- Animate(lex_ani, content="white", functional="blue",
##D     current.color = "yellow", current.speaker.color="grey70")
##D 
##D bgb <- vertex_apply(lexa, label.color="grey80", size=20, color="grey40")
##D bgb <- edge_apply(bgb, label.color="yellow")
##D 
##D print(bgb, bg="black", net.legend.color ="white", pause=1)
##D 
##D ## EXAMPLE 2
##D lex_ani2 <- lexical_classification(mraja1spl$dialogue, mraja1spl$person)
##D lexa2 <- Animate(lex_ani2, content="white", functional="blue",
##D     current.color = "yellow", current.speaker.color="grey70")
##D 
##D bgb2 <- vertex_apply(lexa2, label.color="grey80", size=17, color="grey40")
##D bgb2 <- edge_apply(bgb2, label.color="yellow")
##D print(bgb2, bg="black", pause=.75, net.legend.color = "white")
##D 
##D ## EXAMPLE 3 (bar plot)
##D Animate(lex_ani2, type="bar")
##D 
##D ## EXAMPLE 4 (text plot)
##D Animate(lex_ani2, type="text")
##D 
##D #======================#
##D ## Complex Animations ##
##D #======================#
##D ## EXAMPLE 1: Network + Text + Bar
##D  
##D library(animation)
##D library(grid)
##D library(gridBase)
##D library(qdap)
##D library(reports)
##D library(igraph)
##D library(plotrix)
##D 
##D lex_ani2 <- lexical_classification(mraja1spl$dialogue, mraja1spl$person)
##D 
##D ## Set up the network version
##D lex_net <- Animate(lex_ani2, contextual="white", lexal="blue",
##D     current.color = "yellow", current.speaker.color="grey70")
##D bgb <- vertex_apply(lex_net, label.color="grey80", size=17, color="grey40")
##D bgb <- edge_apply(bgb, label.color="yellow")
##D 
##D 
##D ## Set up the bar version
##D lex_bar <- Animate(lex_ani2, type="bar")
##D 
##D ## Set up the text
##D lex_text <- Animate(lex_ani2, type="text", size = 3, width=125, color="white")
##D 
##D ## Generate a folder
##D loc <- reports::folder(animation_lexical_classification)
##D setwd(loc)
##D 
##D ## Set up the plotting function
##D oopt <- animation::ani.options(interval = 0.1)
##D 
##D 
##D lex_text_bar <- Map(function(x, y){
##D 
##D     uns <- unit(c(-1.6,.5,-.2,.25), "cm")
##D 
##D     x <- x +
##D         theme(plot.margin = uns,
##D             text=element_text(color="white"),
##D             legend.text=element_text(color="white"),
##D             legend.background = element_rect(fill = "black"),
##D             panel.border = element_rect(color = "black"),
##D             panel.background = element_rect(fill = "black"),
##D             plot.background = element_rect(fill = "black",
##D                 color="black"))
##D 
##D     uns2 <- unit(c(-.5,.5,-.45,.25), "cm")
##D 
##D     y <- y +
##D         theme(plot.margin = uns2,
##D             text=element_text(color="white"),
##D             legend.text=element_text(color="white"),
##D             legend.background = element_rect(fill = "black"),
##D             plot.background = element_rect(fill = "black",
##D                 color="black"))
##D 
##D     gA <- ggplotGrob(x)
##D     gB <- ggplotGrob(y)
##D     maxWidth <- grid::unit.pmax(gA$widths[2:5], gB$widths[2:5])
##D     gA$widths[2:5] <- as.list(maxWidth)
##D     gB$widths[2:5] <- as.list(maxWidth)
##D     out <- arrangeGrob(gA, gB, ncol=1, heights = grid::unit(c(.3, .7), "native"))
##D     ## grid.draw(out)
##D     invisible(out)
##D 
##D }, lex_text, lex_bar)
##D 
##D 
##D FUN <- function(follow=FALSE, theseq = seq_along(bgb)) {
##D 
##D     Title <- "Animated Content Rate: Romeo and Juliet Act 1"
##D     Legend <- c(.2, -1, 1.5, -.95)
##D     Legend.cex <- 1
##D 
##D     lapply(theseq, function(i) {
##D         if (follow) {
##D             png(file=sprintf("%s/images/Rplot%s.png", loc, i),
##D                 width=750, height=875)
##D         }
##D         ## Set up the layout
##D         layout(matrix(c(rep(1, 7), rep(2, 6)), 13, 1, byrow = TRUE))
##D 
##D         ## Plot 1
##D         par(mar=c(2, 0, 2, 0), bg="black")
##D         #par(mar=c(2, 0, 2, 0))
##D         set.seed(22)
##D         plot.igraph(bgb[[i]], edge.curved=TRUE)
##D         mtext(Title, side=3, col="white")
##D         color.legend(Legend[1], Legend[2], Legend[3], Legend[4],
##D               c("Functional", "Content"), attributes(bgb)[["legend"]],
##D               cex = Legend.cex, col="white")
##D 
##D         ## Plot2
##D         plot.new()
##D         vps <- baseViewports()
##D 
##D         print(lex_text_bar[[i]], vp = vpStack(vps$figure,vps$plot))
##D 
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
##D 
##D saveHTML(FUN(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
##D     ani.height = 1000, ani.width=750,
##D     outdir = loc, single.opts =
##D     "'controls': ['first', 'previous', 'play', 'next', 'last', 'loop', 'speed'], 'delayMin': 0")
##D 
##D FUN(TRUE)
##D 
##D ## EXAMPLE 2: Line + Text + Bar
##D ## Generate a folder
##D loc2 <- reports::folder(animation_lexical_classification2)
##D setwd(loc2)
##D 
##D lex_ani2 <- lexical_classification(mraja1spl$dialogue, mraja1spl$person)
##D 
##D ## Set up the bar version
##D lex_bar <- Animate(lex_ani2, type="bar")
##D cumline <- cumulative(lex_bar)
##D lex_line <- plot(cumline)
##D ylims <- range(cumline[[1]][-c(1:100)]) + c(-.1, .1)
##D 
##D ## Set up the text
##D lex_text <- Animate(lex_ani2, type="text", size = 4, width = 80)
##D 
##D 
##D lex_line_text_bar <- Map(function(x, y, z){
##D 
##D     mar <- theme(plot.margin = unit(c(0, .5, 0, .25), "cm"))
##D 
##D     gA <- ggplotGrob(x + mar + 
##D         theme(panel.background = element_rect(fill = NA, colour = NA), 
##D             panel.border = element_rect(fill = NA, colour = NA),
##D             plot.background = element_rect(fill = NA, colour = NA)))
##D     gB <- ggplotGrob(y + mar)
##D     gC <- ggplotGrob(z + mar + ylab("Average Content Rate") + 
##D         coord_cartesian(ylim = ylims) +
##D         ggtitle("Average Content Rate: Romeo & Juliet Act 1"))
##D 
##D     maxWidth <- grid::unit.pmax(gA$widths[2:5], gB$widths[2:5], gC$widths[2:5])
##D     gA$widths[2:5] <- as.list(maxWidth)
##D     gB$widths[2:5] <- as.list(maxWidth)
##D     gC$widths[2:5] <- as.list(maxWidth)
##D     out <- arrangeGrob(gC, gA, gB, ncol=1, heights = grid::unit(c(.38, .25, .37), "native"))
##D     ## grid.draw(out)
##D     invisible(out)
##D 
##D }, lex_text, lex_bar, lex_line)
##D 
##D 
##D FUN2 <- function(follow=FALSE, theseq = seq_along(lex_line_text_bar)) {
##D 
##D 
##D     lapply(theseq, function(i) {
##D         if (follow) {
##D             png(file=sprintf("%s/images/Rplot%s.png", loc2, i),
##D                 width=750, height=875)
##D         }
##D  
##D         print(lex_line_text_bar[[i]])
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
##D library(animation)
##D saveHTML(FUN2(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
##D     ani.height = 1000, ani.width=750,
##D     outdir = loc2, single.opts =
##D     "'controls': ['first', 'previous', 'play', 'next', 'last', 'loop', 'speed'], 'delayMin': 0")
##D 
##D FUN2(TRUE)
##D 
##D #==================#
##D ## Static Network ##
##D #==================#
##D (lexdat <- with(sentSplit(DATA, 4), lexical_classification(state, person)))
##D m <- Network(lexdat)
##D m
##D print(m, bg="grey97", vertex.color="grey75")
##D 
##D print(m, title="Lexical Content Discourse Map", title.color="white", 
##D     bg="black", legend.text.color="white", vertex.label.color = "grey70",
##D     edge.label.color="yellow")
##D 
##D ## or use themes:
##D dev.off()
##D m + qtheme()
##D m + theme_nightheat
##D dev.off()
##D m + theme_nightheat(title="Lexical Content Discourse Map",
##D     vertex.label.color = "grey50")
##D     
##D #==================================#
##D ## Content Rate Over Time Example ##
##D #==================================#
##D lexpres <- lapply(with( pres_debates2012, split(dialogue, time)), function(x) {
##D     lexical_classification(x)
##D })
##D lexplots <- lapply(seq_along(lexpres), function(i) {
##D     dat <- cumulative(lexpres[[i]])
##D     m <- plot(dat)
##D     if (i != 2) m <- m + ylab("")  
##D     if (i == 2) m <- m + ylab("Average Content Rate") 
##D     if (i != 3) m <- m + xlab(NULL)
##D     if (i != 1) m <- m + theme(plot.margin=unit(c(0, 1, 0, .5) + .1, "lines"))
##D     m + ggtitle(paste("Debate", i)) + 
##D         coord_cartesian(xlim = c(300, length(dat[[1]])),
##D             ylim = unlist(range(dat[[1]][-c(1:300)]) + c(-.25, .25)))
##D })
##D 
##D library(grid)
##D library(gridExtra)
##D do.call(grid.arrange, lexplots)
## End(Not run)




library(qdap)


### Name: discourse_map
### Title: Discourse Mapping
### Aliases: discourse_map

### ** Examples

## Not run: 
##D discourse_map(DATA$state, list(DATA$person, DATA$sex))
##D x <- with(mraja1, discourse_map(dialogue, person))
##D x
##D lview(x)
##D library(igraph)
##D plot(visual(x), edge.curved=FALSE)
##D 
##D ## Quickly add/remove a title
##D Title(x) <- "Act 1"
##D x
##D Title(x) <- NULL
##D x
##D 
##D ## Augmenting the plot
##D library(qdapTools)
##D mygraph <- visual(x)
##D 
##D plot(mygraph, edge.curved=TRUE)
##D 
##D V(mygraph)$sex <- V(mygraph)$name %lc% raj.demographics[, 1:2]
##D V(mygraph)$color <- ifelse(V(mygraph)$sex=="f", "pink", "lightblue")
##D 
##D plot(mygraph, edge.curved=TRUE)
##D 
##D V(mygraph)$family <- V(mygraph)$name %l+% raj.demographics[, c(1, 3)]
##D cols <- qcv(blue, red, brown, darkgreen, grey10)
##D V(mygraph)$label.color <- lookup(V(mygraph)$family, 
##D     unique(V(mygraph)$family), cols)
##D 
##D plot(mygraph, edge.curved=TRUE)
##D 
##D ## Community detection
##D x <- with(mraja1, discourse_map(dialogue, person))
##D wc <- walktrap.community(visual(x))
##D colors <- grDevices::rainbow(max(membership(wc)))
##D plot(x, vertex.color=colors[membership(wc)])
##D 
##D ## Repeated Measures (BASIC EXAMPLE)
##D ##------------------------------
##D 
##D ## First merge data and map to discourse per act 
##D ## to separate networks
##D 
##D dat <- key_merge(raj, raj.demographics)
##D list_dat <- split(dat, dat$act)
##D plot_dat <- lapply(list_dat, function(x) with(x, discourse_map(dialogue, person)))
##D 
##D opar <- par()$mar
##D par(mfrow=c(3, 2), mar=c(0, 0, 3, 0))
##D 
##D lapply(seq_along(plot_dat), function(i){
##D     plot(plot_dat[[i]])
##D     graphics::mtext(paste("Act", names(plot_dat)[i]), side=3)
##D })
##D 
##D 
##D ## Repeated Measures (EXTENDED EXAMPLE)
##D ##------------------------------
##D fam_key <- data.frame(fam=unique(raj.demographics$fam.aff),
##D     cols=qcv(blue, grey10, red, orange), 
##D     stringsAsFactors = FALSE)
##D 
##D par(mfrow=c(3, 2), mar=c(0, 1, 3, 1))
##D lapply(seq_along(plot_dat), function(i){
##D 
##D     THE_PLOT <- visual(plot_dat[[i]])
##D 
##D     V(THE_PLOT)$sex <- V(THE_PLOT)$name %l% raj.demographics[, 1:2]
##D     V(THE_PLOT)$color <- ifelse(V(THE_PLOT)$sex=="f", "pink", "lightblue")
##D     V(THE_PLOT)$family <- V(THE_PLOT)$name %lc+% raj.demographics[, c(1, 3)]
##D     V(THE_PLOT)$label.color <- lookup(V(THE_PLOT)$family, fam_key)
##D 
##D     plot(THE_PLOT, edge.curved=TRUE)
##D     graphics::mtext(paste("Act", names(plot_dat)[i]), side=3)
##D })
##D frame()
##D bords <- rep("black", 7)
##D bords[3] <- "white"
##D legend(.29, .95, c("Female", "Male", NA, as.character(fam_key[, 1])), 
##D     fill=c("pink", "lightblue", NA, fam_key[, 2]), border=bords, cex=1.5) 
##D 
##D ## Reset graphics margins
##D par(mar=opar)
##D 
##D ## ANIMATION
##D #===========
##D test <- discourse_map(DATA$state, list(DATA$person))
##D 
##D ## Very quick, hard to see
##D Animate(test)
##D 
##D pdf("test.pdf")
##D     par(mar=c(0, 0, 1, 0))
##D     Animate(test, title="Test Plot")
##D dev.off()
##D 
##D ## Animate it
##D ##-----------
##D library(animation)
##D library(igraph)
##D 
##D loc <- reports::folder(animation_dialogue)
##D ans <- Animate(test)
##D 
##D ## Set up the plotting function
##D oopt <- animation::ani.options(interval = 0.1)
##D 
##D FUN <- function() {
##D     lapply(seq_along(ans), function(i) {
##D         par(mar=c(0, 0, 1, 0))
##D         set.seed(10)
##D         plot.igraph(ans[[i]], edge.curved=TRUE, layout=layout.circle)
##D         graphics::mtext("Discourse Map", side=3)
##D         animation::ani.pause()
##D     })
##D }
##D 
##D ## Detect OS
##D type <- if(.Platform$OS.type == "windows") shell else system
##D saveGIF(FUN(), interval = 0.1, outdir = loc, cmd.fun = type)
##D 
##D saveVideo(FUN(), video.name = "discourse_map.avi", interval = 0.1, outdir = loc)
##D 
##D saveLatex(FUN(), autoplay = TRUE, loop = FALSE, latex.filename = "tester.tex", 
##D     caption = "animated dialogue", outdir = loc, ani.type = "pdf", 
##D     ani.dev = "pdf", ani.width = 5, ani.height = 5.5, interval = 0.1)
##D 
##D saveHTML(FUN(), autoplay = FALSE, loop = TRUE, verbose = FALSE, 
##D     outdir = file.path(loc, "new"), single.opts = 
##D     "'controls': ['first', 'previous', 'play', 'next', 'last', 'loop', 'speed'], 'delayMin': 0")
##D     
##D     
##D ## More Elaborate Layout
##D test2 <- with(mraja1, discourse_map(dialogue, person))
##D 
##D loc2 <- reports::folder(animation_dialogue2)
##D ans2 <- Animate(test2)
##D ## Set up the plotting function
##D oopt <- animation::ani.options(interval = 0.1)
##D 
##D FUN3 <- function() {
##D     lapply(seq_along(ans2), function(i) {
##D         par(mar=c(0, 0, 1, 0))
##D         set.seed(10)
##D         plot.igraph(ans2[[i]], edge.curved=TRUE, layout=layout.auto)
##D         graphics::mtext("Discourse Map\nRomeo and Juliet: Act 1", side=3)
##D         animation::ani.pause()
##D     })
##D }
##D 
##D saveHTML(FUN3(), autoplay = FALSE, loop = FALSE, verbose = FALSE,
##D     outdir = file.path(loc2, "new"), single.opts =
##D     "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")
##D     
##D saveVideo(FUN3(), video.name = "discourse_map.avi", interval = 0.2, 
##D     outdir = loc2)    
## End(Not run)




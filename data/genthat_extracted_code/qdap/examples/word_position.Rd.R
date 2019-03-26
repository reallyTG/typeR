library(qdap)


### Name: word_position
### Title: Word Position
### Aliases: word_position
### Keywords: position word

### ** Examples

## Not run: 
##D position <- with(DATA, word_position(sent_detect(state), Top25Words))
##D position
##D lview(position)
##D plot(position)
##D scores(position)
##D preprocessed(position)
##D counts(position)
##D proportions(position)
##D plot(proportions(position))
##D 
##D stopwords <- unique(c(contractions[[1]], Top200Words))
##D topwords <- freq_terms(pres_debates2012[["dialogue"]], top = 40, 
##D     at.least = 4, stopwords = stopwords)[[1]]
##D word_position(pres_debates2012[["dialogue"]], topwords)
##D plot(word_position(pres_debates2012[["dialogue"]], topwords), FALSE)
##D plot(word_position(pres_debates2012[["dialogue"]], topwords), TRUE, scale=FALSE)
##D 
##D wordlist <- c("tax", "health", "rich", "america", "truth", "money", "cost", 
##D     "governnor", "president", "we", "job", "i", "you", "because", 
##D     "our", "years")
##D 
##D word_position(pres_debates2012[["dialogue"]], wordlist)
##D 
##D ## BY VARIABLES
##D library(gridExtra)
##D pres_deb_by_time <- with(pres_debates2012, split(dialogue, time))
##D out1 <-lapply(pres_deb_by_time, word_position, wordlist)
##D do.call("grid.arrange", c(lapply(out1, plot), ncol=1))
##D 
##D pres_deb_by_person <- with(pres_debates2012, split(dialogue, person))
##D out2 <-lapply(pres_deb_by_person, word_position, wordlist)
##D plots <- lapply(names(out2), function(x) plot(out2[[x]], scale=FALSE) + 
##D     ggtitle(x))
##D do.call("grid.arrange", c(plots, ncol=2))
##D 
##D ## As a histogram
##D ## theme taken from: http://jonlefcheck.net/2013/03/11/black-theme-for-ggplot2-2/
##D theme_black <- function(base_size=12,base_family="") {
##D   theme_grey(base_size=base_size,base_family=base_family) %+replace%
##D     theme(
##D       # Specify axis options
##D       axis.line=element_blank(), 
##D       axis.text.x=element_text(size=base_size*0.8,color="grey55",
##D                                lineheight=0.9,vjust=1), 
##D       axis.text.y=element_text(size=base_size*0.8,color="grey55",
##D                                lineheight=0.9,hjust=1), 
##D       axis.ticks=element_line(color="grey55",size = 0.2), 
##D       axis.title.x=element_text(size=base_size,color="grey55",vjust=1), 
##D       axis.title.y=element_text(size=base_size,color="grey55",angle=90,
##D                                 vjust=0.5), 
##D       axis.ticks.length=unit(0.3,"lines"), 
##D       axis.ticks.margin=unit(0.5,"lines"),
##D       # Specify legend options
##D       legend.background=element_rect(color=NA,fill="black"), 
##D       legend.key=element_rect(color="grey55", fill="black"), 
##D       legend.key.size=unit(1.2,"lines"), 
##D       legend.key.height=NULL, 
##D       legend.key.width=NULL,     
##D       legend.text=element_text(size=base_size*0.8,color="grey55"), 
##D       legend.title=element_text(size=base_size*0.8,face="bold",hjust=0,
##D                                 color="grey55"), 
##D       legend.position="right", 
##D       legend.text.align=NULL, 
##D       legend.title.align=NULL, 
##D       legend.direction="vertical", 
##D       legend.box=NULL,
##D       # Specify panel options
##D       panel.background=element_rect(fill="black",color = NA), 
##D       panel.border=element_rect(fill=NA,color="grey55"), 
##D       panel.grid.major=element_blank(), 
##D       panel.grid.minor=element_blank(), 
##D       panel.spacing=unit(0.25,"lines"),  
##D       # Specify facetting options
##D       strip.background=element_rect(fill="grey30",color="grey10"), 
##D       strip.text.x=element_text(size=base_size*0.8,color="grey55"), 
##D       strip.text.y=element_text(size=base_size*0.8,color="grey55",
##D                                 angle=-90), 
##D       # Specify plot options
##D       plot.background=element_rect(color="black",fill="black"), 
##D       plot.title=element_text(size=base_size*1.2,color="grey55"), 
##D       plot.margin=unit(c(1,1,0.5,0.5),"lines")
##D     )
##D }
##D 
##D out3 <- list_df2df(lapply(out2[1:2], preprocessed), "Person")
##D out3 %>% ggplot(aes(x=position)) + 
##D     geom_histogram(binwidth = 1, fill="white") +
##D     facet_grid(Person~word) +
##D     theme_black() + ylab("Count") + xlab("Position")
##D 
##D ## MOVE TO THE MICRO THROUGH QUALITATIVE ANALYSIS
##D locs <- unlist(setNames(lapply(wordlist, function(x){
##D      sapply(c("ROMNEY", "OBAMA"), function(y){
##D          which(pres_debates2012[["person"]] ==y & grepl(x, pres_debates2012[["dialogue"]]))
##D      })
##D }), wordlist), recursive=FALSE)
##D 
##D fdl <- reports::folder(pres_context)
##D Map(function(x, y){
##D     if (identical(integer(0), x)) return(NULL)
##D     z <- with(pres_debates2012, trans_context(dialogue, person, inds=x, n.before=1))
##D     z[["text"]] <- gsub(beg2char(y, "."), 
##D         paste0("[[", beg2char(y, "."), "]]"), z[["text"]])
##D     print(z, file=file.path(fdl, sprintf("%s.doc", y)))
##D }, locs, names(locs))
## End(Not run)




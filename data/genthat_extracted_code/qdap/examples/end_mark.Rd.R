library(qdap)


### Name: end_mark
### Title: Sentence End Marks
### Aliases: end_mark end_mark_by
### Keywords: end-mark

### ** Examples

## Not run: 
##D end_mark(DATA.SPLIT$state)
##D end_mark(mraja1spl$dialogue)
##D table(end_mark(mraja1spl$dialogue))
##D plot(end_mark(mraja1spl$dialogue))
##D ques <- mraja1spl[end_mark(mraja1spl$dialogue) == "?", ] #grab questions
##D htruncdf(ques)
##D non.ques <- mraja1spl[end_mark(mraja1spl$dialogue) != "?", ] #non questions
##D htruncdf(non.ques, 20)
##D ques.per <- mraja1spl[end_mark(mraja1spl$dialogue) %in% c(".", "?"), ] #grab ? and .
##D htruncdf(ques.per, 20)
##D 
##D (x_by <- end_mark_by(DATA.SPLIT$state, DATA.SPLIT$person))
##D scores(x_by)
##D counts(x_by)
##D proportions(x_by)
##D preprocessed(x_by)
##D plot(scores(x_by))
##D plot(counts(x_by))
##D plot(proportions(x_by))
##D plot(preprocessed(x_by))
##D 
##D #================================#
##D ## End Marks Over Time Examples ##
##D #================================#
##D ##EXAMPLE 1
##D sentpres <- lapply(with(pres_debates2012, split(dialogue, time)), function(x) {
##D     end_mark(x)
##D })
##D 
##D sentplots <- lapply(seq_along(sentpres), function(i) {
##D     m <- plot(cumulative(sentpres[[i]]))
##D     if (i != 2) m <- m + ylab("")
##D     if (i != 3) m <- m + xlab(NULL)
##D     m + ggtitle(paste("Debate", i))
##D })
##D 
##D library(grid)
##D library(gridExtra)
##D do.call(grid.arrange, sentplots)
##D 
##D ##EXAMPLE 2
##D sentraj <- lapply(with(rajSPLIT, split(dialogue, act)), function(x) {
##D     end_mark(x)
##D })
##D  
##D sentplots2 <- lapply(seq_along(sentraj), function(i) {
##D     m <- plot(cumulative(sentraj[[i]]))
##D     if (i != 2) m <- m + ylab("")
##D     if (i != 3) m <- m + xlab(NULL)
##D     act <- qcv(I, II, III, IV, V)
##D     m + ggtitle(paste("Act", act[i]))
##D })
##D 
##D ## ggplot2 function to extract legend
##D g_legend <- function(a.gplot){ 
##D     tmp <- ggplot_gtable(ggplot_build(a.gplot)) 
##D     leg <- which(sapply(tmp[["grobs"]], function(x) x[["name"]]) == "guide-box") 
##D     legend <- tmp[["grobs"]][[leg]] 
##D     legend
##D } 
##D 
##D ## remove legends from plots
##D sentplots3 <- lapply(sentplots2, function(x){
##D     x + theme(legend.position="none") + xlab(NULL) + ylab(NULL)
##D })
##D 
##D sentplots3[[6]] <- g_legend(sentplots2[[1]]) 
##D 
##D do.call(grid.arrange, sentplots3)
## End(Not run)




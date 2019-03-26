library(qdap)


### Name: tot_plot
### Title: Visualize Word Length by Turn of Talk
### Aliases: tot_plot
### Keywords: sentence, split, turn-of-talk

### ** Examples

## Not run: 
##D dataframe <- sentSplit(DATA, "state")
##D tot_plot(dataframe, "state")
##D tot_plot(DATA, "state", tot=FALSE)
##D tot_plot(dataframe, "state", bar.space=.03)
##D tot_plot(dataframe, "state", "sex")
##D tot_plot(dataframe, "state", "person", tot = "sex")
##D tot_plot(mraja1, "dialogue", "fam.aff", tot=FALSE)
##D tot_plot(mraja1, "dialogue", "died", tot=FALSE)
##D tot_plot(mraja1, "dialogue", c("sex", "fam.aff"), tot=FALSE) + 
##D     scale_fill_hue(l=40) 
##D tot_plot(mraja1, "dialogue", c("sex", "fam.aff"), tot=FALSE)+ 
##D     scale_fill_brewer(palette="Spectral")
##D tot_plot(mraja1, "dialogue", c("sex", "fam.aff"), tot=FALSE)+ 
##D     scale_fill_brewer(palette="Set1")
##D 
##D ## repeated measures
##D rajSPLIT2 <- do.call(rbind, lapply(split(rajSPLIT, rajSPLIT$act), head, 25))
##D tot_plot(rajSPLIT2, "dialogue", "fam.aff", facet.var = "act")
##D 
##D ## add mean and +/- 2 sd
##D tot_plot(mraja1, "dialogue", grouping.var = c("sex", "fam.aff"), tot=FALSE)+
##D     scale_fill_brewer(palette="Set1") +
##D     geom_hline(aes(yintercept=mean(word.count))) +
##D     geom_hline(aes(yintercept=mean(word.count) + (2 *sd(word.count)))) +
##D     geom_hline(aes(yintercept=mean(word.count) + (3 *sd(word.count)))) +
##D     geom_text(parse=TRUE, hjust=0, vjust=0, family="serif", size = 4, aes(x = 2, 
##D         y = mean(word.count) + 2, label = "bar(x)")) +
##D     geom_text(hjust=0, vjust=0, family="serif", size = 4, aes(x = 1, 
##D         y = mean(word.count) + (2 *sd(word.count)) + 2, label = "+2 sd")) +
##D     geom_text(hjust=0, vjust=0, family="serif", size = 4, aes(x = 1, 
##D         y = mean(word.count) + (3 *sd(word.count)) + 2, label = "+3 sd")) 
## End(Not run)




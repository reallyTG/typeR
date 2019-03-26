library(qdap)


### Name: rank_freq_mplot
### Title: Rank Frequency Plot
### Aliases: rank_freq_mplot rank_freq_plot
### Keywords: Zipf, rank-frequency

### ** Examples

## Not run: 
##D #rank_freq_mplot EXAMPLES:
##D x1 <- rank_freq_mplot(DATA$state, DATA$person, ncol = 2, jitter = 0)
##D ltruncdf(x1, 10)
##D x2 <- rank_freq_mplot(mraja1spl$dialogue, mraja1spl$person, ncol = 5, 
##D     hap.col = "purple")
##D ltruncdf(x2, 10)
##D invisible(rank_freq_mplot(mraja1spl$dialogue, mraja1spl$person, ncol = 5, 
##D     log.freq = FALSE, log.rank = FALSE, jitter = .6))
##D invisible(rank_freq_mplot(raj$dialogue, jitter = .5, alpha = 1/15))
##D invisible(rank_freq_mplot(raj$dialogue, jitter = .5, shape = 19, alpha = 1/15))
##D 
##D #rank_freq_plot EXAMPLES:
##D mod <- with(mraja1spl , word_list(dialogue, person, cut.n = 10, 
##D     cap.list=unique(mraja1spl$person)))         
##D x3 <- rank_freq_plot(mod$fwl$Romeo$WORD, mod$fwl$Romeo$FREQ, title.ext = 'Romeo')  
##D ltruncdf(x3, 10)
##D ltruncdf(rank_freq_plot(mod$fwl$Romeo$WORD, mod$fwl$Romeo$FREQ, plot = FALSE)           , 10)
##D invisible(rank_freq_plot(mod$fwl$Romeo$WORD, mod$fwl$Romeo$FREQ, title.ext = 'Romeo',     
##D     jitter.ammount = 0.15, hap.col = "darkgreen", dis.col = "purple"))                  
##D invisible(rank_freq_plot(mod$fwl$Romeo$WORD, mod$fwl$Romeo$FREQ, title.ext = 'Romeo',  
##D     jitter.ammount = 0.5, log.scale=FALSE))  
##D invisible(lapply(seq_along(mod$fwl), function(i){
##D     dev.new()
##D     rank_freq_plot(mod$fwl[[i]]$WORD, mod$fwl[[i]]$FREQ, 
##D         title.ext = names(mod$fwl)[i], jitter.ammount = 0.5, log.scale=FALSE)
##D }))
## End(Not run)




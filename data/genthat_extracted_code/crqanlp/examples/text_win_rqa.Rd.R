library(crqanlp)


### Name: text_win_rqa
### Title: Window Recurrence quantification analysis ib text
### Aliases: text_win_rqa
### Keywords: ts

### ** Examples


library(gutenbergr)
## let's get Alice's Adventures in Wonderland by Carroll
# gutenberg_works(author == "Carroll, Lewis") 
rsrc = gutenberg_download(11) ## take the text
win_rqa_res = text_win_rqa(rsrc, typ = "tibble", wshft = 150, winsz = 200, 
                       removeStopwords = FALSE, embed = 1, tw = 1,limit = -1,shuffle = FALSE)
win_rqa_res = as.data.frame(win_rqa_res$crqwin)

plot(win_rqa_res$window, win_rqa_res$RR)
abline(lm(win_rqa_res$RR ~ win_rqa_res$window), lwd = 3, col = "red")






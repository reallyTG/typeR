library(quanteda)


### Name: textplot_scale1d
### Title: Plot a fitted scaling model
### Aliases: textplot_scale1d
### Keywords: textplot

### ** Examples

## Not run: 
##D ie_dfm <- dfm(data_corpus_irishbudget2010)
##D doclab <- apply(docvars(data_corpus_irishbudget2010, c("name", "party")), 
##D                 1, paste, collapse = " ")
##D 
##D ## wordscores
##D refscores <- c(rep(NA, 4), 1, -1, rep(NA, 8))
##D ws <- textmodel_wordscores(ie_dfm, refscores, smooth = 1)
##D # plot estimated word positions
##D textplot_scale1d(ws, highlighted = c("minister", "have", "our", "budget"))
##D # plot estimated document positions
##D textplot_scale1d(predict(ws, se.fit = TRUE), doclabels = doclab,
##D                  groups = docvars(data_corpus_irishbudget2010, "party"))
##D 
##D ## wordfish
##D wf <- textmodel_wordfish(dfm(data_corpus_irishbudget2010), dir = c(6,5))
##D # plot estimated document positions
##D textplot_scale1d(wf, doclabels = doclab)
##D textplot_scale1d(wf, doclabels = doclab,
##D                  groups = docvars(data_corpus_irishbudget2010, "party"))
##D # plot estimated word positions
##D textplot_scale1d(wf, margin = "features", 
##D                  highlighted = c("government", "global", "children", 
##D                                  "bank", "economy", "the", "citizenship",
##D                                  "productivity", "deficit"))
##D 
##D ## correspondence analysis
##D ca <- textmodel_ca(ie_dfm)
##D # plot estimated document positions
##D textplot_scale1d(ca, margin = "documents",
##D                  doclabels = doclab,
##D                  groups = docvars(data_corpus_irishbudget2010, "party"))
## End(Not run)




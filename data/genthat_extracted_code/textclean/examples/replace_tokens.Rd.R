library(textclean)


### Name: replace_tokens
### Title: Replace Tokens
### Aliases: replace_tokens

### ** Examples

replace_tokens(DATA$state, c('No', 'what', "it's"))
replace_tokens(DATA$state, c('No', 'what', "it's"), "<<TOKEN>>")
replace_tokens(
    DATA$state, 
    c('No', 'what', "it's"), 
    "<<TOKEN>>", 
    ignore.case = TRUE
)

## Not run: 
##D ## Now let's see the speed
##D ## Set up data
##D library(textshape)
##D data(hamlet)
##D set.seed(11)
##D tokens <- sample(unique(unlist(split_token(hamlet$dialogue))), 2000)
##D 
##D tic <- Sys.time()
##D head(replace_tokens(hamlet$dialogue, tokens))
##D (toc <- Sys.time() - tic)
##D 
##D 
##D tic <- Sys.time()
##D head(mgsub(hamlet$dialogue, tokens, ""))
##D (toc <- Sys.time() - tic)
##D 
##D 
##D ## Amp it up 20x more data
##D tic <- Sys.time()
##D head(replace_tokens(rep(hamlet$dialogue, 20), tokens))
##D (toc <- Sys.time() - tic)
##D 
##D ## Replace names example
##D 
##D library(lexicon)
##D library(textshape)
##D nms <- gsub("(^.)(.*)", "\\U\\1\\L\\2", common_names, perl = TRUE)
##D x <- split_portion(
##D     sample(c(sample(grady_augmented, 5000), sample(nms, 10000, TRUE))), 
##D     n.words = 12
##D )
##D x$text.var <- paste0(
##D     x$text.var, 
##D     sample(c('.', '!', '?'), length(x$text.var), TRUE)
##D  )
##D replace_tokens(x$text.var, nms, 'NAME')
## End(Not run)




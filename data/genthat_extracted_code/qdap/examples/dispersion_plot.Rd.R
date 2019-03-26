library(qdap)


### Name: dispersion_plot
### Title: Lexical Dispersion Plot
### Aliases: dispersion_plot
### Keywords: dispersion

### ** Examples

## Not run: 
##D term_match(raj$dialogue, c(" love ", "love", " night ", "night"))
##D dispersion_plot(raj$dialogue, c(" love ", "love", " night ", "night"))
##D dispersion_plot(raj$dialogue, c("love", "night"), rm.vars = raj$act)
##D with(rajSPLIT , dispersion_plot(dialogue, c("love", "night"), 
##D     grouping.var = list(fam.aff, sex), rm.vars = act))
##D 
##D ## With grouping variables
##D with(rajSPLIT , dispersion_plot(dialogue, c("love", "night"), 
##D      grouping.var = sex, rm.vars = act))
##D 
##D ## Drop total with `total.color = NULL`
##D with(rajSPLIT , dispersion_plot(dialogue, c("love", "night"), 
##D      grouping.var = sex, rm.vars = act, total.color = NULL))
##D 
##D ## Change color scheme
##D with(rajSPLIT, dispersion_plot(dialogue, c("love", "night"), 
##D     bg.color = "black", grouping.var = list(fam.aff, sex), 
##D     color = "yellow", total.color = "white", horiz.color="grey20"))
##D     
##D ## Use `word_list`
##D ## Presidential debates by all
##D wrds <- word_list(pres_debates2012$dialogue, stopwords = Top200Words)
##D wrds2 <- spaste(wrds[["rfswl"]][["all"]][, "WORD"])
##D wrds2 <- c(" governor~~romney ", wrds2[-c(3, 12)])
##D with(pres_debates2012 , dispersion_plot(dialogue, wrds2, rm.vars = time))
##D 
##D ## Presidential debates by person
##D dat <- pres_debates2012
##D dat <- dat[dat$person %in% qcv(ROMNEY, OBAMA), ]
##D 
##D wordlist <- c(" tax", " health", " rich ", "america", " truth", 
##D     " money", "cost", " governnor", " president", " we ", 
##D     " job", " i ", " you ", " because ", " our ", " years ")
##D 
##D with(dat, dispersion_plot(dialogue, wordlist, total.color = NULL, 
##D     bg.color = "white", grouping.var = person, rm.vars = time,
##D     color = "black", horiz.color="grey80"))
##D 
##D wordlist2 <- c(" i'd ", " i'll ", " i'm ", " i've ", " i ", 
##D     " we'd ", " we'll ", " we're ", " we've ", " we ", 
##D     " you'd ",  " you'll ", " you're ", " you've ", " you ", " your ",
##D     " he'd ", " he'll ", " he's ", " he ")
##D 
##D with(dat, dispersion_plot(dialogue, wordlist2, 
##D     bg.color = "black", grouping.var = person, rm.vars = time,
##D     color = "yellow", total.color = NULL, horiz.color="grey20"))
##D    
##D with(dat, dispersion_plot(dialogue, wordlist2, 
##D     bg.color = "black", grouping.var = person, rm.vars = time,
##D     color = "red", total.color = "white", horiz.color="grey20"))
##D 
##D ## `match.terms` as a named list        
##D wordlist3 <- list(
##D     I = c(" i'd ", " i'll ", " i'm ", " i've ", " i "),
##D     we = c(" we'd ", " we'll ", " we're ", " we've ", " we "),
##D     you = c(" you'd ",  " you'll ", " you're ", " you've ", " you ", " your "),
##D     he = c(" he'd ", " he'll ", " he's ", " he ")
##D )
##D 
##D with(dat, dispersion_plot(dialogue, wordlist3,
##D     bg.color = "grey60", grouping.var = person, rm.vars = time,
##D     color = "blue", total.color = "grey40", horiz.color="grey20"))
##D 
##D colsplit2df(scores(with(dat, termco(dialogue, list(time, person), wordlist3))))
##D 
##D ## Extras:
##D ## Reverse facets
##D 
##D x <- with(pres_debates2012 , dispersion_plot(dialogue, wrds2, rm.vars = time))
##D 
##D ## function to reverse ggplot2 facets
##D rev_facet <- function(x) {
##D     names(x$facet)[1:2] <- names(x$facet)[2:1]
##D     print(x)
##D }
##D 
##D rev_facet(x)
##D 
##D ## Discourse Markers: See...
##D ## Schiffrin, D. (2001). Discourse markers: Language, meaning, and context. 
##D ##    In D. Schiffrin, D. Tannen, & H. E. Hamilton (Eds.), The handbook of 
##D ##    discourse analysis (pp. 54-75). Malden, MA: Blackwell Publishing.
##D 
##D discoure_markers <- list(
##D     response_cries = c(" oh ", " ah ", " aha ", " ouch ", " yuk "),
##D     back_channels = c(" uh-huh ", " uhuh ", " yeah "), 
##D     summons = " hey ", 
##D     justification = " because "
##D )
##D 
##D (markers <- with(pres_debates2012, 
##D     termco(dialogue, list(person, time), discoure_markers)
##D ))
##D plot(markers, high="red")
##D 
##D with(pres_debates2012, 
##D     termco(dialogue, list(person, time), discoure_markers, elim.old = FALSE)
##D )
##D 
##D with(pres_debates2012, 
##D     dispersion_plot(dialogue, unlist(discoure_markers), person, time)
##D )
## End(Not run)




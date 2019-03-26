library(qdap)


### Name: termco
### Title: Search For and Count Terms
### Aliases: termco termco_d term_match termco2mat
### Keywords: word-search

### ** Examples

## Not run: 
##D #termco examples:
##D 
##D term <- c("the ", "she", " wh")
##D (out <- with(raj.act.1,  termco(dialogue, person, term)))
##D 
##D plot(out)
##D scores(out)
##D plot(scores(out))
##D counts(out)
##D plot(counts(out))
##D proportions(out)
##D plot(proportions(out))
##D 
##D # General form for match.list as themes
##D #
##D # ml <- list(
##D #     cat1 = c(),
##D #     cat2 = c(),
##D #     catn = c()
##D # )
##D 
##D ml <- list(
##D     cat1 = c(" the ", " a ", " an "),
##D     cat2 = c(" I'" ),
##D     "good",
##D     the = c("the", " the ", " the", "the")
##D )
##D 
##D (dat <- with(raj.act.1,  termco(dialogue, person, ml)))
##D scores(dat)  #useful for presenting in tables
##D counts(dat)  #prop and raw counts are useful for performing calculations
##D proportions(dat)
##D datb <- with(raj.act.1, termco(dialogue, person, ml,
##D     short.term = FALSE, elim.old=FALSE))
##D ltruncdf(datb, 20, 6)
##D     
##D (dat2 <- data.frame(dialogue=c("@bryan is bryan good @br",
##D     "indeed", "@ brian"), person=qcv(A, B, A)))
##D 
##D ml2 <- list(wrds=c("bryan", "indeed"), "@", bryan=c("bryan", "@ br", "@br"))
##D 
##D with(dat2, termco(dialogue, person, match.list=ml2))
##D 
##D with(dat2, termco(dialogue, person, match.list=ml2, percent = FALSE))
##D 
##D DATA$state[1] <- "12 4 rgfr  r0ffrg0"
##D termco(DATA$state, DATA$person, '0', digit.remove=FALSE)
##D DATA <- qdap::DATA
##D 
##D #Using with term_match and exclude    
##D exclude(term_match(DATA$state, qcv(th), FALSE), "truth")
##D termco(DATA$state, DATA$person, exclude(term_match(DATA$state, qcv(th), 
##D     FALSE), "truth"))
##D MTCH.LST <- exclude(term_match(DATA$state, qcv(th, i)), qcv(truth, stinks))
##D termco(DATA$state, DATA$person, MTCH.LST)
##D 
##D syns <- synonyms("doubt")
##D syns[1]
##D termco(DATA$state, DATA$person, unlist(syns[1]))
##D synonyms("doubt", FALSE)
##D termco(DATA$state, DATA$person, list(doubt = synonyms("doubt", FALSE)))
##D termco(DATA$state, DATA$person, syns)
##D 
##D #termco_d examples:
##D termco_d(DATA$state, DATA$person, c(" the", " i'"))
##D termco_d(DATA$state, DATA$person, c(" the", " i'"), ignore.case=FALSE)
##D termco_d(DATA$state, DATA$person, c(" the ", " i'"))
##D 
##D # termco2mat example:
##D MTCH.LST <- exclude(term_match(DATA$state, qcv(a, i)), qcv(is, it, am, shall))
##D termco_obj <- termco(DATA$state, DATA$person, MTCH.LST)
##D termco2mat(termco_obj)
##D plot(termco_obj)
##D plot(termco_obj, label = TRUE)
##D plot(termco_obj, label = TRUE, text.color = "red")
##D plot(termco_obj, label = TRUE, text.color="red", lab.digits=3)
##D 
##D ## REVERSE TERMCO (return raw words found per variable)
##D df <- data.frame(x=1:6,
##D     y = c("the fluffy little bat" , "the man was round like a ball",
##D         "the fluffy little bat" , "the man was round like a ball",
##D         "he ate the chair" , "cough, cough"),
##D     stringsAsFactors=FALSE)
##D 
##D l <- list("bat" ,"man", "ball", "heavy")
##D z <- counts(termco(df$y, qdapTools::id(df), l))[, -2]
##D 
##D counts2list(z[, -1], z[, 1])
##D 
##D ## politness
##D politness <- c("please", "excuse me", "thank you", "you welcome", 
##D     "you're welcome", "i'm sorry", "forgive me", "pardon me")
##D 
##D with(pres_debates2012, termco(dialogue, person, politness))
##D with(hamlet, termco(dialogue, person, politness))
##D 
##D ## Term Use Percentage per N Words
##D dat <- with(raj, chunker(dialogue, person, n.words = 100, rm.unequal = TRUE))
##D dat2 <- list2df(dat, "Dialogue", "Person")
##D dat2[["Duration"]] <- unlist(lapply(dat, id, pad=FALSE))
##D dat2 <- qdap_df(dat2, "Dialogue")
##D 
##D Top5 <- sapply(split(raj$dialogue, raj$person), wc, FALSE) %>%
##D     sort(decreasing=TRUE) %>% 
##D     list2df("wordcount", "person") %>%
##D     `[`(1:5, 2)
##D 
##D propdat <- dat2 %&% 
##D     termco(list(Person, Duration), as.list(Top25Words[1:5]), percent = FALSE) %>% 
##D     proportions %>%
##D     colsplit2df %>% 
##D     reshape2::melt(id=c("Person", "Duration", "word.count"), variable="Word") %>%
##D     dplyr::filter(Person %in% Top5)
##D 
##D head(propdat)
##D 
##D ggplot(propdat, aes(y=value, x=Duration, group=Person, color=Person)) +
##D     geom_line(size=1.25) +
##D     facet_grid(Word~., scales="free_y") +
##D     ylab("Percent of Word Use")  +
##D     xlab("Per 100 Words") + 
##D     scale_y_continuous(labels = percent)
##D 
##D ggplot(propdat, aes(y=value, x=Duration, group=Word, color=Word)) +
##D     geom_line(size=1.25) +
##D     facet_grid(Person~.) +
##D     ylab("Percent of Word Use")  +
##D     xlab("Per 100 Words") + 
##D     scale_y_continuous(labels = percent)
##D 
##D ggplot(propdat, aes(y=value, x=Duration, group=Word)) +
##D     geom_line() +
##D     facet_grid(Word~Person, scales="free_y") +
##D     ylab("Percent of Word Use")  +
##D     xlab("Per 100 Words") + 
##D     scale_y_continuous(labels = percent) +
##D     ggthemes::theme_few()
##D     
##D ## Discourse Markers: See...
##D ## Schffrin, D. (2001). Discourse markers: Language, meaning, and context. 
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




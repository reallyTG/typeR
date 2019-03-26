library(qdap)


### Name: as.tdm
### Title: tm Package Compatibility Tools: Apply to or Convert to/from Term
###   Document Matrix or Document Term Matrix
### Aliases: as.tdm as.TermDocumentMatrix as.dtm as.DocumentTermMatrix
###   as.tdm.Corpus as.tdm.default as.tdm.character as.dtm.Corpus
###   as.dtm.default as.dtm.character as.tdm.wfm as.dtm.wfm
###   as.data.frame.Corpus as.Corpus as.Corpus.sent_split as.Corpus.default
###   apply_as_tm apply_as_df as.Corpus.TermDocumentMatrix
###   as.Corpus.DocumentTermMatrix as.Corpus.wfm

### ** Examples

## Not run: 
##D as.dtm(DATA$state, DATA$person)
##D as.tdm(DATA$state, DATA$person)
##D 
##D x <- wfm(DATA$state, DATA$person)
##D as.tdm(x)
##D as.dtm(x)
##D library(tm)
##D plot(as.tdm(x))
##D 
##D pres <- as.tdm(pres_debates2012$dialogue, pres_debates2012$person)
##D plot(pres, corThreshold = 0.8)
##D pres
##D (pres2 <- removeSparseTerms(pres, .3))
##D plot(pres2, corThreshold = 0.95)
##D 
##D shorts <- all_words(pres_debates2012)[,1][nchar(all_words(
##D     pres_debates2012)[,1]) < 4]
##D 
##D SW <- c(shorts, qdapDictionaries::contractions[, 1],
##D     qdapDictionaries::Top200Words,
##D     "governor", "president", "mister", "obama","romney")
##D 
##D DocTermMat2 <- with(pres_debates2012, as.dtm(dialogue, list(person, time), stopwords = SW))
##D DocTermMat2 <- removeSparseTerms(DocTermMat2,0.95)
##D (DocTermMat2 <- DocTermMat2[rowSums(as.matrix(DocTermMat2))> 0,])
##D plot(DocTermMat2)
##D     
##D ## Correspondence Analysis
##D library(ca)
##D 
##D dat <- pres_debates2012
##D dat <- dat[dat$person %in% qcv(ROMNEY, OBAMA), ]
##D 
##D speech <- stemmer(dat$dialogue)
##D mytable1 <- with(dat, as.tdm(speech, list(person, time), stopwords = Top25Words))
##D 
##D fit <- ca(as.matrix(mytable1))
##D summary(fit)
##D plot(fit)
##D plot3d.ca(fit, labels=1)
##D 
##D 
##D mytable2 <- with(dat, as.tdm(speech, list(person, time), stopwords = Top200Words))
##D 
##D fit2 <- ca(as.matrix(mytable2))
##D summary(fit2)
##D plot(fit2)
##D plot3d.ca(fit2, labels=1)
##D 
##D ## Topic Models
##D # Example 1 #
##D library(topicmodels); library(tm)
##D 
##D # Generate stop words based on short words, frequent words and contractions
##D shorts <- all_words(pres_debates2012)[,1][nchar(all_words(
##D     pres_debates2012)[,1]) < 4]
##D     
##D SW <- c(shorts, qdapDictionaries::contractions[, 1], 
##D     qdapDictionaries::Top200Words, 
##D     "governor", "president", "mister", "obama","romney")
##D     
##D DocTermMat <- with(pres_debates2012, as.dtm(dialogue, person, stopwords = SW))
##D DocTermMat <- removeSparseTerms(DocTermMat,0.999)
##D DocTermMat <- DocTermMat[rowSums(as.matrix(DocTermMat))> 0,]
##D 
##D lda.model <- LDA(DocTermMat, 5)
##D 
##D (topics <- posterior(lda.model, DocTermMat)$topics)
##D terms(lda.model,20)
##D 
##D # Plot the Topics Per Person
##D topic.dat <- matrix2df(topics, "Person")
##D colnames(topic.dat)[-1] <- paste2(t(terms(lda.model,20)), sep=", ")
##D 
##D library(reshape2)
##D mtopic <- melt(topic.dat, variable="Topic", value.name="Proportion")
##D ggplot(mtopic, aes(weight=Proportion, x=Topic, fill=Topic)) + 
##D     geom_bar() + 
##D     coord_flip() +
##D     facet_grid(Person~.) +
##D     guides(fill=FALSE)
##D 
##D # Example 2 #
##D DocTermMat2 <- with(pres_debates2012, as.dtm(dialogue, list(person, time), stopwords = SW))
##D DocTermMat2 <- removeSparseTerms(DocTermMat2,0.95)
##D DocTermMat2 <- DocTermMat2[rowSums(as.matrix(DocTermMat2))> 0,]
##D 
##D lda.model2 <- LDA(DocTermMat2, 6)
##D 
##D (topics2 <- posterior(lda.model2, DocTermMat2)$topics)
##D terms(lda.model2,20)
##D qheat(topics2, high="blue", low="yellow", by.col=FALSE)
##D 
##D # Example 3 #
##D lda.model3 <- LDA(DocTermMat2, 10)
##D 
##D (topics3 <- posterior(lda.model3, DocTermMat2)$topics)
##D terms(lda.model3, 20)
##D qheat(topics3, high="blue", low="yellow", by.col=FALSE)
##D 
##D # Plot the Topics Per Person
##D topic.dat3 <- matrix2df(topics3, "Person&Time")
##D colnames(topic.dat3)[-1] <- paste2(t(terms(lda.model3, 10)), sep=", ")
##D topic.dat3 <- colsplit2df(topic.dat3)
##D 
##D library(reshape2)
##D library(scales)
##D mtopic3 <- melt(topic.dat3, variable="Topic", value.name="Proportion")
##D (p1 <- ggplot(mtopic3, aes(weight=Proportion, x=Topic, fill=Topic)) +
##D     geom_bar() +
##D     coord_flip() +
##D     facet_grid(Person~Time) +
##D     guides(fill=FALSE) +
##D     scale_y_continuous(labels = percent) +
##D     theme(plot.margin = unit(c(1, 0, 0.5, .5), "lines")) +
##D     ylab("Proportion")) 
##D 
##D mtopic3.b <- mtopic3
##D mtopic3.b[, "Topic"] <- factor(as.numeric(mtopic3.b[, "Topic"]), levels = 1:10)
##D mtopic3.b[, "Time"] <- factor(gsub("time ", "", mtopic3.b[, "Time"]))
##D 
##D p2 <- ggplot(mtopic3.b, aes(x=Time, y=Topic, fill=Proportion)) +
##D     geom_tile(color = "white") +
##D     scale_fill_gradient(low = "grey70", high = "red") +
##D     facet_grid(Person~Time, scales = "free") +
##D     theme(axis.title.y = element_blank(),
##D         axis.text.x= element_text(colour="white"),
##D         axis.ticks.x= element_line(colour="white"),
##D         axis.ticks.y = element_blank(),
##D         axis.text.y= element_blank(),
##D         plot.margin = unit(c(1, -.5, .5, -.9), "lines")
##D ) 
##D 
##D library(gridExtra)
##D grid.arrange(p1, p2, nrow=1, widths = grid::unit(c(.85, .15), "native")) 
##D     
##D ## tm Matrices to wfm
##D library(tm)
##D data(crude)
##D 
##D ## A Term Document Matrix Conversion
##D (tm_in <- TermDocumentMatrix(crude, control = list(stopwords = TRUE)))
##D converted <- as.wfm(tm_in)
##D head(converted)
##D summary(converted)
##D 
##D ## A Document Term Matrix Conversion
##D (dtm_in <- DocumentTermMatrix(crude, control = list(stopwords = TRUE)))
##D summary(as.wfm(dtm_in))
##D 
##D ## `apply_as_tm` Examples
##D ## Create a wfm
##D a <- with(DATA, wfm(state, list(sex, adult)))
##D summary(a)
##D 
##D ## Apply functions meant for a tm TermDocumentMatrix
##D out <- apply_as_tm(a, tm:::removeSparseTerms, sparse=0.6)
##D summary(out)
##D 
##D apply_as_tm(a, tm:::findAssocs, "computer", .8)
##D apply_as_tm(a, tm:::findFreqTerms, 2, 3)
##D apply_as_tm(a, tm:::Zipf_plot)
##D apply_as_tm(a, tm:::Heaps_plot)
##D apply_as_tm(a, tm:::plot.TermDocumentMatrix, corThreshold = 0.4)
##D 
##D library(proxy)
##D apply_as_tm(a, tm:::weightBin)
##D apply_as_tm(a, tm:::weightBin, to.qdap = FALSE)
##D apply_as_tm(a, tm:::weightSMART)
##D apply_as_tm(a, tm:::weightTfIdf)
##D 
##D ## Convert tm Corpus to Dataframe
##D ## A tm Corpus
##D library(tm)
##D reut21578 <- system.file("texts", "crude", package = "tm")
##D reuters <- Corpus(DirSource(reut21578),
##D     readerControl = list(reader = readReut21578XML))
##D 
##D ## Convert to dataframe
##D corp_df <- as.data.frame(reuters)
##D htruncdf(corp_df)
##D 
##D z <- as.Corpus(DATA$state, DATA$person, 
##D        demographic=DATA[, qcv(sex, adult, code)])
##D as.data.frame(z)
##D 
##D ## Apply a qdap function
##D out <- formality(corp_df$text, corp_df$docs)
##D plot(out)
##D 
##D ## Convert a qdap dataframe to tm package Corpus
##D (x <- with(DATA2, as.Corpus(state, list(person, class, day))))
##D library(tm)
##D inspect(x)
##D inspect_text(x)
##D class(x)
##D 
##D (y <- with(pres_debates2012, as.Corpus(dialogue, list(person, time))))
##D 
##D ## Add demographic info to DMetaData of Corpus
##D z <- as.Corpus(DATA$state, DATA$person, 
##D     demographic=DATA[, qcv(sex, adult, code)])
##D lview(z)
##D 
##D lview(as.Corpus(DATA$state, DATA$person,
##D     demographic=DATA$sex))
##D 
##D lview(as.Corpus(DATA$state, DATA$person,
##D     demographic=list(DATA$sex, DATA$adult)))
##D 
##D ## Apply qdap functions meant for dataframes from sentSplit to tm Corpus
##D library(tm)
##D reut21578 <- system.file("texts", "crude", package = "tm")
##D reuters <- Corpus(DirSource(reut21578),
##D     readerControl = list(reader = readReut21578XML))
##D 
##D matches <- list(
##D     oil = qcv(oil, crude),
##D     money = c("economic", "money")
##D )
##D 
##D apply_as_df(reuters, word_stats)
##D apply_as_df(reuters, formality)
##D apply_as_df(reuters, word_list)
##D apply_as_df(reuters, polarity)
##D apply_as_df(reuters, Dissimilarity)
##D apply_as_df(reuters, diversity)
##D apply_as_df(reuters, pos_by)
##D apply_as_df(reuters, flesch_kincaid)
##D apply_as_df(reuters, trans_venn)
##D apply_as_df(reuters, gantt_plot)
##D apply_as_df(reuters, rank_freq_mplot)
##D apply_as_df(reuters, character_table)
##D 
##D (termco_out <- apply_as_df(reuters, termco, match.list = matches))
##D plot(termco_out, values = TRUE, high="red")
##D 
##D (wordcor_out <- apply_as_df(reuters, word_cor, word = unlist(matches)))
##D plot(wordcor_out)
##D 
##D (f_terms <- apply_as_df(reuters, freq_terms, at.least = 3))
##D plot(f_terms)
##D 
##D apply_as_df(reuters, trans_cloud)
##D ## To use "all" rather than "docs" as "grouping.var"...
##D apply_as_df(reuters, trans_cloud, grouping.var=NULL, 
##D     target.words=matches, cloud.colors = c("red", "blue", "grey75"))
##D 
##D finds <- apply_as_df(reuters, freq_terms, at.least = 5,
##D     top = 5, stopwords = Top100Words)
##D apply_as_df(reuters, dispersion_plot, match.terms = finds[, 1],
##D     total.color = NULL)
##D     
##D ## Filter for Term Document Matrix/Document Term Matrix
##D library(tm)
##D data(crude)
##D 
##D (tdm_in <- TermDocumentMatrix(crude, control = list(stopwords = TRUE)))
##D Filter(tdm_in, 5)
##D 
##D (dtm_in <- DocumentTermMatrix(crude, control = list(stopwords = TRUE)))
##D Filter(dtm_in, 5)
##D 
##D ## Filter particular words based on max/min values
##D Filter(dtm_in, 5, 7)
##D Filter(dtm_in, 4, 4)
##D Filter(tdm_in, 3, 4)
##D Filter(tdm_in, 3, 4, stopwords = Top200Words)
##D 
##D ## SPECIAL REMOVAL OF TERMS (more flexible consideration of words than wfm)
##D dat <- data.frame(
##D     person = paste0("person_", 1:5),
##D     tweets = c("test one two", "two apples","hashtag #apple", 
##D         "#apple #tree", "http://microsoft.com")
##D )
##D 
##D ## remove specialty items
##D dat[[2]] <- rm_default(dat[[2]], pattern=pastex("@rm_url", "#apple\\b"))
##D 
##D 
##D myCorp <- tm::tm_map(crude, tm::removeWords, Top200Words)
##D myCorp %>% as.dtm() %>% tm::inspect()
## End(Not run)




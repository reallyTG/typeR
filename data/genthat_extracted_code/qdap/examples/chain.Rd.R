library(qdap)


### Name: %&%
### Title: qdap Chaining
### Aliases: %&% %>%
### Keywords: chain chaining pipe

### ** Examples

## Not run: 
##D dat <- qdap_df(DATA, state)
##D dat %&% trans_cloud(grouping.var=person)
##D dat %&% trans_cloud(grouping.var=person, text.var=stemmer(DATA$state))
##D dat %&% termco(grouping.var=person, match.list=list("fun", "computer"))
##D 
##D ## Various examples with qdap functions (sentSplit gives class "qdap_df")
##D dat <- sentSplit(DATA, "state")
##D dat %&% trans_cloud(grouping.var=person)
##D dat %&% termco(person, match.list=list("fun", "computer"))
##D dat %&% trans_venn(person)
##D dat %&% polarity(person)
##D dat %&% formality(person)
##D dat %&% automated_readability_index(person)
##D dat %&% Dissimilarity(person)
##D dat %&% gradient_cloud(sex)
##D dat %&% dispersion_plot(c("fun", "computer"))
##D dat %&% discourse_map(list(sex, adult))
##D dat %&% gantt_plot(person)
##D dat %&% word_list(adult)
##D dat %&% end_mark_by(person)
##D dat %&% end_mark()
##D dat %&% word_stats(person)
##D dat %&% wfm(person)
##D dat %&% word_cor(person, "i")
##D dat %&% sentCombine(person)
##D dat %&% question_type(person)
##D dat %&% word_network_plot()
##D dat %&% character_count()
##D dat %&% char_table(person)
##D dat %&% phrase_net(2, .1)
##D dat %&% boolean_search("it||!")
##D dat %&% trans_context(person, which(end_mark(DATA.SPLIT[, "state"]) == "?"))
##D dat %&% mgsub(c("it's", "I'm"), c("it is", "I am"))
##D 
##D ## combine with magrittr/dplyr chaining
##D dat %&% wfm(person) %>% plot()
##D dat %&% polarity(person) %>% scores()
##D dat %&% polarity(person) %>% counts()
##D dat %&% polarity(person) %>% scores()
##D dat %&% polarity(person) %>% scores() %>% plot()
##D dat %&% polarity(person) %>% scores %>% plot
##D 
##D ## Change text column in `qdap_df` (Example 1)
##D dat2 <- sentSplit(DATA, "state", stem.col = TRUE)
##D class(dat2)
##D dat2 %&% trans_cloud()
##D Text(dat2)
##D ## change the `text.var` column
##D Text(dat2) <- "stem.text"
##D dat2 %&% trans_cloud()
##D 
##D ## Change text column in `qdap_df` (Example 2)
##D (dat2$fake_dat <- paste(emoticon[1:11,2], dat2$state))
##D Text(dat2) <- "fake_dat"
##D (m <- dat2 %&% sub_holder(emoticon[,2]))
##D m$unhold(strip(m$output))
## End(Not run)




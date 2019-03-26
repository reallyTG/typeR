library(qdap)


### Name: word_count
### Title: Word Counts
### Aliases: word_count wc character_count character_table char_table
### Keywords: character-count word-count,

### ** Examples

## Not run: 
##D ## WORD COUNT
##D word_count(DATA$state)
##D wc(DATA$state)
##D word_count(DATA$state, names = TRUE)
##D word_count(DATA$state, byrow=FALSE, names = TRUE)
##D sum(word_count(DATA$state))
##D 
##D sapply(split(raj$dialogue, raj$person), wc, FALSE) %>%
##D     sort(decreasing=TRUE) %>% 
##D     list2df("wordcount", "person") %>%
##D     `[`(, 2:1)
##D 
##D ## PLOT WORD COUNTS
##D raj2 <- raj
##D raj2$scaled <- unlist(tapply(wc(raj$dialogue), raj2$act, scale))
##D raj2$scaled2 <- unlist(tapply(wc(raj$dialogue), raj2$act, scale, scale = FALSE))
##D raj2$ID <- factor(unlist(tapply(raj2$act, raj2$act, seq_along)))
##D 
##D ggplot(raj2, aes(x = ID, y = scaled, fill =person)) +
##D     geom_bar(stat="identity") +
##D     facet_grid(act~.) + 
##D     ylab("Scaled") + xlab("Turn of Talk") +
##D     guides(fill = guide_legend(nrow = 5, byrow = TRUE)) +
##D     theme(legend.position="bottom") +
##D     ggtitle("Scaled and Centered")
##D 
##D 
##D ggplot(raj2, aes(x = ID, y = scaled2, fill =person)) +
##D     geom_bar(stat="identity") +
##D     facet_grid(act~.) + 
##D     ylab("Scaled") + xlab("Turn of Talk") +
##D     guides(fill = guide_legend(nrow = 5, byrow = TRUE)) +
##D     theme(legend.position="bottom") +
##D     ggtitle("Mean Difference")
##D   
##D     
##D raj$wc <- wc(raj$dialogue)
##D raj$cum.wc <- unlist(with(raj, tapply(wc, act, cumsum)))
##D raj$turn <- unlist(with(raj, tapply(act, act, seq_along)))
##D ggplot(raj, aes(y=cum.wc, x=turn)) + 
##D     geom_step(direction = "hv") + 
##D     facet_wrap(~act)
##D         
##D ## CHARACTER COUNTS
##D character_count(DATA$state)
##D character_count(DATA$state, byrow=FALSE)
##D sum(character_count(DATA$state))
##D 
##D ## CHARACTER TABLE
##D x <- character_table(DATA$state, DATA$person)
##D plot(x)
##D plot(x, label = TRUE)
##D plot(x, label = TRUE, text.color = "red")
##D plot(x, label = TRUE, lab.digits = 1, zero.replace = "PP7")
##D 
##D scores(x)
##D counts(x)
##D proportions(x)
##D 
##D plot(scores(x))
##D plot(counts(x))
##D plot(proportions(x))
##D 
##D ## combine columns
##D colcomb2class(x, list(vowels = c("a", "e", "i", "o", "u")))
##D 
##D ## char_table(DATA$state, DATA$person)
##D ## char_table(DATA$state, DATA$person, percent = TRUE)
##D ## character_table(DATA$state, list(DATA$sex, DATA$adult))
##D 
##D library(ggplot2);library(reshape2)
##D dat <- character_table(DATA$state, list(DATA$sex, DATA$adult))
##D dat2 <- colsplit2df(melt(counts(dat)), keep.orig = TRUE)
##D head(dat2, 15)
##D 
##D ggplot(data = dat2, aes(y = variable, x = value, colour=sex)) +
##D     facet_grid(adult~.) +
##D     geom_line(size=1, aes(group =variable), colour = "black") +
##D     geom_point()
##D 
##D ggplot(data = dat2, aes(x = variable, y = value)) +
##D     geom_bar(aes(fill = variable), stat = "identity") +
##D     facet_grid(sex ~ adult, margins = TRUE) +
##D     theme(legend.position="none")
## End(Not run)




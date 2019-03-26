library(qdap)


### Name: question_type
### Title: Count of Question Type
### Aliases: question_type
### Keywords: question, question-count

### ** Examples

## Not run: 
##D ## Inspect the algorithm classification
##D x <- c("Kate's got no appetite doesn't she?",
##D     "Wanna tell Daddy what you did today?",
##D     "You helped getting out a book?", "umm hum?",
##D     "Do you know what it is?", "What do you want?",
##D     "Who's there?", "Whose?", "Why do you want it?",
##D     "Want some?", "Where did it go?", "Was it fun?")
##D 
##D left_just(preprocessed(question_type(x))[, c(2, 6)])
##D 
##D ## Transcript/dialogue examples
##D (x <- question_type(DATA.SPLIT$state, DATA.SPLIT$person))
##D 
##D ## methods
##D scores(x)
##D plot(scores(x))
##D counts(x)
##D plot(counts(x))
##D proportions(x)
##D plot(proportions(x))
##D truncdf(preprocessed(x), 15)
##D plot(preprocessed(x))
##D 
##D plot(x)
##D plot(x, label = TRUE)
##D plot(x, label = TRUE, text.color = "red")
##D question_type(DATA.SPLIT$state, DATA.SPLIT$person, percent = FALSE)
##D DATA[8, 4] <- "Won't I distrust you?"
##D question_type(DATA.SPLIT$state, DATA.SPLIT$person)
##D DATA <- qdap::DATA
##D with(DATA.SPLIT, question_type(state, list(sex, adult)))
##D 
##D out1 <- with(mraja1spl, question_type(dialogue, person))
##D ## out1
##D out2 <- with(mraja1spl, question_type(dialogue, list(sex, fam.aff)))
##D ## out2
##D out3 <- with(mraja1spl, question_type(dialogue, list(sex, fam.aff),
##D    percent = FALSE))
##D plot(out3, label = TRUE, lab.digits = 3)
## End(Not run)




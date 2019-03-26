library(qdap)


### Name: sentSplit
### Title: Sentence Splitting
### Aliases: sentSplit sentCombine TOT sent_detect sent_detect_nlp
### Keywords: sentence, split, turn-of-talk

### ** Examples

## Not run: 
##D ## `sentSplit` EXAMPLE:
##D (out <- sentSplit(DATA, "state"))
##D out %&% check_text()  ## check output text
##D sentSplit(DATA, "state", stem.col = TRUE)
##D sentSplit(DATA, "state", text.place = "left")
##D sentSplit(DATA, "state", text.place = "original")
##D sentSplit(raj, "dialogue")[1:20, ]
##D 
##D ## plotting
##D plot(out)
##D plot(out, grouping.var = "person")
##D 
##D out2 <- sentSplit(DATA2, "state", rm.var = c("class", "day"))
##D plot(out2)
##D plot(out2, grouping.var = "person")
##D plot(out2, grouping.var = "person", rm.var = "day")
##D plot(out2, grouping.var = "person", rm.var = c("day", "class"))
##D 
##D ## `sentCombine` EXAMPLE:
##D dat <- sentSplit(DATA, "state") 
##D sentCombine(dat$state, dat$person)
##D truncdf(sentCombine(dat$state, dat$sex), 50)
##D 
##D ## `TOT` EXAMPLE:
##D dat <- sentSplit(DATA, "state") 
##D TOT(dat$tot)
##D 
##D ## `sent_detect`
##D sent_detect(DATA$state)
##D 
##D ## NLP based sentence splitting 
##D sent_detect_nlp(DATA$state)
## End(Not run)




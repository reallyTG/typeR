library(qdap)


### Name: colcomb2class
### Title: Combine Columns to Class
### Aliases: colcomb2class

### ** Examples

## Not run: 
##D ## `termco` example
##D ml <- list(
##D     cat1 = c(" the ", " a ", " an "),
##D     cat2 = c(" I'" ),
##D     "good",
##D     the = c("the", " the ", " the", "the")
##D )
##D dat1 <- with(raj.act.1,  termco(dialogue, person, ml))
##D colcomb2class(dat1, list(cats = c("cat1", "cat2")))
##D 
##D ## `question_type` example
##D dat2 <- question_type(DATA.SPLIT$state, DATA.SPLIT$person)
##D combs <- list(
##D     `wh/how` = c("what", "how"), 
##D     oth = c("shall", "implied_do/does/did")
##D )
##D colcomb2class(dat2, combs)
##D 
##D ## `pos_by` example
##D dat3 <- with(DATA, pos_by(state, list(adult, sex)))
##D colcomb2class(dat3, qcv(DT, EX, FW))
##D 
##D 
##D ## data.frame example
##D dat4 <- data.frame(X=LETTERS[1:5], matrix(sample(0:5, 20, TRUE), ncol = 4))
##D colcomb2class(dat4, list(new = c("X1", "X4")))
## End(Not run)




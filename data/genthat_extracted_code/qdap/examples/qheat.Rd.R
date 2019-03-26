library(qdap)


### Name: qheat
### Title: Quick Heatmap
### Aliases: qheat qheat.default qheat.diversity qheat.termco
###   qheat.word_stats qheat.character_table qheat.question_type
###   qheat.pos_by
### Keywords: heatmap

### ** Examples

## Not run: 
##D dat <- sentSplit(DATA, "state")
##D ws.ob <- with(dat, word_stats(state, list(sex, adult), tot=tot))
##D qheat(ws.ob)
##D qheat(ws.ob) + coord_flip()
##D qheat(ws.ob, order.by = "sptot", 
##D     xaxis.col = c("red", "black", "green", "blue"))
##D qheat(ws.ob, order.by = "sptot")
##D qheat(ws.ob, order.by = "-sptot")
##D qheat(ws.ob, values = TRUE)
##D qheat(ws.ob, values = TRUE, text.color = "red")
##D qheat(ws.ob, "yellow", "red", grid = FALSE)
##D qheat(mtcars, facet.vars = "cyl")
##D qheat(mtcars, facet.vars = c("gear", "cyl"))
##D qheat(t(mtcars), by.column=FALSE)
##D qheat(cor(mtcars), diag.na=TRUE, diag.value="", by.column=NULL, values = TRUE)
##D 
##D dat1 <- data.frame(G=LETTERS[1:5], matrix(rnorm(20), ncol = 4))
##D dat2 <- data.frame(matrix(LETTERS[1:25], ncol=5))
##D qheat(dat1, values=TRUE)
##D qheat(dat1, values=TRUE, mat2=dat2)
## End(Not run)




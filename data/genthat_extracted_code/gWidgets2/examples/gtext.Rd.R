library(gWidgets2)


### Name: gtext
### Title: Multiline text edit constructor
### Aliases: .gtext dispose.GText gtext insert insert.GText svalue.GText

### ** Examples

## Not run: 
##D w <- gwindow("gtext example", visible=FALSE)
##D g <- gvbox(cont=w)
##D t1 <- gtext("initial text", container=g)
##D t2 <- gtext("monospace", font.attr=list(family="monospace"), container=g)
##D insert(t2, "new text in bold", font.attr=list(weight="bold"))
##D visible(w) <- TRUE
## End(Not run)




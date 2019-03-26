library(gWidgets2)


### Name: glabel
### Title: Basic label widget
### Aliases: .glabel glabel svalue<-.GLabel

### ** Examples

## Not run: 
##D w <- gwindow("gformlayout", visible=FALSE)
##D g <- gvbox(container=w)
##D g$set_borderwidth(10)
##D 
##D l1 <- glabel("static label", container=g)
##D l2 <- glabel("bold label", container=g)
##D font(l2) <- list(weight="bold")
##D l3 <- glabel("editable label. Click me", editable=TRUE, container=g)
##D 
##D visible(w) <- TRUE
##D 
## End(Not run)




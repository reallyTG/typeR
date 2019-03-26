library(qdap)


### Name: Animate.character
### Title: Animate Character
### Aliases: Animate.character

### ** Examples

## Not run: 
##D Animate(DATA[["state"]])
##D Animate(DATA[["state"]], color="red")
##D Animate(DATA[["state"]], color=RColorBrewer::brewer.pal(11, "Set3"), size=10)
##D cls <- DATA[["person"]] %l% data.frame(levels(DATA[["person"]]), 
##D     RColorBrewer::brewer.pal(5, "Set3"))
##D Animate(DATA[["state"]], color=cls, size=10, width=30)
##D cls2 <- DATA[["sex"]] %l% data.frame(c("m", "f"),c("lightblue", "pink"))
##D Animate(DATA[["state"]], color=cls2, just=c(.5, .5), coord = c(.5, .5))
##D 
##D ## Print method
##D print(Animate(DATA[["state"]], color=cls2, just=c(.5, .5), coord = c(.5, .5)), 
##D     pause=.25)
##D Animate(DATA[["state"]], color=sample(colors(), nrow(DATA)), 
##D     size=sample(4:13, nrow(DATA), TRUE), width=30,  just=c(.5, .5), coord = c(.5, .5))
## End(Not run)




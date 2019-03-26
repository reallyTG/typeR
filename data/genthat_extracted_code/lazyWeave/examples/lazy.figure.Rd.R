library(lazyWeave)


### Name: lazy.figure
### Title: Include Figures in Latex Documents
### Aliases: lazy.figure

### ** Examples

## Not run: 
##D pdf("MPG.pdf", height=4, width=4)
##D hist(mtcars$mpg)
##D dev.off()
##D 
##D lazy.figure("MPG.pdf")
##D 
##D lazy.write(
##D lazy.file.start(),
##D lazy.figure("MPG.pdf", 
##D caption="Distribution of Miles per Gallon in mtcars dataset",
##D height=5, width=5, label="MPGgraph"),
##D lazy.file.end(),
##D OutFile="Example-1.tex")
##D 
##D unlink("MPG.pdf")
##D unlink("Example-1.tex")
##D unlink("Example-1.pdf")
## End(Not run)




library(simsalapar)


### Name: wrapLaTable
### Title: Wrapper for a floating LaTeX Table
### Aliases: wrapLaTable
### Keywords: utilities

### ** Examples

ftab <- ftable(Titanic, row.vars = 1:2)
fftab <- fftable(ftab)
tlist <- tablines(fftab)

wrapLaTable(structure(tlist$body, head = tlist$head), align = tlist$align,
            caption="The Titanic data set.", label="tab:titanic")




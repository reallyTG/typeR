library(DOT)


### Name: dot
### Title: Render and Export DOT Graphs in R
### Aliases: dot
### Keywords: diagram graphics literate plot visualization

### ** Examples

#create a simple DOT graph and load it in RStudio
dot("digraph {A -> B;}")

#to produce a dynamic document including a diagram in 'rmarkdown'
## Not run: 
##D ```{r echo=FALSE, results='asis'}
##D library(DOT)
##D dot("digraph {A -> B;}", return = "cat")
##D ```
## End(Not run)


#create a DOT graph and export a SVG file to the working directory
dot("digraph {A -> B; B -> C; B -> D;}", file = "myfile.svg")

#export the example above in PostScript format
dot("digraph {A -> B; B -> C; B -> D;}", file = "myfile.ps")

#create a DOT graph and save the script in a string object in R
myString <- dot("digraph {A -> B;}", return = "verbatim")




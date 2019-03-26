library(HH)


### Name: likertColor
### Title: Selection of colors for Likert plots.
### Aliases: likertColor likertColorBrewer brewer.pal.likert ColorSet
### Keywords: hplot

### ** Examples

brewer.pal.likert(4, "RdBu")
brewer.pal.likert(5, "RdBu")
ColorSet(4)
ColorSet(4, 2)
likertColor(4)
likertColor(4, 2.5) ## same as above
likertColor(4, 2)   ## one negative level and two positive levels: default
likertColor(5, 3)[-2] ## one negative level and two positive levels: stronger negative

## Not run: 
##D   ## Examples illustrating the six predefined likertColor palettes, and how
##D   ## to define additional hcl color palettes for use with the likert functions.
##D 
##D   data(ProfDiv)
##D   ProfDiv.df <- data.frame(ProfDiv)
##D 
##D   likert( ~ . , ProfDiv.df, horizontal=FALSE, positive.order=FALSE)
##D   likert( ~ . , ProfDiv.df, horizontal=FALSE, positive.order=FALSE,
##D          colorFunctionOption="default")
##D   likert( ~ . , ProfDiv.df, horizontal=FALSE, positive.order=FALSE,
##D          colorFunctionOption="flatter")
##D   likert( ~ . , ProfDiv.df, horizontal=FALSE, positive.order=FALSE,
##D          colorFunction="sequential_hcl")
##D   likert( ~ . , ProfDiv.df, horizontal=FALSE, positive.order=FALSE,
##D          colorFunction="sequential_hcl", colorFunctionOption="default")
##D   likert( ~ . , ProfDiv.df, horizontal=FALSE, positive.order=FALSE,
##D          colorFunction="sequential_hcl", colorFunctionOption="flatter")
##D 
##D   likert(ProfDiv, horizontal=FALSE, positive.order=FALSE)
##D   likert(ProfDiv, horizontal=FALSE, positive.order=FALSE,
##D          colorFunctionOption="default")
##D   likert(ProfDiv, horizontal=FALSE, positive.order=FALSE,
##D          colorFunctionOption="flatter")
##D   likert(ProfDiv, horizontal=FALSE, positive.order=FALSE,
##D          colorFunction="sequential_hcl")
##D   likert(ProfDiv, horizontal=FALSE, positive.order=FALSE,
##D          colorFunction="sequential_hcl", colorFunctionOption="default")
##D   likert(ProfDiv, horizontal=FALSE, positive.order=FALSE,
##D          colorFunction="sequential_hcl", colorFunctionOption="flatter")
##D 
##D   likertMosaic(ProfDiv.df)
##D   likertMosaic(ProfDiv.df, colorFunctionOption="default")
##D   likertMosaic(ProfDiv.df, colorFunctionOption="flatter")
##D   likertMosaic(ProfDiv.df, colorFunction="sequential_hcl")
##D   likertMosaic(ProfDiv.df, colorFunction="sequential_hcl",
##D                colorFunctionOption="default")
##D   likertMosaic(ProfDiv.df, colorFunction="sequential_hcl",
##D                colorFunctionOption="flatter")
##D 
##D   ## specify an hcl palette for use with the likert functions.
##D   BlueOrange <- likertColor(nc=4, ReferenceZero=NULL,
##D                             colorFunction="diverge_hcl",
##D                             colorFunctionArgs=
##D                               list(h=c(246, 40), c=96, l=c(65,90), power=1.5))
##D   likert( ~ . , ProfDiv.df, horizontal=FALSE, positive.order=FALSE, col=BlueOrange)
## End(Not run)




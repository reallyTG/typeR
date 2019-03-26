library(tagcloud)


### Name: plot.tagcloud
### Title: Tag and Word Clouds
### Aliases: plot.tagcloud print.tagcloud print.tagcloudsummary
###   summary.tagcloud tagcloud tagcloud-class tagcloud-package
### Keywords: cloud list tag tags weighted word

### ** Examples

# a rather boring tag cloud
data( gambia )
terms <- gambia$Term
tagcloud( terms )

# tag cloud with weights relative to P value
# colors relative to odds ratio, from light
# grey to black
weights <- -log( gambia$Pvalue )
colors  <- smoothPalette( gambia$OddsRatio, max=4 )
tagcloud( terms, weights, col= colors, algorithm= "oval" )

# tag cloud filling the whole plot
tagcloud( terms, weights, col= colors, algorithm= "fill" )

# just a list of only the first ten terms
tagcloud( terms, weights, sel= 1:10,
          col= colors, algorithm= "list", order= "width" )

# oval, with line breaks in terms
terms <- strmultline( gambia$Term )
tagcloud( terms, weights, col= colors, algorithm= "oval" )

## Not run: 
##D # shows available font families, scaled according to
##D # the total disk space occupied by the fonts
##D require( extrafont )
##D ft <- fonttable()
##D fi <- file.info( fonttable()$fontfile )
##D families <- unique( ft$FamilyName )
##D sizes    <- sapply( families,function( x ) sum( fi[ ft$FamilyName == x, "size" ] ) )
##D tagcloud( families, sizes, family= families )
## End(Not run)




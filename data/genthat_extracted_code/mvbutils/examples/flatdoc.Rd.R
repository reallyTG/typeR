library(mvbutils)


### Name: flatdoc
### Title: Flat-format documentation
### Aliases: flatdoc
### Keywords: documentation programming

### ** Examples

## Not run: 
##D ## Put next lines up to "<<end of doc>>" into a text file <<your filename>>
##D ## and remove the initial hashes
##D #structure( function( x) {
##D #  x*x
##D #}
##D #,doc=flatdoc("<<end of doc>>"))
##D #
##D #Here is some informal documentation for the "SQUARE" function
##D #<<end of doc>>
##D ## Now try SQUARE <- source.mvb( <<your filename>>); ?SQUARE
##D ## Example with multiple attributes
##D ## Put the next lines up to "<<end of part 2>>"
##D ## into a text file, and remove the single hashes
##D #myfun <- structure( function( attname) {
##D #  attr( sys.function(), attname)
##D #}
##D #,  att1=flatdoc( EOF="<<end of part 1>>")
##D #,  att2=flatdoc( EOF="<<end of part 2>>"))
##D #This goes into "att1"
##D #<<end of part 1>>
##D #and this goes into "att2"
##D #<<end of part 2>>
##D ## Now "source.mvb" that file, to create "myfun"; then:
##D myfun( 'att1') # "This goes into \\"att1\\""
##D myfun( 'att2') # "and this goes into \\"att2\\""
## End(Not run)




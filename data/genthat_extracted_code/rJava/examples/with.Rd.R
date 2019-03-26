library(rJava)


### Name: with.jobjRef
### Title: with and within methods for Java objects and class names
### Aliases: with.jobjRef within.jobjRef with.jarrayRef within.jarrayRef
###   with.jclassName within.jclassName
### Keywords: classes

### ** Examples

## Don't show: 
.jinit()
## End(Don't show)

if (!nzchar(Sys.getenv("NOAWT"))) {
  p <- .jnew( "java/awt/Point", 0L, 0L )
  with( p, {
	# x and y and now 0
	move( 10L, 10L )
	# x and y are now 10
	x <- x + y
  } )

  f <- within( .jnew( "javax/swing/JFrame" ) , {
	layout <- .jnew( "java/awt/BorderLayout" )
	setLayout( layout )
	add( .jnew( "javax/swing/JLabel", "north" ), layout$NORTH )
	add( .jnew( "javax/swing/JLabel", "south" ), layout$SOUTH )
	add( .jnew( "javax/swing/JLabel", "west" ), layout$WEST )
	add( .jnew( "javax/swing/JLabel", "east" ), layout$EAST )
	setSize( .jnew( "java/awt/Dimension", 400L, 400L ) )
	setVisible( TRUE )
  } )
}

Double <- J("java.lang.Double")
with( Double, MIN_VALUE )
with( Double, parseDouble( "10.2" ) )

## Not run: 
##D # inner class example
##D 
##D HashMap <- J("java.util.HashMap")
##D with( HashMap, new( SimpleEntry, "key", "value" ) )
##D with( HashMap, SimpleEntry )
## End(Not run)

with( J("java.lang.System"), getProperty("java.home") )

## Don't show: 
stopifnot( with( Double, parseDouble("10.0") ) == 10.0 )
d <- new( Double, "10.0") 
stopifnot( with( d, doubleValue() ) == 10.0 )
## End(Don't show)





library(rJava)


### Name: J
### Title: High level API for accessing Java
### Aliases: J
### Keywords: interface

### ** Examples

## Don't show: 
.jinit()
## End(Don't show)

if (!nzchar(Sys.getenv("NOAWT"))) {
  f <- new(J("java.awt.Frame"), "Hello")
  f$setVisible(TRUE)
}

J("java.lang.Double")$parseDouble("10.2")
J("java.lang.Double", "parseDouble", "10.2" )

Double <- J("java.lang.Double")
Double$parseDouble( "10.2")

# String[] strings = new String[]{ "string", "array" } ;
  strings <- .jarray( c("string", "array") )
# this uses the JList( Object[] ) constructor 
# even though the "strings" parameter is a String[] 
  l <- new( J("javax.swing.JList"), strings)





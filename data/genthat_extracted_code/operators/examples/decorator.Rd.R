library(operators)


### Name: character decorator
### Title: Creates string decorators by repeating a pattern
### Aliases: %x=% %x=|% strrep
### Keywords: manip

### ** Examples

"=" %x=% 80
"<-+->" %x=|% 80
strrep( ".-", n = 10 )
strrep( ".-", length.out = 50 )
strrep( ".-" )




library(Epi)


### Name: lgrep
### Title: Convenience versions of grep
### Aliases: fgrep ngrep lgrep
### Keywords: manip

### ** Examples

ff <- factor( ll <- paste( sample( letters[1:3], 20, replace=TRUE ),
                           sample( letters[1:3], 20, replace=TRUE ), sep="" ) )
ff
fgrep( "a", ff )
fgrep( "a", ll )
ngrep( "a", ff )
lgrep( "a", ff )
lgrep( "a", ff, invert=TRUE )




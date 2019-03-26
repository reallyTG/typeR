library(sos)


### Name: back2ForwardSlash
### Title: Replace backslash with forward slash in a character string
### Aliases: back2ForwardSlash
### Keywords: manip

### ** Examples


(x <- back2ForwardSlash())
#c:\users\

#NOTE:  The "#" in this example is not needed.
# It is included here to suppress a spurious warning
# in the automated testing of the package via "R CMD check".

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(x, '#c:/users/')
## Don't show: 
)
## End(Don't show)

(x2. <- back2ForwardSlash(2))
#c:\u\a b\n o
#d:\pqr\

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(x2., c('#c:/u/a b/n o', '#d:/pqr/'))
## Don't show: 
)
## End(Don't show)






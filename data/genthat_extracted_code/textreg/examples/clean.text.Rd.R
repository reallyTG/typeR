library(textreg)


### Name: clean.text
### Title: Clean text and get it ready for textreg.
### Aliases: clean.text

### ** Examples

library( tm )
txt = c( "thhis s! and bonkus  4:33pm and Jan 3, 2015. ", 
         "   big    space\n     dawg-ness?")
a <- clean.text( VCorpus( VectorSource( txt ) ) )
a[[1]]




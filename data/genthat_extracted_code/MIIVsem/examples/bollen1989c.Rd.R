library(MIIVsem)


### Name: bollen1989c
### Title: Subjective class data
### Aliases: bollen1989c
### Keywords: datasets

### ** Examples


## Not run: 
##D  model <-    '
##D 	subinc  ~ inc + subocc
##D    subocc  ~ occ + subinc
##D    subgen  ~ subinc + subocc
##D 	subinc ~~ subocc + subgen
##D    subocc ~~ subgen
##D 	inc    ~~ occ
##D  '
## End(Not run)





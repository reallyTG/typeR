library(rPref)


### Name: show.pref
### Title: Partial Evaluation and String Output of Preferences
### Aliases: as.character,basepref-method as.character,complexpref-method
###   as.character,emptypref-method as.character,preference-method
###   as.character,reversepref-method partial.eval.pref pref.str show.pref

### ** Examples


f <- function(x) 2*x
p <- true(cyl == f(1))

# prints 'true(cyl == f(1))'
p

# prints 'true(cyl == 2)'
show.pref(p, mtcars)
partial.eval.pref(p, mtcars)





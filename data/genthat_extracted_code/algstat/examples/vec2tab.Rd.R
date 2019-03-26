library(algstat)


### Name: vec2tab
### Title: Vector to Array conversion
### Aliases: vec2tab

### ** Examples

data(Titanic)
Titanic
tab2vec(Titanic)
vec2tab(tab2vec(Titanic), dim(Titanic))
vec2tab(tab2vec(Titanic), dim(Titanic)) == Titanic
all(vec2tab(tab2vec(Titanic), dim(Titanic)) == Titanic)




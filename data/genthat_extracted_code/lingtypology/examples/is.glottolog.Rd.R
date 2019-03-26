library(lingtypology)


### Name: is.glottolog
### Title: Are these languages in glottolog?
### Aliases: is.glottolog

### ** Examples

is.glottolog(c('Adyghe', 'Russian'))
is.glottolog('Buyaka')

# Add warning message with sugestions
is.glottolog(c('Adygey', 'Russian'), response = TRUE)
# > FALSE TRUE
# Warning message:
# In is.glottolog(c('Adyge', 'Russian'), response = TRUE) :
# Language Adyge is absent in our version of the Glottolog database. Did you mean Aduge, Adyghe?





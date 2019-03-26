library(varhandle)


### Name: save.var
### Title: Save variables separate files
### Aliases: save.var
### Keywords: save variable save to file

### ** Examples

# generate variables dynamically
lapply(letters, function(x){assign(x=x, value=rnorm(1), env=globalenv())})
# simple usage
save.var()
# specify a listof variables with tag
save.var(varlist=c("a","e","i","o","u"), newdirtag="just_vowels")





library(mvp)


### Name: subs
### Title: Substitution
### Aliases: subs subsy substitute subsmvp subs_mvp mvp_subs_mvp
### Keywords: symbolmath

### ** Examples

p <- rmvp(6,2,2,letters[1:3])
p
subs(p,a=1)
subs(p,a=1,b=2)

subs(p,a="1+b x^3",b="1-y")
subs(p,a=1,b=2,c=3,drop=FALSE)

do.call(subs,c(list(as.mvp("z")),rep(c(z="C+z^2"),5)))


kahle(5,3,1:3) %>% subs(a="a + delta")





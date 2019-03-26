library(pgirmess)


### Name: postxt
### Title: Computes coordinates defined from their relative position on x
###   and y in the plotting region
### Aliases: postxt
### Keywords: dplot

### ** Examples


plot(rnorm(30),rnorm(30),type="n")
text(postxt("ul"),"here",pos=4)
text(postxt("ur"),"here again",pos=2)
text(postxt("bc"),"again and again")





library(riverdist)


### Name: trimriver
### Title: Trim a River Network Object to Specified Segments
### Aliases: trimriver

### ** Examples

data(Kenai1)
plot(x=Kenai1)

Kenai1.trim <- trimriver(trim=c(46,32,115,174,169,114,124,142,80), rivers=Kenai1)
plot(x=Kenai1.trim)
 
Kenai1.trim.2 <- trimriver(trimto=c(20,57,118,183,45,162,39,98,19), rivers=Kenai1)
plot(x=Kenai1.trim.2)




library(imager)


### Name: highlight
### Title: Highlight pixel set on image
### Aliases: highlight

### ** Examples

#Select similar pixels around point (180,200)
px <- px.flood(boats,180,200,sigma=.08)
plot(boats)
#Highlight selected set
highlight(px)
px.flood(boats,18,50,sigma=.08) %>% highlight(col="white",lwd=3)




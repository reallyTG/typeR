library(broman)


### Name: strwidth2xlim
### Title: Calculate horizontal limit in user coordinates for adding labels
### Aliases: strwidth2xlim

### ** Examples

x <- runif(15,-1,1)*10
xlabs <- sapply(sample(1:20,15,replace=TRUE),
         function(a) paste(LETTERS[1:a], collapse=""))
## Labels to the left ##
xlims <- strwidth2xlim(x,xlabs,pos=2)
plot(x,1:length(x),xlim=xlims)
text(x,1:length(x),xlabs,pos=2)
## Labels to the right ##
xlims <- strwidth2xlim(x,xlabs,pos=4,cex=0.7)
plot(x,1:length(x),xlim=xlims)
text(x,1:length(x),xlabs,pos=4,cex=0.7)





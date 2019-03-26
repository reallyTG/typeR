library(broman)


### Name: strwidth2lines
### Title: Calculate width of a character string in number of lines
### Aliases: strwidth2lines

### ** Examples

p <- par(TRUE)
string <- sapply(sample(1:20,15,replace=TRUE),
         function(a) paste(LETTERS[1:a], collapse=""))
nlines <- strwidth2lines(string)
mar <- par("mar")
par(mar=c(mar[1],nlines+0.1,mar[3:4]))
  plot(1:length(string),1:length(string),yaxt="n", ylab="")
  axis(side=2, at=seq_along(string), lab=string, las=1)
par(p)
nlines <- strwidth2lines(string,cex=1.5)
par(mar=c(mar[1:3],nlines+0.1))
  plot(1:length(string),1:length(string),ylab="")
  mgp <- par("mgp")
  axis(side = 4, at=seq_along(string),
    labels = string ,las=1, hadj=1,
       mgp=c(mgp[1],nlines,mgp[3]),cex.axis=1.5)
par(p)




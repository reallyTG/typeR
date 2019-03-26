library(mapmisc)


### Name: col2html
### Title: Convert colours to HTML hex
### Aliases: col2html

### ** Examples

col2html(1:10)
col2html(c('red','blue'),0.5)
col2html(c(2,4),0.5)
col2html(c(stuff='red',foo='blue'),alpha=128)
col2html(c('red','blue'),alpha='80')
col2html(c(2,4),alpha='80')

N = length(palette())
plot(1:N, rep(1,N),xlim=c(0,N),pch=16,cex=5,
col=col2html(1:N))
points(1:N, rep(1,N),pch=15,cex=4.5, col=palette())
text(-0.5+1:10, rep(1,10), col2html(1:10),srt=90)
text(1:N, rep(0.7,N), palette())
text(1:N-0.5, rep(1.3, N), col2html(palette()), cex=0.7)




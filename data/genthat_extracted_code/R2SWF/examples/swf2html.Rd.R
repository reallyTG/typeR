library(R2SWF)


### Name: swf2html
### Title: Embed the SWF file into an HTML page
### Aliases: swf2html

### ** Examples

output = dev2swf({
  for (i in 1:10) plot(runif(20), ylim = c(0, 1))
}, output = 'test.swf')
swf2html(output)




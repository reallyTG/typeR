library(R2SWF)


### Name: dev2swf
### Title: Convert R graphics to SWF using different graphics devices
### Aliases: dev2swf

### ** Examples

olddir = setwd(tempdir())
output1 = dev2swf({
  for(i in 1:10) plot(runif(20), ylim = c(0, 1))
}, dev='png', file.ext='png', output='movie-png.swf')
swf2html(output1)

if(capabilities("cairo")) {
    output2 = dev2swf({
        for(i in 1:10) plot(runif(20), ylim = c(0, 1))
    }, dev='svg', file.ext='svg', output='movie-svg.swf')
}
swf2html(output2)

setwd(olddir)




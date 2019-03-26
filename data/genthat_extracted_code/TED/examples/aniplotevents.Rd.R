library(TED)


### Name: aniplotevents
### Title: Generate a gif to visualise the event detection process
### Aliases: aniplotevents

### ** Examples

set.seed(123)
# generate an artificial time series
x=c(rnorm(128),cbfs(type='box'),rnorm(128),cbfs(type='rc'),rnorm(128))
# generate a gif file to show the event detection process
## Not run: 
##D aniplotevents(x,w=128,noiseType='white',outdir=getwd())
## End(Not run)




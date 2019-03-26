library(dirmcmc)


### Name: iact
### Title: Integrated Auto correlation times of a Markov Chain
### Aliases: iact
### Keywords: dmh. iact, mcmc,

### ** Examples

## Not run: 
##D ## Banana Target
##D lupost.banana <- function(x,B){
##D  -x[1]^2/200 - 1/2*(x[2]+B*x[1]^2-100*B)^2
##D }
##D Banana Gradient
##D gr.banana <- function(x,B){
##D  g1 <- -x[1]/100 - 2*B*(x[2]+B*x[1]^2-100*B)
##D  g2 <- -(x[2]+B*x[1]^2-100*B)
##D  g <- c(g1,g2)
##D  return(g)
##D } 
##D out.metdir.banana <- metropdir(obj = lupost.banana, dobj = gr.banana,
##D initial = c(0,1),lchain = 2000,
##D sd.prop=1.25,
##D steplen=0.01,s=1.5,B=0.03)
##D iact(out.metdir.banana$batch[,1])
## End(Not run)




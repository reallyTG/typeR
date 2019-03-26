library(STAR)


### Name: %tt%
### Title: Time Transformation Using a gssanova Objet
### Aliases: %tt%
### Keywords: ts survival htest

### ** Examples

## Not run: 
##D ## load e060517spont data set
##D data(e060517spont)
##D ## make a data frame using a 2 ms bin width
##D e060517spontDF <- mkGLMdf(e060517spont,0.002,0,60)
##D ## Keep data relevant to neuron 3
##D e060517spontDFn3 <- e060517spontDF[e060517spontDF$neuron == "3",]
##D ## Split data in an "early" and a "late" part
##D e060517spontDFn3e <- e060517spontDFn3[e060517spontDFn3$time <= 30,]
##D e060517spontDFn3l <- e060517spontDFn3[e060517spontDFn3$time > 30,]
##D ## fit the late part with a nonparametric renewal model
##D e060517spontDFn3lGF <- gssanova(event ~ lN.3, data=e060517spontDFn3l,family="binomial")
##D ## transform the time of the early part
##D e060517spont.n3e.tt <- e060517spontDFn3lGF %tt% e060517spontDFn3e
##D ## Test the goodness of fit
##D e060517spont.n3e.tt
##D summary(e060517spont.n3e.tt)
##D plot(summary(e060517spont.n3e.tt))
## End(Not run)




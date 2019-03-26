library(control)


### Name: feedback
### Title: Feedback Connection of LTI systems
### Aliases: feedback fdbcksys

### ** Examples

C <- pid(350,300,50)
P <- TF(" 1/(s^2 + 10* s + 20)")
feedback(C,P)
feedback(P,P,1)
feedback(P,P,-1)
feedback(P,P)
feedback(P,1)
feedback(TF("C*P"))
## Not run:  On Octave: feedback(C*P)





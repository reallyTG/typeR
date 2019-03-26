library(primer)


### Name: succniche
### Title: A Four-state model of Successional Dynamics
### Aliases: succniche
### Keywords: methods

### ** Examples

params.suc <- c(a=7, c=0.2, g=.1, m=0.04, D=0)
t=seq(0,50,.1)
init.suc <- c(S=0, E=0.5, M=0.5, R=0.00) # Free space is implicit, F=1-(S+E+M+R).
ccg.out <- data.frame(ode(init.suc, t, succniche, params.suc))
matplot(t, ccg.out[,-1], type="l", ylab="Relative Frequency", 
         xlab="Time", ylim=c(0,1) )
legend("right", colnames(ccg.out)[5:2], lty=4:1,  bty="n")




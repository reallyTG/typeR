library(control)


### Name: pid
### Title: Proportional-Integral-Derivative (PID) Controller
### Aliases: pid

### ** Examples

C <- pid(350,300,50) # PID-control
P <- TF(" 1/(s^2 + 10* s + 20)")
T <- feedback(TF("C*P"), 1)
stepplot(T, seq(0,2,0.01))

C <- pid(300,0,0) # P-control
T <- feedback(TF("C*P"), 1)
stepplot(T, seq(0,2,0.01))

C <- pid(30,70,0) # PI-control
T <- feedback(TF("C*P"), 1)
stepplot(T, seq(0,2,0.01))

C <- pid(300,0,10) # PD-control
T <- feedback(TF("C*P"), 1)
stepplot(T, seq(0,2,0.01))





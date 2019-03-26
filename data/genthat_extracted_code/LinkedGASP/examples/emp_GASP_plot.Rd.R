library(LinkedGASP)


### Name: emp_GASP_plot
### Title: Empirical linked GASP plot
### Aliases: emp_GASP_plot
### Keywords: print

### ** Examples

## Function f1 is a simulator
f1<-function(x){sin(pi*x)}
## Function f2 is a simulator
f2<-function(x){cos(5*x)}

## Function f2(f1) is a simulator of a composite model
f2f1 <- function(x){f2(f1(x))}

## One-dimensional inputs are x1
x1 <- seq(-1,1,.37)

## The following contains the list of data inputs (training) and outputs (fD) together with the
## assumed fixed smoothness of a computer model output.
data.f1 <- list(training = x1,fD = f1(x1), smooth = 1.99)

## Evaluation of GASP parameters
f1_MLEs = eval_GASP_RFP(data.f1,list(function(x){x^0},function(x){x^1}),1,FALSE)

## Evaluate the emulator
xn = seq(-1,1,.01)
GASP_type2_f1 <- eval_type2_GASP(as.matrix(xn),f1_MLEs)

par(mfrow = c(1,1))
par(mar = c(6.1, 6.1, 5.1, 2.1))
ylim = c(-1.5,1.5)
GASP_plot(GASP_type2_f1,f1,data.f1,"Type 2 GASP",ylab = " f",xlab = "x",
ylim = ylim, plot_training = TRUE)

s = GASP_type2_f1$mu
s.var = diag(GASP_type2_f1$var)

x2 = seq(-0.95,0.95,length = 6)#f1(x1)
data.f2 <- list(training = x2,fD = f2(x2), smooth = 2) # linking requires this emulator 
## to have smoothness parameter equal to 2

f2_MLEs = eval_GASP_RFP(data.f2,list(function(x){x^0},function(x){x^1}),1,FALSE)

GASP_type1_f2 <- eval_type1_GASP(as.matrix(seq(-3.5,3.5,.01)),f2_MLEs)
GASP_type2_f2 <- eval_type2_GASP(as.matrix(seq(-1,1,.01)),f2_MLEs)
TGASP_f2 <- eval_TGASP(as.matrix(seq(-1,1,.01)),f2_MLEs)

ylim = c(-1.5,1.5)
# labels = c(expression(phantom(x)*phantom(x)*phantom(x)*f(x[1])),
# expression(f(x[2])*phantom(x)*phantom(x)*phantom(x)),
# expression(f(x[3])),expression(f(x[4])),
# expression(f(x[5])),expression(f(x[6])))

par(mar = c(6.1, 6.1, 5.1, 2.1))
GASP_plot(GASP_type2_f2,f2,data.f2, "Type 2 GASP",labels = x2,xlab= "z",ylab = " g",
ylim = ylim,plot_training = TRUE)

le <- link(f1_MLEs, f2_MLEs, as.matrix(xn))

## Construct an empirical emulator
n.samples = 100
em2.runs<-mat.or.vec(n.samples,length(s))
library(MASS)
for(i in 1:n.samples) {
  GASP = eval_type2_GASP(as.matrix(mvrnorm(1,s,diag(s.var))),f2_MLEs)
  em2.runs[i,] <- mvrnorm(1,GASP$mu, GASP$var)
}

## Plot the empirical GASP emulator
data.f2f1 <- list(training = x1,fD = f2f1(x1), smooth = 2)

par(mar = c(6.1, 6.1, 5.1, 2.1))
emp_GASP_plot(le$em2,f2f1,data.f2f1,"Linked",apply(em2.runs,2,quantile,probs = 0.025),
              apply(em2.runs,2,quantile,probs = 0.975),
              ylab = expression("g" ~ scriptscriptstyle(O) ~ "f"),xlab = "x, input",ylim = ylim)




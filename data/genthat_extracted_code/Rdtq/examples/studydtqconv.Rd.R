library(Rdtq)


### Name: studydtqconv
### Title: Study DTQ Convergence
### Aliases: studydtqconv

### ** Examples

# In this example, we will study the convergence of the DTQ method
# for the SDE with drift f(x) = x/2 + (1 + x^2)^(1/2) and
# diffusion g(x) = (1 + x^2)^(1/2).

library(Rdtq)
library(Rcpp)

# implement the drift and diffusion functions using C++
sourceCpp(code = '#include <Rcpp.h>
          using namespace Rcpp;
          double drift(double& x) { return(0.5*x + sqrt(x*x + 1.0)); }
          double diff(double& x) { return(sqrt(x*x + 1.0)); }
          typedef double (*funcPtr)(double& x);
          // [[Rcpp::export]]
          XPtr<funcPtr> driftXPtr() { return(XPtr<funcPtr>(new funcPtr(&drift))); }
          // [[Rcpp::export]]
          XPtr<funcPtr> diffXPtr() { return(XPtr<funcPtr>(new funcPtr(&diff))); }')

# implement the drift and diffusion functions using R
mydrift = function(y)
{
  return(0.5*y + sqrt(y^2 + 1))
}
mydiff = function(y)
{
  return(sqrt(y^2 + 1))
}

# implement the exact solution at time t, i.e.,
# the analytical formula for the pdf p(x,t)
exactsol = function(xvec,t)
{
  transx = asinh(xvec) - t
  prefac = (1 + xvec^2)^(-1/2)
  z = prefac*dnorm(x=transx)
  return(z)
}

# define the sequence of parameters that will be used to study convergence
hseq = c(0.5,0.2,0.1,0.05)
kseq = hseq^(0.55)
Mseq = ceiling(5*(-log(hseq))/kseq)

# we will use the method="sparse" code for the three largest values in hseq,
# and then switch to the method="cpp" code for the three smallest values
firstpart = c(1:2)
errpart1 = studydtqconv(method="sparse",drift=mydrift,diffusion=mydiff,exact=exactsol,
                        hseq[firstpart],kseq[firstpart],Mseq[firstpart],
                        init=0,fT=1)
errpart2 = studydtqconv(method="cpp",drift=driftXPtr(),diffusion=diffXPtr(),exact=exactsol,
                        hseq[-firstpart],kseq[-firstpart],Mseq[-firstpart],
                        init=0,fT=1,thresh=1e-16)

# now we will put everything together into one data frame
mydat = rbind(errpart1,errpart2)

# we plot the convergence diagram, on a log-log scale, using ggplot2
library(ggplot2)
library(scales)
myplot = ggplot(data=mydat, aes(x=x,y=y,group=norm,color=norm))
myplot = myplot + theme_bw() + theme(plot.background = element_rect(fill='white'))
myxticks = sort(10^(round(log(hseq)/log(10)*10)/10))
rawyticks = round(log(mydat$y)/log(10)*10)/10
rawyticks = round(seq(from=min(rawyticks),to=max(rawyticks),length.out=length(myxticks))*1)/1
myyticks = unique(10^rawyticks)
myplot = myplot + scale_x_log10(breaks = hseq)
myplot = myplot + theme(axis.text.x = element_text(angle=90,hjust=1))
myplot = myplot + scale_y_log10(breaks = myyticks,
                                labels = trans_format("log10", math_format(10^.x)))
myplot = myplot + labs(x="h (temporal step size)", y="error")
myplot = myplot + geom_line() + geom_point()

# save the plot to a pdf (portable document format) file
ggsave(filename="example.pdf", plot=myplot, width=5, height=4)




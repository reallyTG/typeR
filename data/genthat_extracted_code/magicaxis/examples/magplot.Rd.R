library(magicaxis)


### Name: magplot
### Title: Magically pretty plots
### Aliases: magplot
### Keywords: plot axis log

### ** Examples

x=10^{1:9}
y=1:9
magplot(log10(x),y,unlog='x')
magplot(x,y,log='x')

#Not ideal to have two decades between major labels:

magplot(x,y,log='x',majorn=c(10,5))
magplot(x,y,log='xy',majorn=c(10,5,5,5),side=1:4)

#Sometimes it is helpful to focus on where most of the data actually is.
#Using a single value for xlim and ylim sigma clips the data to that range.
#Here a value of 2 means we only show the inner 2-sigma (2% to 98%) range.
#The 'auto' option allows magclip to dynamically estimate a clip value.

temp=cbind(rt(1e3,1.5),rt(1e3,1.5))
magplot(temp)
magplot(temp, xlim=2, ylim=2)
magplot(temp, xlim='auto', ylim='auto')

#Some astronomy related examples (and how to display the solar symbol):

temp=cbind(runif(10,8,12),runif(10,0,5))

magplot(temp[,1:2], xlab=expression(M['\u0298']), ylab=expression(M['\u0298']/Yr), unlog='xy')





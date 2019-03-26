library(vmd)


### Name: vmd
### Title: Create VMD Object
### Aliases: R6Vmd as.data.frame.vmd plot.vmd vmd
### Keywords: datasets

### ** Examples

x = seq(-2*pi,2*pi,length.out=1000)
signal = cos(x)
v = vmd(signal,DC=FALSE,tol=1e-3)
v$getResult()
plot(v)

nv   = 1000
fs   = 1/nv
t    = (1:nv)/nv
freq = 2*pi*(1 - 0.5 - 1/nv)/fs
f_1 = 2;
f_2 = 24;
f_3 = 288;
f_4 = 12;
v_1 = (cos(2*pi*f_1*t));
v_2 = 1/4*(cos(2*pi*f_2*t));
v_3 = 1/16*(cos(2*pi*f_3*t));
v_4 = 1/8*(cos(2*pi*f_4*t));
signal = v_1 + v_2 + v_3 + v_4 + 0.5*runif(nv,min=-0.5,max=0.5);
v = vmd(signal,alpha=2000,tau=0,DC=FALSE,init=0,tol=1e-3,K=3,orderModes=TRUE)

#List of Results
l = v$getResult()
names(l)

#To Data Frame
df = as.data.frame(v)
head(df)

#Plot Results
plot(v)
plot(v,facet='bymode',scales='free')
plot(v,facet='byclass',scales='free')

#Input Spectrum
v$plot.input.spectrum()

#Spectral Decomposition
v$plot.spectral.decomposition()





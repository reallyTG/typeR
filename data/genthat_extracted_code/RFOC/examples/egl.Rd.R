library(RFOC)


### Name: egl
### Title: Tungurahua Cartesian Moment Tensors
### Aliases: egl
### Keywords: datasets

### ** Examples



data(egl)

typl1=c(2,4,7,12,13,16,17,18,19,20,24,25,26,27,
28,29,30,31,33,34,35,36,37,38,40,43,50,
59,62,73,74,77,8,79,80,81,83,84)
typl2=c(5,6,8,9,10,11,14,15,22,42,46,47,48,49,
51,52,53,54,55,56,57,58,60,61,63,72,82)

evtns=1:84

par(mfrow=c(1,2))
T1 = TapeBase()
TapePlot(T1)


for(i in 1:length(egl))
{
i1 = egl[[i]]

E1 = list(values=c(i1$lam1, i1$lam2, i1$lam3),
vectors = cbind(i1$vec1, i1$vec2, i1$vec3))

testrightHAND(E1$vectors)

E1$vectors = forcerighthand(E1$vectors)

mo=sort(E1$values,decreasing=TRUE)
# M=sum(mo)/3
# Md=mo-M
h = SourceType(mo)
h$dip = 90-h$phi

h1 = HAMMERprojXY(h$dip*pi/180, h$lam*pi/180)

if(i %in% typl1) { col="red" }else{col="blue" }
points(h1$x, h1$y,  pch=21, bg=col )

}

par(mai=c(0,0,0,0))
hudson.net()
for(i in 1:length(typl1))
{
egv=egl[[typl1[i]]]
m=c(egv$lam1,egv$lam2,egv$lam3)
col='red'
hudson.plot(m=m,col=col)
}

for(i in 1:length(typl2))
{
egv=egl[[typl2[i]]]
m=c(egv$lam1,egv$lam2,egv$lam3)
col='blue'
hudson.plot(m=m,col=col,lwd=2)
}






library(sptemExp)


### Name: bKriging
### Title: Regional Mean Estimation by Block Kriging
### Aliases: bKriging

### ** Examples


#Test for simulated data

dataDt=data.frame(x=sample(c(1:3000),100),y=sample(c(1:2500),100))
dataDt$z=(2*dataDt$x+5*dataDt$y)
dataDtSp=dataDt
sp::coordinates(dataDtSp) <- ~x+y
cl=colorGrinf(dataDt$z)
raster::plot(dataDtSp,col=cl$cols[cl$index])
tarDt=data.frame()
for(i in c(1:10)){
  for(j in c(1:10)){
    index=(i-1)*10+j
    tarDt[index,"x"]=i*10
    tarDt[index,"y"]=j*10
  }
}

varg=automap::autofitVariogram(z~1,input_data =dataDtSp,model="Exp")
paras=c(varg$var_model[2,3],varg$var_model[2,2],varg$var_model[1,2])
krigeMean=bKriging(dataDt, tarDt,"z",paras,model="Exp")
krigeMean

## No test: 
#Test using PM2.5 data of the 2014 PM2.5 of Shandong province

data("spointspre")
spointspresub=spointspre[!is.na(spointspre$pre_m),]
spointspresub$log_pre=log(spointspresub$pre_m)
sz=as.integer(nrow(spointspresub)/1)
index=sample(c(1:sz),size=as.integer(sz/2))
samples=spointspresub[index,]
rtargets=(spointspresub[c(1:sz),])[-index,]
paras=c(50000,0.0278,0.2)
samples@data$x=sp::coordinates(samples)[1]
samples@data$y=sp::coordinates(samples)[2]
rtargets@data$x=sp::coordinates(rtargets)[1]
rtargets@data$y=sp::coordinates(rtargets)[2]
sampledata=samples@data
rtargetsdata=rtargets@data
krigeMean=bKriging(sampledata, rtargetsdata,"log_pre",paras,model="Exp")
exp(krigeMean)
## End(No test)





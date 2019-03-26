library(binhf)


### Name: hfdenoise.wav
### Title: Denoising function
### Aliases: hfdenoise.wav
### Keywords: regression

### ** Examples


library(wavethresh)

#create a sample intensity vector:

int<-sinlog(seq(0,1,length=256))
x<-NULL
for(i in 1:256){
x[i]<-rbinom(1,1,int[i])
}


est<-hfdenoise.wav(x,1,transform="ansc","u",6,"DaubLeAsymm",3,FALSE) 





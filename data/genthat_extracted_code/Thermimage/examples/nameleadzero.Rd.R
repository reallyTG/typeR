library(Thermimage)


### Name: nameleadzero
### Title: Add leading zeros to character for easy sequential naming of
###   filenames.
### Aliases: nameleadzero
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Using for-loop 
prefix<-"Img_"
filetype<-".png"
no.digits<-2
for(i in 1:10){
  f.txt<-nameleadzero(prefix, filetype, no.digits, counter=i)
  print(f.txt)
}

# Using an apply function
x<-unlist(lapply(1:10, nameleadzero, filenameroot="Img_", filetype=".png", no.digits=2))
x





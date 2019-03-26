library(dtw)


### Name: dtwWindowingFunctions
### Title: Global constraints and windowing functions for DTW
### Aliases: noWindow sakoeChibaWindow slantedBandWindow itakuraWindow
###   dtwWindowingFunctions dtwWindow.plot
### Keywords: ts

### ** Examples


## Display some windowing functions
dtwWindow.plot(itakuraWindow, main="So-called Itakura parallelogram window")
dtwWindow.plot(slantedBandWindow, window.size=2,
  reference=13, query=17, main="The slantedBandWindow at window.size=2")


## Asymmetric step with Sakoe-Chiba band

idx<-seq(0,6.28,len=100); 
query<-sin(idx)+runif(100)/10;
reference<-cos(idx);

asyband<-dtw(query,reference,keep=TRUE,
             step=asymmetric,
             window.type=sakoeChibaWindow,
             window.size=30                  );

dtwPlot(asyband,type="density",main="Sine/cosine: asymmetric step, S-C window")






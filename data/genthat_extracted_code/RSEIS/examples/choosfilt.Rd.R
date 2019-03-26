library(RSEIS)


### Name: choosfilt
### Title: INteractive CHoice of Filter
### Aliases: choosfilt
### Keywords: iplot

### ** Examples


 thefilts <-
          list(flo=
               c(0.02, 0.02, 0.02, 0.02, 0.02,   0.02,
                 0.02, 0.02, 0.02,  0.02, 0.02,  0.02,
                 0.02,
                 1/2, 1/50,1/100, 1/100,1,1,
                 0.2, 15, 5, 2,1,
                 100),
               fhi=
               c(1/10, 1/6, 1/5, 1/4, 1/3, 1/2,
                 0.2,  0.5, 1.0,  2.0, 3.0,  4.0,
                 7.0,
                 8, 1/2.0,1/5.0,1/10.0,10,5,
                 7.0, 100, 100, 100,10,
                 100),
             type =
               c("LP","LP", "LP", "LP", "LP", "LP",
                 "LP","LP", "LP", "LP", "LP", "LP",
                 "LP",
                 "BP", "BP","BP","BP","BP","BP",
                 "HP", "HP","HP", "HP","HP",
                 "None"))

if(interactive() ) choosfilt(thefilts = thefilts, ncol = 5)






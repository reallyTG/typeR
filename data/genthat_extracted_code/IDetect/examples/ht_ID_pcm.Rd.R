library(IDetect)


### Name: ht_ID_pcm
### Title: Apply the Isolate-Detect methodology for multiple change-point
###   detection in the mean of a vector with non Gaussian noise
### Aliases: ht_ID_pcm

### ** Examples

single.cpt <- c(rep(4,3000),rep(0,3000))
single.cpt.student <- single.cpt + rt(6000, df = 5)
cpts_detect <- ht_ID_pcm(single.cpt.student)

three.cpt <- c(rep(4,2000),rep(0,2000),rep(-4,2000),rep(0,2000))
three.cpt.student <- three.cpt + rt(8000, df = 5)
cpts_detect_three <- ht_ID_pcm(three.cpt.student)




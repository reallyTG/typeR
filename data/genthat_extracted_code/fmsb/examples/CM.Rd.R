library(fmsb)


### Name: CM
### Title: Coale and McNeil's model nupitiality and its fitting
### Aliases: CM fitCM

### ** Examples

# The data of Japanese population census 2010 for the whole country
# The proportion of ever married females for ages from 15 to 60.
# http://www.e-stat.go.jp/SG1/estat/List.do?bid=000001034991&cycode=0
 Ages <- 15:60
 EverMarriedFemales <-  c(0.003081039, 0.003203058, 0.006502558,
 0.014261608, 0.028378604, 0.048903318, 0.07596101, 0.110311095, 
 0.153365573, 0.2090648, 0.273819118, 0.342672073, 0.41259517, 
 0.479789489, 0.536291775, 0.589919881, 0.631937609, 0.663719195,
 0.691411757, 0.71775138, 0.740807817, 0.760155848, 0.775400475,
 0.788445244, 0.799522713, 0.81108241, 0.821591503, 0.830695486,
 0.840776283, 0.846773585, 0.85921777, 0.867991763, 0.876908992,
 0.886388747, 0.894302114, 0.902385961, 0.909329207, 0.914662575,
 0.920327092, 0.925013244, 0.929551158, 0.933150578, 0.935851652,
 0.938421122, 0.940089719, 0.943223398)

 res <- fitCM(initialpar=c(0.8, 18, 2), data=EverMarriedFemales, 
  ages=Ages, mode=2)
 print(res)
 plot(Ages, EverMarriedFemales, 
  main="Proportion ever married by each age\n for 2010 Japanese females")
 fitted <- CM(res[1], res[2], res[3])
 lines(Ages, fitted$G[6:51], col="red")
 NoteForm <- "C=%3.1f, a0=%3.1f, k=%3.1f\n mu=%3.1f, sd=%3.1f"
 text(40, 0.2, sprintf(NoteForm, res[1], res[2], res[3], fitted$mu, fitted$sigma))
 # mean age of first marriage happening
 print(sum(Ages*fitted$g[Ages-9]/sum(fitted$g[Ages-9]))) 




library(UBL)


### Name: GaussNoiseRegress
### Title: Introduction of Gaussian Noise for the generation of synthetic
###   examples to handle imbalanced regression problems
### Aliases: GaussNoiseRegress
### Keywords: pre-processing regression

### ** Examples

  library(DMwR)
  data(algae)
  clean.algae <- algae[complete.cases(algae), ]
  C.perc = list(0.5, 3) 
  mygn.alg <- GaussNoiseRegress(a7~., clean.algae, C.perc = C.perc)
  gnB.alg <- GaussNoiseRegress(a7~., clean.algae, C.perc = "balance", 
                               pert = 0.1)
  gnE.alg <- GaussNoiseRegress(a7~., clean.algae, C.perc = "extreme")
  
  plot(density(clean.algae$a7))
  lines(density(gnE.alg$a7), col = 2)
  lines(density(gnB.alg$a7), col = 3)
  lines(density(mygn.alg$a7), col = 4)



  ir <- iris[-c(95:130), ]
  mygn1.iris <- GaussNoiseRegress(Sepal.Width~., ir, C.perc = list(0.5, 2.5))
  mygn2.iris <- GaussNoiseRegress(Sepal.Width~., ir, C.perc = list(0.2, 4),
                                  thr.rel = 0.8)
  gnB.iris <- GaussNoiseRegress(Sepal.Width~., ir, C.perc = "balance")
  gnE.iris <- GaussNoiseRegress(Sepal.Width~., ir, C.perc = "extreme")
  
  # defining a relevance function
  rel <- matrix(0, ncol = 3, nrow = 0)
  rel <- rbind(rel, c(2, 1, 0))
  rel <- rbind(rel, c(3, 0, 0))
  rel <- rbind(rel, c(4, 1, 0))

  gn.rel <- GaussNoiseRegress(Sepal.Width~., ir, rel = rel,
                              C.perc = list(5, 0.2, 5))
  plot(density(ir$Sepal.Width), ylim = c(0,1))
  lines(density(gnB.iris$Sepal.Width), col = 3)
  lines(density(gnE.iris$Sepal.Width, bw = 0.3), col = 4)
  # check the impact of a different relevance threshold
  lines(density(gn.rel$Sepal.Width), col = 2)




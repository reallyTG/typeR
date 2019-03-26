library(dpcR)


### Name: qpcr2pp
### Title: qPCR to Poisson Process
### Aliases: qpcr2pp
### Keywords: Poisson Process qPCR

### ** Examples


library(qpcR)
test <- cbind(reps[1L:45, ], reps2[1L:45, 2L:ncol(reps2)], 
	      reps3[1L:45, 2L:ncol(reps3)])

# before interpolation qPCR experiment must be converted into dPCR
qpcrpp <- qpcr2pp(data = test, cyc = 1, fluo = NULL, Cq_range = c(20, 30), 
                  model = l5, delta = 5)
summary(qpcrpp)




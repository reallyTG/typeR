library(dpcR)


### Name: limit_cq
### Title: Limit Cy0 values
### Aliases: limit_cq
### Keywords: Cy0 dPCR qPCR

### ** Examples


library(qpcR)
test <- cbind(reps[1L:45, ], reps2[1L:45, 2L:ncol(reps2)], reps3[1L:45, 
	      2L:ncol(reps3)])

# results.dPCR contains a column with the Cy0 values and a column with 
# converted values.
Cq.range <- c(20, 30)
ranged <- limit_cq(data = test, cyc = 1, fluo = NULL,
                           Cq_range = Cq.range, model = l5)
# Same as above, but without Cq.range
no_range <- limit_cq(data = test, cyc = 1, fluo = NULL, model = l5)

# Same as above, but only three columns
no_range234 <- limit_cq(data = test, cyc = 1, fluo = c(2:4), model = l5)





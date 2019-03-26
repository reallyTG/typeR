library(sodavis)


### Name: s_soda
### Title: S-SODA algorithm for general index model variable selection
### Aliases: s_soda
### Keywords: S-SODA general index model interaction_selection

### ** Examples

# # (uncomment the code to run)
# # Simulation:  x1 / (1 + x2^2) example 
# N = 500
# x1 = runif(N, -3, +3)
# x2 = runif(N, -3, +3)
# x3 = x1 / exp(x2^2) + rnorm(N, 0, 0.2)
# ss = s_soda_model(cbind(x1,x2), x3, H=25)
# 
# # true surface in grid
# MM = 50
# xx1 = seq(-3, +3, length.out = MM)
# xx2 = seq(-3, +3, length.out = MM)
# yyy = matrix(0, MM, MM)
# for(i in 1:MM)
#   for(j in 1:MM)
#     yyy[i,j] = xx1[i] / exp(xx2[j]^2)
# 
# # predicted surface
# ppp = s_soda_pred_grid(xx1, xx2, ss, po=1)
# 
# par(mfrow=c(1, 2), mar=c(1.75, 3, 1.25, 1.5))
# persp(xx1, xx2, yyy, theta=-45, xlab="X1", ylab="X2", zlab="Y")
# persp(xx1, xx2, ppp, theta=-45, xlab="X1", ylab="X2", zlab="Pred")
# 
# # Pumadyn dataset
# #data(pumadyn);
# #s_soda(pumadyn_isample_x, pumadyn_isample_y, H=25, gam=0)




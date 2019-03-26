library(sodavis)


### Name: soda
### Title: SODA algorithm for variable and interaction selection
### Aliases: soda
### Keywords: SODA logistic_regression quadratic_discriminant_analysis
###   interaction_selection

### ** Examples

# # (uncomment the code to run)
# # simulation study with 1 main effect and 2 interactions
# N = 250;
# p = 1000;
# r = 0.5;
# s = 1;
# H = abs(outer(1:p, 1:p, "-"))
# S = s * r^H;
# S[cbind(1:p, 1:p)] = S[cbind(1:p, 1:p)] * s

# xx = as.matrix(data.frame(mvrnorm(N, rep(0,p), S)));
# zz = 1 + xx[,1] - xx[,10]^2 + xx[,10]*xx[,20];
# yy = as.numeric(runif(N) < exp(zz) / (1+exp(zz)))

# res_SODA = soda(xx, yy, gam=0.5);
# cv_SODA  = soda_trace_CV(xx, yy, res_SODA)
# cv_SODA

# # Michigan lung cancer dataset
# data(mich_lung);
# res_SODA = soda(mich_lung_xx, mich_lung_yy, gam=0.5);
# cv_SODA  = soda_trace_CV(mich_lung_xx, mich_lung_yy, res_SODA)
# cv_SODA




library(DCEM)


### Name: dcem_train
### Title: dcem_train: Part of DCEM package.
### Aliases: dcem_train

### ** Examples

# Simulating a mixture of univariate samples from three distributions
# with mean as 20, 70 and 100 and standard deviation as 10, 100 and 40 respectively.
sample_uv_data = as.data.frame(c(rnorm(1000, 20, 10), rnorm(500, 70, 100),
rnorm(2000, 100, 40)), row=3500)

# Randomly shuffle the samples.
sample_uv_data = as.data.frame(sample_uv_data[sample(1:nrow(sample_uv_data)),],
row=nrow(sample_uv_data))

# Calling the dcem_train() function on the simulated data with threshold of
# 0.000001 and iteration count of 1000 respectively.
sample_uv_out = dcem_train(sample_uv_data, num_clusters = 3, iteration_count = 1000,
threshold = 0.000001)

sample_uv_out$mean
# 98.36404 70.19584 19.88569

sample_uv_out$sd
# 40.438697 102.299765   9.702907

# Simulating a mixture of multivariate samples from 2 gaussian distributions.
sample_mv_data = as.data.frame(rbind(MASS::mvrnorm(n=1200, rep(2,5), Sigma = diag(5)),
MASS::mvrnorm(n=50, rep(14,5), Sigma = diag(5))))

# Calling the dcem_train() function on the simulated data with threshold of
# 0.00001 and iteration count of 100 respectively.
sample_mv_out = dcem_train(sample_mv_data, threshold = 0.00001, iteration_count = 100)

sample_mv_out$mean
#[1,]  2.053163  2.023351  2.017288  1.999596  1.983142
#[2,] 13.948244 14.010651 13.897140 14.285898 13.752592





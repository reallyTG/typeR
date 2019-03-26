library(shuffle)


### Name: getAveraging
### Title: Convert design into averaging matrices.
### Aliases: getAveraging

### ** Examples

data(design_vec)

design_avg = getAveraging(design_vec)
rand_resp = rnorm(length(design_vec))

global_mean = mean(rand_resp[design_vec != 0 ])
first_treatment_mean=  mean(rand_resp[design_vec == design_vec[1]])
cat((design_avg$B %*% rand_resp)[1], first_treatment_mean )

cat(((design_avg$B-design_avg$G) %*% rand_resp)[1], first_treatment_mean- global_mean)




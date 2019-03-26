library(tsmp)


### Name: mass_pre
### Title: Precomputes several values used on MASS
### Aliases: mass_pre

### ** Examples

w <- mp_toy_data$sub_len
ref_data <- mp_toy_data$data[,1]
query_data <- mp_toy_data$data[,1]
d_size <- length(ref_data)
q_size <- length(query_data)

pre <- mass_pre(ref_data, d_size, query_data, q_size, w)

dp <- list()
for(i in 1:(d_size - w + 1)) {
  dp[[i]] <- mass(pre$data_fft, query_data[i:(i-1+w)], d_size, w, pre$data_mean, pre$data_sd,
          pre$query_mean[i], pre$query_sd[i])
}




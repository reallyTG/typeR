library(psychmeta)


### Name: ma_d
### Title: Meta-analysis of _d_ values
### Aliases: ma_d ma_d_ad ma_d_bb ma_d_barebones ma_d_ic

### ** Examples

### Demonstration of ma_d ###
## The 'ma_d' function can compute multi-construct bare-bones meta-analyses:
ma_d(d = d, n1 = n1, n2 = n2, construct_y = construct, data = data_d_meas_multi)

## It can also perform multiple individual-correction meta-analyses:
ma_d(ma_method = "ic", d = d, n1 = n1, n2 = n2, ryy = ryyi,
     construct_y = construct, data = data_d_meas_multi)

## And 'ma_d' can also curate artifact distributions and compute multiple
## artifact-distribution meta-analyses:
ma_d(ma_method = "ad", d = d, n1 = n1, n2 = n2,
     ryy = ryyi, correct_rr_y = FALSE,
     construct_y = construct, data = data_d_meas_multi)
     
     
### Demonstration of ma_d_bb ###
## Example meta-analyses using simulated data:
ma_d_bb(d = d, n1 = n1, n2 = n2,
        data = data_d_meas_multi[data_d_meas_multi$construct == "Y",])
ma_d_bb(d = d, n1 = n1, n2 = n2,
        data = data_d_meas_multi[data_d_meas_multi$construct == "Z",])
        
        
### Demonstration of ma_d_ic ###
## Example meta-analyses using simulated data:
ma_d_ic(d = d, n1 = n1, n2 = n2, ryy = ryyi, correct_rr_y = FALSE,
        data = data_d_meas_multi[data_d_meas_multi$construct == "Y",])
ma_d_ic(d = d, n1 = n1, n2 = n2, ryy = ryyi, correct_rr_y = FALSE,
        data = data_d_meas_multi[data_d_meas_multi$construct == "Z",])




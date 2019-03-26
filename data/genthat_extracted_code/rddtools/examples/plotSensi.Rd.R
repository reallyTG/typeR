library(rddtools)


### Name: plotSensi
### Title: Plot the sensitivity to the bandwidth
### Aliases: plotSensi plotSensi.rdd_reg_lm plotSensi.rdd_reg_np

### ** Examples

data(house)
house_rdd <- rdd_data(y=house$y, x=house$x, cutpoint=0)

#Non-parametric estimate
bw_ik <- rdd_bw_ik(house_rdd)
reg_nonpara <- rdd_reg_np(rdd_object=house_rdd, bw=bw_ik)
plotSensi(reg_nonpara)
plotSensi(reg_nonpara, device='base')

#Parametric estimate:
reg_para_ik <- rdd_reg_lm(rdd_object=house_rdd, order=4, bw=bw_ik)
plotSensi(reg_para_ik)
plotSensi(reg_para_ik, type='facet')




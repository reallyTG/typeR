library(bliss)


### Name: image_Bliss
### Title: image_Bliss
### Aliases: image_Bliss

### ** Examples

library(RColorBrewer)
data(data1)
data(param1)
data(res_bliss1)
param1$cols <- colorRampPalette(brewer.pal(9,"Reds"))(1e2)
image_Bliss(res_bliss1$beta_posterior_density,param1,q=1)
lines(res_bliss1$data$grids[[1]],res_bliss1$Bliss_estimate[[1]],type="s",lwd=2)
lines(res_bliss1$data$grids[[1]],res_bliss1$data$betas[[1]],col=3,lwd=2,type="s")

# ---- not run
param1$cols <- colorRampPalette(brewer.pal(9,"YlOrRd"))(1e2)
image_Bliss(res_bliss1$beta_posterior_density,param1,q=1)
lines(res_bliss1$data$grids[[1]],res_bliss1$Bliss_estimate[[1]],type="s",lwd=2)
lines(res_bliss1$data$grids[[1]],res_bliss1$data$betas[[1]],col=3,lwd=2,type="s")

param1$cols <- rev(heat.colors(12))
param1$col_scale <- "quantile"
image_Bliss(res_bliss1$beta_posterior_density,param1,q=1)
lines(res_bliss1$data$grids[[1]],res_bliss1$Bliss_estimate[[1]],type="s",lwd=2)
lines(res_bliss1$data$grids[[1]],res_bliss1$data$betas[[1]],col=3,lwd=2,type="s")

param1$cols <- rev(terrain.colors(12))
image_Bliss(res_bliss1$beta_posterior_density,param1,q=1)
lines(res_bliss1$data$grids[[1]],res_bliss1$Bliss_estimate[[1]],type="s",lwd=2)
lines(res_bliss1$data$grids[[1]],res_bliss1$data$betas[[1]],col=2,lwd=2,type="s")

param1$cols <- rev(topo.colors(12))
image_Bliss(res_bliss1$beta_posterior_density,param1,q=1)
lines(res_bliss1$data$grids[[1]],res_bliss1$Bliss_estimate[[1]],type="s",lwd=2)
lines(res_bliss1$data$grids[[1]],res_bliss1$data$betas[[1]],col=2,lwd=2,type="s")




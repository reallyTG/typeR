## ----setup, include=FALSE, cache=FALSE--------------------------------------------------
library(knitr)
# set global chunk options
# opts_chunk$set(fig.path='figure/minimal-', fig.align='center', fig.show='hold')
options(formatR.arrow=TRUE,width=90)
knitr::opts_chunk$set(dpi=100, eval = FALSE)

## ----warning = FALSE, message = FALSE---------------------------------------------------
#  library("dplyr")
#  library("FRK")
#  library("ggplot2")
#  library("IDE")
#  library("sp")
#  library("spacetime")

## ----echo = FALSE, message=FALSE, warning=FALSE-----------------------------------------
#  library("ggplot2")
#  library("gridExtra")

## ----message=FALSE----------------------------------------------------------------------
#  SIM1 <- simIDE(T = 10, nobs = 100, k_spat_invariant = 1)

## ----results = 'hide', fig.keep = 'none'------------------------------------------------
#  print(SIM1$g_truth)
#  print(SIM1$g_obs)

## ----message = FALSE--------------------------------------------------------------------
#  IDEmodel <- IDE(f = z ~ s1 + s2,
#                  data = SIM1$z_STIDF,
#                  dt = as.difftime(1, units = "days"),
#                  grid_size = 41)

## ----eval = FALSE-----------------------------------------------------------------------
#  fit_results_sim1 <- fit.IDE(IDEmodel,
#                             parallelType = 1)

## ----results = 'hide', fig.keep = 'none'------------------------------------------------
#  show_kernel(fit_results_sim1$IDEmodel)

## ---------------------------------------------------------------------------------------
#  fit_results_sim1$IDEmodel$get("k") %>% unlist()

## ---------------------------------------------------------------------------------------
#  fit_results_sim1$IDEmodel$get("betahat")

## ---------------------------------------------------------------------------------------
#  abs_ev <- eigen(fit_results_sim1$IDEmodel$get("M"))$values %>% abs()
#  summary(abs_ev)

## ---------------------------------------------------------------------------------------
#  ST_grid_df <- predict(fit_results_sim1$IDEmodel)

## ----results = 'hide', fig.keep = 'none'------------------------------------------------
#  gpred <- ggplot(ST_grid_df) +             # Plot the predictions
#    geom_tile(aes(s1, s2, fill=Ypred)) +
#    facet_wrap(~t) +
#    scale_fill_distiller(palette="Spectral", limits = c(-0.1,1.4)) +
#    coord_fixed(xlim=c(0, 1), ylim = c(0, 1))
#  
#  gpredse <- ggplot(ST_grid_df) +           # Plot the prediction s.es
#    geom_tile(aes(s1, s2, fill=Ypredse)) +
#    facet_wrap(~t) +
#    scale_fill_distiller(palette="Spectral") +
#    coord_fixed(xlim=c(0, 1), ylim = c(0, 1))

## ----echo = FALSE, fig.keep = 'none', results = 'hide', message = FALSE-----------------
#  library("gridExtra")
#  g <- grid.arrange(SIM1$g_truth + scale_x_continuous(breaks = c(0,0.5)) +
#                              scale_fill_distiller(palette = "Spectral", limits = c(0.1,1.4)),
#                    SIM1$g_obs + scale_x_continuous(breaks = c(0,0.5)) +
#                              scale_fill_distiller(palette = "Spectral", limits = c(0.1,1.4)),
#                    gpred + scale_x_continuous(breaks = c(0,0.5)) +
#                              scale_fill_distiller(palette = "Spectral", limits = c(0.1,1.4)),
#                    gpredse + scale_x_continuous(breaks = c(0,0.5)) ,
#                    nrow = 2)
#  ggsave(g, file = "./img/Chapter_5/IDEsimresults.png", width = 12, height = 10, dpi = 300)

## ----echo= FALSE, eval = FALSE----------------------------------------------------------
#  s1_pred <- s2_pred <- seq(0,1,length.out = 71)
#  st_grid <- expand.grid(s1 = s1_pred,
#                        s2 = s2_pred,
#                        date = unique(time(SIM1$z_STIDF)))
#  pred_grid <- STIDF(sp = SpatialPoints(st_grid[,c("s1","s2")]),
#                   time = st_grid$date,
#                   data = st_grid %>% select(-s1, -s2, -date))
#  
#  ## Predict using prior guesses
#  ST_grid_df <- predict(fit_results_sim1$IDEmodel,
#                        newdata = pred_grid) %>%
#                as.data.frame()

## ---------------------------------------------------------------------------------------
#  SIM2 <- simIDE(T = 15, nobs = 1000, k_spat_invariant = 0)

## ----results = 'hide', fig.keep = 'none'------------------------------------------------
#  print(SIM2$g_truth)
#  print(SIM2$g_obs)

## ----eval = FALSE-----------------------------------------------------------------------
#  show_kernel(SIM2$IDEmodel, scale = 0.2)

## ---------------------------------------------------------------------------------------
#  mbasis_1 <- auto_basis(manifold = plane(),   # functions on the plane
#                         data = SIM2$z_STIDF,  # data
#                         nres = 1,             # 1 resolution
#                         type = 'bisquare')    # type of functions

## ---------------------------------------------------------------------------------------
#  kernel_basis <- list(thetam1 = constant_basis(),
#                       thetam2 = constant_basis(),
#                       thetam3 = mbasis_1,
#                       thetam4 = mbasis_1)

## ---------------------------------------------------------------------------------------
#  IDEmodel <- IDE(f = z ~ s1 + s2 + 1,
#                  data = SIM2$z_STIDF,
#                  dt = as.difftime(1, units = "days"),
#                  grid_size = 41,
#                  kernel_basis = kernel_basis)

## ----eval = FALSE-----------------------------------------------------------------------
#  fit_results_sim2 <- fit.IDE(IDEmodel,
#                             parallelType = 1,
#                             itermax = 400)

## ----eval = FALSE-----------------------------------------------------------------------
#  show_kernel(fit_results_sim2$IDEmodel)


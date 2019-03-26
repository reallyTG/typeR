# rm(list=setdiff(ls(), c("fit_PRZ_cstSD_MORSE", "fit_PRZ_cstIT_MORSE")))
# library(morse)
# data(propiconazole)
# dat <- survData(propiconazole)
#
# fit_PRZ_cstSD_MORSE <- survFit(dat, model_type = "SD")
# fit_PRZ_cstIT_MORSE <- survFit(dat, model_type = "IT")
#
# data_4prediction <- data.frame(time = 1:10,
#                               conc = c(0,0.5,8,3,0,0,0.5,8,3.5,0))
# 
# 
# MFx_PRZ_cstSD_4pred <- MFx(object = fit_PRZ_cstSD_MORSE, profile = data_4prediction, x_MFx = 50)
# plot(MFx_PRZ_cstSD_4pred)
# plot(MFx_PRZ_cstSD_4pred, log_scale = TRUE)
# plot(MFx_PRZ_cstSD_4pred, x_variable =  "Time")
# 
# 
# # To have a better plot:
# # (1) change the range of MFx to explore
# MFx_PRZ_cstSD_4pred_max10 <- MFx(object = fit_PRZ_cstSD_MORSE, profile = data_4prediction, x_MFx = 50, MFx_range = c(1,10))
# plot(MFx_PRZ_cstSD_4pred_max10)
# plot(MFx_PRZ_cstSD_4pred_max10, x_variable =  "Time")
# 
# # (2) use sequential methode by specifying a number to npoints. For instance 20.
# MFx_PRZ_cstSD_4pred_NULLxMFx <- MFx(object = fit_PRZ_cstSD_MORSE, profile = data_4prediction, x_MFx = NULL, MFx_range = seq(1,7.5, length = 30))
# plot(MFx_PRZ_cstSD_4pred_NULLxMFx)
# plot(MFx_PRZ_cstSD_4pred_NULLxMFx, x_variable =  "Time")
# 
# # test other time
# MFx_PRZ_cstSD_4pred_time4 <- MFx(object = fit_PRZ_cstSD_MORSE, profile = data_4prediction, x_MFx = 50, time_MFx = 4, MFx_range = c(1,10))
# plot(MFx_PRZ_cstSD_4pred_time4)
# plot(MFx_PRZ_cstSD_4pred_time4, x_variable =  "Time")


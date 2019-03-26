library(IsoriX)


### Name: isosim
### Title: Simulate isotopic values
### Aliases: isosim
### Keywords: simulate simulation

### ** Examples



## The examples below will only be run if sufficient time is allowed
## You can change that by typing e.g. options_IsoriX(example_maxtime = XX)
## if you want to allow for examples taking up to ca. XX seconds to run
## (so don't write XX but put a number instead!)

if(getOption_IsoriX("example_maxtime") > 60) {

## We simulate data under default settings
Simu <- isosim(data = ElevRasterDE,
               save_dataframe = TRUE,
               seed = 1)

Simu

## We build the plots of the outcome using IsoriX
PlotMeanSimu <- plot(x = Simu, which = "mean")

PlotDispSimu <- plot(x = Simu, which = "disp")


## We fit the simulated data by sampling 50 locations

set.seed(123)
Newdat <- Simu$data[sample(1:nrow(Simu$data), 50), ]

NewdatFit <- isofit(data = Newdat,
                    mean_model_fix = list(elev = TRUE, lat_abs = TRUE))

Isoscape <- isoscape(ElevRasterDE, NewdatFit)

PlotMeanFitted <- plot(x = Isoscape, which = "mean", sources = list(draw = FALSE))

PlotDispFitted <- plot(x = Isoscape, which = "disp", sources = list(draw = FALSE))

## We compare simulated and fitted data visually
print(PlotMeanSimu, split = c(1, 1, 2, 2), more = TRUE)
print(PlotDispSimu, split = c(2, 1, 2, 2), more = TRUE)
print(PlotMeanFitted, split = c(1, 2, 2, 2), more = TRUE)
print(PlotDispFitted, split = c(2, 2, 2, 2), more = FALSE)

## We compare simulated and fitted data numerically
## Note that differences are expected, as the geographic
##   area is small compared to the scale at which
##   spatial auto-correlation occurs
round(cbind(
    simulated = c(
        intercept = 64,
        lat_abs = -2.3, 
        elev = -0.01,
        nu = 0.35,
        rho = 5e-5,
        rho_div_nu  =  5e-5/0.35,
        lambda_ID = 0,
        lambda_matern = 899,
        intercept_disp = 5.8,
        nu_disp = 3.2e-01,
        rho_disp = 1.5e-05,
        lambda_matern_source_ID = 0,
        lambda_matern_disp = 5),
    fitted = c(
        intercept = NewdatFit$mean_fit$fixef[1],
        lat.abs = NewdatFit$mean_fit$fixef[2], 
        elev = NewdatFit$mean_fit$fixef[3],
        nu = get_ranPars(NewdatFit$mean_fit, which = "corrPars")[[1]]$nu,
        rho = get_ranPars(NewdatFit$mean_fit, which = "corrPars")[[1]]$rho,
        rho_div_nu = with(get_ranPars(NewdatFit$mean_fit, which = "corrPars")[[1]],rho/nu),
        lambda.matern = NewdatFit$mean_fit$lambda,
        intercept.disp = NewdatFit$disp_fit$fixef[1],
        nu.disp = get_ranPars(NewdatFit$disp_fit, which = "corrPars")[[1]]$nu,
        rho.disp = get_ranPars(NewdatFit$disp_fit, which = "corrPars")[[1]]$rho,
        lambda.matern.disp = NewdatFit$disp_fit$lambda)), 4)

}





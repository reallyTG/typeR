library(x12)


### Name: plotSpec
### Title: ~~ Methods for Function 'plotSpec' in Package 'x12' ~~
### Aliases: plotSpec plotSpec-methods plotSpec,x12Output-method
###   plotSpec,x12Single-method plotSpec,spectrum-method
### Keywords: methods ~~ other possible keyword(s) ~~

### ** Examples


## Not run: 
##D s <- new("x12Single",ts=AirPassengers,tsName="air")
##D s <- setP(s,list(estimate=TRUE,regression.variables="AO1950.1",outlier.types="all",
##D   outlier.critical=list(LS=3.5,TC=2.5),backcast_years=1/2))
##D s <- x12(s)
##D #w/o outliers
##D plot(s@x12Output,sa=TRUE,trend=TRUE,original=FALSE)
##D plot(s)
##D #with (all) outliers
##D plot(s,showAllout=TRUE,sa=TRUE,trend=TRUE,log_transform=TRUE,lwd_out=1,pch_ao=4)
##D plot(s,showAllout=TRUE,sa=TRUE,trend=TRUE,original=FALSE,showAlloutLines=TRUE,
##D   col_tc="purple")#,log_transform=TRUE)#,lwd_out=3)
##D #with showOut
##D plot(s,showOut="AO1960.Jun",sa=FALSE,trend=FALSE,annComp=TRUE,log_transform=TRUE)
##D plot(s,showOut="AO1958.Mar",sa=TRUE,trend=TRUE,annComp=TRUE,annCompTrend=FALSE)
##D plot(s,showOut="AO1950.Jun",annComp=FALSE,cex_out=3,pch_ao=19,col_ao="orange")
##D plot(s,showOut="TC1954.Feb")
##D plot(s,showOut="TC1954.Feb",col_tc="green3")
##D 
##D #w/o legend
##D plot(s,showAllout=TRUE,plot_legend=FALSE)
##D plot(s,plot_legend=FALSE)
##D plot(s,showOut="AO1950.1",plot_legend=FALSE,lwd_out=2,col_ao="purple")
##D plot(s,showOut="TC1954.Feb",col_tc="orange",col_ao="magenta",plot_legend=FALSE)
##D plot(s,showOut="AO1950.1",col_tc="orange",col_ao="magenta",plot_legend=FALSE)
##D 
##D #Forecasts & Backcasts
##D plot(s,forecast=TRUE)
##D plot(s,backcast=TRUE,showLine=TRUE)
##D plot(s,backcast=TRUE,forecast=TRUE,showCI=FALSE)
##D plot(s,forecast=TRUE,points_fc=TRUE,col_fc="purple",lty_fc=2,lty_original=3,
##D   lwd_fc=0.9,lwd_ci=2)
##D plot(s,sa=TRUE,plot_legend=FALSE)
##D 
##D #Seasonal Factors and SI Ratios
##D plotSeasFac(s)
##D #Spectra
##D plotSpec(s)
##D plotSpec(s,highlight=FALSE)
##D #Autocorrelations of the Residuals
##D plotRsdAcf(s)
##D plotRsdAcf(s,col_acf="black",lwd_acf=1)
## End(Not run)




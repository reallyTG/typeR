## ----message=FALSE-------------------------------------------------------
require(chillR)

## ----results='as.is'-----------------------------------------------------
daylength(latitude=50.4,JDay=15)

## ------------------------------------------------------------------------
all_daylengths<-cbind(JDay=1:365,sapply(daylength(latitude=50.5,JDay=1:365),cbind))
knitr::kable(head(all_daylengths))

## ----results='as.is'-----------------------------------------------------

weather<-make_all_day_table(KA_weather)

hourtemps<-stack_hourly_temps(weather, latitude=50.4)$hourtemps
hourtemps$DATE<-ISOdate(hourtemps$Year,hourtemps$Month,hourtemps$Day,hourtemps$Hour)


## ----echo=FALSE----------------------------------------------------------
knitr::kable(hourtemps[20:30,],row.names = FALSE)

## ----ideal_temps,echo=FALSE, fig.height = 4, fig.width = 6, fig.align = "center"----

par(mar=c(5,5,1,1))
plot(hourtemps$Temp[10:250]~hourtemps$DATE[10:250],type="l",col="red",lwd=3,
     xlab="Date",ylab="Temperature (°C)",xaxs="i")


## ------------------------------------------------------------------------
KA_weather_gaps<-KA_weather[1:100,]
KA_weather_gaps[,"Tmin_original"]<-KA_weather_gaps[,"Tmin"]
KA_weather_gaps[,"Tmax_original"]<-KA_weather_gaps[,"Tmax"]
KA_weather_gaps$Tmin[c(4:15,20:30,35:40,44:45,48,50:60)]<-NA
KA_weather_gaps$Tmax[c(3:10,12:15,17:20,30:35,42:60,65:70)]<-NA


## ------------------------------------------------------------------------
fixed<-fix_weather(KA_weather_gaps)

## ----interpolated_daily,echo=FALSE, fig.height = 4, fig.width = 6, fig.align = "center"----
par(mar=c(5,5,1,1))
plot(fixed$weather$Tmin_original~fixed$weather$DATE,type="l",lwd=4,col="blue",
     ylim=c(min(fixed$weather[,c("Tmin","Tmin_original")],na.rm=TRUE),
            max(fixed$weather[,c("Tmax","Tmax_original")],na.rm=TRUE)),xaxs="i",
     xlab="Date",ylab="Temperature (°C)")
lines(fixed$weather$Tmax_original~fixed$weather$DATE,type="l",lwd=4,col="red")
lines(fixed$weather$Tmin~fixed$weather$DATE,type="l",lwd=2)
lines(fixed$weather$Tmax~fixed$weather$DATE,type="l",lwd=2)

## ------------------------------------------------------------------------

# stations<-handle_gsod(action="list_stations",location=c(6.99,50.62),
#                      time_interval = c(1998,1998))

## ----echo=FALSE----------------------------------------------------------
stations<-read.csv("KA_stations.csv")
knitr::kable(stations[1:10,c(1:2,4:5,8)])

## ------------------------------------------------------------------------
# patch_weather<-handle_gsod(action="download_weather",stations$chillR_code[4],
#                      time_interval = c(1998,1998))
# patch_weather<-handle_gsod(patch_weather)$weather

## ----echo=FALSE----------------------------------------------------------
patch_weather<-read.csv("KA_patch.csv")
knitr::kable(patch_weather[1:5,])

## ------------------------------------------------------------------------
patched_weather<-patch_daily_temperatures(KA_weather_gaps,patch_weather)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(patched_weather$statistics)

## ----proxy_daily,echo=FALSE, fig.height = 4, fig.width = 6, fig.align = "center"----
par(mar=c(5,5,0,0))
plot(fixed$weather$Tmin_original~fixed$weather$DATE,type="l",lwd=4,col="blue",
     ylim=c(min(fixed$weather[,c("Tmin","Tmin_original")],na.rm=TRUE),
            max(fixed$weather[,c("Tmax","Tmax_original")],na.rm=TRUE)),xaxs="i",
     xlab="Date",ylab="Temperature (°C)")
lines(fixed$weather$Tmax_original~fixed$weather$DATE,type="l",lwd=4,col="red")
lines(patched_weather$weather$Tmin~fixed$weather$DATE,type="l",lwd=2)
lines(patched_weather$weather$Tmax~fixed$weather$DATE,type="l",lwd=2)

## ----hourly_linear,echo=FALSE, fig.height = 4, fig.width = 6, fig.align = "center"----
Winters_hours_gaps[,"DATE"]<-ISOdate(Winters_hours_gaps$Year,Winters_hours_gaps$Month,Winters_hours_gaps$Day,Winters_hours_gaps$Hour)
par(mar=c(5,5,1,1))
plot(Winters_hours_gaps$Temp[50:300]~Winters_hours_gaps$DATE[50:300],type="l",
     lwd=2,col="dark grey",xaxs="i",xlab="Date",ylab="Temperature (°C)")

lines(interpolate_gaps(Winters_hours_gaps$Temp_gaps)$interp[50:300]~Winters_hours_gaps$DATE[50:300],col="red",lwd=2)
lines(Winters_hours_gaps$Temp_gaps[50:300]~Winters_hours_gaps$DATE[50:300],type="l",lwd=2)


## ------------------------------------------------------------------------
#stations<-handle_cimis("list_stations",location=c(-122,38.5))
#downloaded_winters<-handle_cimis("download_weather",stations$chillR_code[2],
#               time_interval = c(2008,2008))
#winters_daily<-handle_cimis(downloaded_winters)$weather


## ----echo=FALSE----------------------------------------------------------
winters_daily<-read.csv("winters_daily.csv")
knitr::kable(winters_daily[1:5,])

## ------------------------------------------------------------------------
to_interp<-Winters_hours_gaps
to_interp[,"Temp_recorded"]<-to_interp[,"Temp"]
to_interp[,"Temp"]<-to_interp[,"Temp_gaps"]
interp<-interpolate_gaps_hourly(hourtemps=to_interp,latitude=38.5,
                                daily_temps=list(Winters=winters_daily))


## ----echo=FALSE----------------------------------------------------------
knitr::kable(interp$daily_patch_report,row.names = FALSE,align="r")

## ----echo=FALSE,results='as.is'------------------------------------------
knitr::kable(interp$weather[30:45,c(1:5,10)],row.names = FALSE,
             align=c("r","r","r","r","r","r"))

## ----hourly_interpolation,echo=FALSE, fig.height = 4, fig.width = 6, fig.align = "center"----
inter<-interp$weather
inter[,"DATE"]<-ISOdate(inter$Year,inter$Month,inter$Day,inter$Hour)
par(mar=c(5,5,1,1))
plot(inter$Temp_recorded[50:300]~inter$DATE[50:300],type="l",
     lwd=2,col="dark grey",xaxs="i",xlab="Date",ylab="Temperature (°C)")

lines(inter$Temp[50:300]~inter$DATE[50:300],col="red",lwd=2)
lines(inter$Temp_gaps[50:300]~inter$DATE[50:300],type="l",lwd=2)


## ------------------------------------------------------------------------
require(stats)
y<-rnorm(100)
IQ<-quantile(y)[4]-quantile(2)[2]

## ------------------------------------------------------------------------
orchard_extremes<-make_all_day_table(inter,timestep="day",
                                     input_timestep = "hour")

## ------------------------------------------------------------------------
winters_hours<-stack_hourly_temps(fix_weather(winters_daily),latitude=38)$hourtemps
start_hour_winters<-which(winters_hours$Year==inter$Year[1]&
                    winters_hours$Month==inter$Month[1]&
                    winters_hours$Day==inter$Day[1]&
                    winters_hours$Hour==inter$Hour[1])
end_hour_winters<-which(winters_hours$Year==inter$Year[nrow(inter)]&
                    winters_hours$Month==inter$Month[nrow(inter)]&
                    winters_hours$Day==inter$Day[nrow(inter)]&
                    winters_hours$Hour==inter$Hour[nrow(inter)])

orchard_hours<-stack_hourly_temps(orchard_extremes,latitude=38)$hourtemps
start_hour_orchard<-which(orchard_hours$Year==inter$Year[1]&
                    orchard_hours$Month==inter$Month[1]&
                    orchard_hours$Day==inter$Day[1]&
                    orchard_hours$Hour==inter$Hour[1])
end_hour_orchard<-which(orchard_hours$Year==inter$Year[nrow(inter)]&
                    orchard_hours$Month==inter$Month[nrow(inter)]&
                    orchard_hours$Day==inter$Day[nrow(inter)]&
                    orchard_hours$Hour==inter$Hour[nrow(inter)])

observed<-inter$Temp_recorded
option1<-winters_hours$Temp[start_hour_winters:end_hour_winters]
option2<-orchard_hours$Temp[start_hour_orchard:end_hour_orchard]
option3<-interpolate_gaps(inter$Temp_gaps)$interp
option4<-inter$Temp

eval_table<-eval_table_gaps<-data.frame(Option=1:4,
                Input_data=c("daily","daily","hourly","hourly"),
                Interpolation_method=c("from proxy","local extremes",
                                "linear","hourly interpolation"),
                RMSEP=NA,RPIQ=NA)

observed_gaps<-observed[which(is.na(inter$Temp_gaps))]
option1_gaps<-option1[which(is.na(inter$Temp_gaps))]
option2_gaps<-option2[which(is.na(inter$Temp_gaps))]
option3_gaps<-option3[which(is.na(inter$Temp_gaps))]
option4_gaps<-option4[which(is.na(inter$Temp_gaps))]

eval_table_gaps[,"RMSEP"]<-round(c(RMSEP(option1_gaps,observed_gaps),
                             RMSEP(option2_gaps,observed_gaps),
                             RMSEP(option3_gaps,observed_gaps),
                             RMSEP(option4_gaps,observed_gaps)),1)

eval_table_gaps[,"RPIQ"]<-round(c(RPIQ(option1_gaps,observed_gaps),
                            RPIQ(option2_gaps,observed_gaps),
                            RPIQ(option3_gaps,observed_gaps),
                            RPIQ(option4_gaps,observed_gaps)),1)

knitr::kable(eval_table_gaps,row.names = FALSE)

## ------------------------------------------------------------------------
eval_table<-data.frame(Option=1:4,
                  Input_data=c("daily","daily","hourly","hourly"),
                  Interpolation_method=c("from proxy","local extremes",
                                    "linear","hourly interpolation"),
                  RMSEP=NA,RPIQ=NA)

eval_table[,"RMSEP"]<-round(c(RMSEP(option1,observed),RMSEP(option2,observed),
                       RMSEP(option3,observed),RMSEP(option4,observed)),1)

eval_table[,"RPIQ"]<-round(c(RPIQ(option1,observed),RPIQ(option2,observed),
                       RPIQ(option3,observed),RPIQ(option4,observed)),1)

knitr::kable(eval_table,row.names = FALSE)


## ------------------------------------------------------------------------
option1_chill<-Dynamic_Model(option1)
option2_chill<-Dynamic_Model(option2)
option3_chill<-Dynamic_Model(option3)
option4_chill<-Dynamic_Model(option4)
observed_chill<-Dynamic_Model(observed)

## ----chill_accumulation,echo=FALSE, fig.height = 4, fig.width = 6, fig.align = "center"----
plot(observed_chill~inter$DATE,type="l",lwd=2,col="black",ylab="Chill Portions (cumulative)",
     xlab="Date",ylim=c(0,max(c(option1_chill,option2_chill,
                                option3_chill,option4_chill,
                                observed_chill))),xaxs="i")
lines(option1_chill~inter$DATE,type="l",lwd=2,col="orange")
lines(option2_chill~inter$DATE,type="l",lwd=2,col="red")
lines(option3_chill~inter$DATE,type="l",lwd=2,col="green")
lines(option4_chill~inter$DATE,type="l",lwd=2,col="blue")

mtext("Observed temperatures",3,adj=0.02,line=-0.8, cex=0.8,
      col="black")
mtext("Option 1 - idealized record from proxy data",3,adj=0.02,
      line=-1.6, cex=0.8,col="orange")
mtext("Option 2 - idealized record from daily orchard data",3,adj=0.02,
      line=-2.4, cex=0.8,col="red")
mtext("Option 3 - linear interpolation of hourly data",3,adj=0.02,
      line=-3.2, cex=0.8,col="green")
mtext("Option 4 - use of interpolate_gaps_hourly",3,adj=0.02,
      line=-4, cex=0.8,col="blue")

## ------------------------------------------------------------------------
option1_heat<-GDH(option1)
option2_heat<-GDH(option2)
option3_heat<-GDH(option3)
option4_heat<-GDH(option4)
observed_heat<-GDH(observed)

## ----heat_accumulation,echo=FALSE, fig.height = 4, fig.width = 6, fig.align = "center"----
plot(observed_heat~inter$DATE,type="l",lwd=2,col="black",ylab="Growing Degree Hours (cumulative)",
     xlab="Date",ylim=c(0,max(c(option1_heat,option2_heat,
                                option3_heat,option4_heat,
                                observed_heat))),xaxs="i")
lines(option1_heat~inter$DATE,type="l",lwd=2,col="orange")
lines(option2_heat~inter$DATE,type="l",lwd=2,col="red")
lines(option3_heat~inter$DATE,type="l",lwd=2,col="green")
lines(option4_heat~inter$DATE,type="l",lwd=2,col="blue")

mtext("Observed temperatures",3,adj=0.02,line=-0.8, cex=0.8,
      col="black")
mtext("Option 1 - idealized record from proxy data",3,adj=0.02,
      line=-1.6, cex=0.8,col="orange")
mtext("Option 2 - idealized record from daily orchard data",3,adj=0.02,
      line=-2.4, cex=0.8,col="red")
mtext("Option 3 - linear interpolation of hourly data",3,adj=0.02,
      line=-3.2, cex=0.8,col="green")
mtext("Option 4 - use of interpolate_gaps_hourly",3,adj=0.02,
      line=-4, cex=0.8,col="blue")

## ----echo=FALSE,results='as.is'------------------------------------------

chill_heat_eval<-rbind(data.frame(Option=0,Input_data="observed",
                                  Interpolation_method="none"),eval_table[,1:3])
chill_heat_eval[,"Chill Portions"]<-round(c(observed_chill[length(observed)],
                                      option1_chill[length(option1)],
                                      option2_chill[length(option2)],
                                      option3_chill[length(option3)],
                                      option4_chill[length(option4)]),1)
chill_heat_eval[,"Growing Degree Hours"]<-
  round(c(observed_heat[length(observed)],
                                      option1_heat[length(option1)],
                                      option2_heat[length(option2)],
                                      option3_heat[length(option3)],
                                      option4_heat[length(option4)]),0)

knitr::kable(chill_heat_eval,row.names = FALSE)


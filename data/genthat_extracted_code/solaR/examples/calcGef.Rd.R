library(solaR)


### Name: A3_calcGef
### Title: Irradiation and irradiance on the generator plane.
### Aliases: calcGef
### Keywords: utilities constructors

### ** Examples

###12 Average days.

G0dm=c(2.766,3.491,4.494,5.912,6.989,7.742,7.919,7.027,5.369,3.562,2.814,2.179)*1000;
Ta=c(10, 14.1, 15.6, 17.2, 19.3, 21.2, 28.4, 29.9, 24.3, 18.2, 17.2, 15.2)

##Fixed surface, default values of inclination and azimuth.

gef<-calcGef(lat=37.2, modeRad='prom', dataRad=list(G0dm=G0dm, Ta=Ta))
print(gef)
xyplot(gef)

##Two-axis surface, no limitation angle.

gef2<-calcGef(lat=37.2, modeRad='prom', dataRad=list(G0dm=G0dm, Ta=Ta), modeTrk='two')
print(gef2)
xyplot(gef2)

##Fixed surface
gefAguiar <- calcGef(lat=41, modeRad='aguiar', dataRad=G0dm)

##Two-axis tracker, using the previous result.
##'gefAguiar' is internally coerced to a 'G0' object.

gefAguiar2 <- calcGef(lat=41, modeRad='prev', dataRad=gefAguiar, modeTrk='two')
print(gefAguiar2)
xyplot(gefAguiar2)

###Shadows between two-axis trackers, again using the gefAguiar result.

struct=list(W=23.11, L=9.8, Nrow=2, Ncol=8)
distances=data.frame(Lew=40, Lns=30, H=0)

gefShd<-calcGef(lat=41, modeRad='prev',
                dataRad=gefAguiar, modeTrk='two',
                modeShd=c('area', 'prom'),
                struct=struct, distances=distances)
print(gefShd)
##The Gef0, Bef0 and Def0 values are the same as those contained in the
##                gefAguiar2 object




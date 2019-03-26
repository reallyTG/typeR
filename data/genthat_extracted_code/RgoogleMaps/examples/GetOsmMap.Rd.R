library(RgoogleMaps)


### Name: GetOsmMap
### Title: Query the Open Street Map server for map tiles instead of Google
###   Maps
### Aliases: GetOsmMap

### ** Examples



if (interactive()) {


 	CologneMap <- GetOsmMap(lonR= c(6.89, 7.09), latR = c(50.87, 51), scale = 150000, 


                            destfile = "Cologne.png");


	PlotOnStaticMap(CologneMap, mar=rep(4,4), NEWMAP = FALSE, TrueProj = FALSE, axes= TRUE);


		


	PrincetonMap <- GetOsmMap(lonR= c(-74.67102, -74.63943), latR = c(40.33804,40.3556), 


                             scale = 12500, destfile = "Princeton.png");


	png("PrincetonWithAxes.png", 1004, 732)


      PlotOnStaticMap(PrincetonMap, axes = TRUE, mar = rep(4,4));


    dev.off()


 }






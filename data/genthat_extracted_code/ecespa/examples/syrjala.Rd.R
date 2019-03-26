library(ecespa)


### Name: syrjala
### Title: Syrjala's test for the difference between the spatial
###   distributions of two populations
### Aliases: syrjala syrjala0 syrjala.test plot.syrjala.test
###   print.syrjala.test plot.ecespa.syrjala print.ecespa.syrjala
### Keywords: spatial distribution

### ** Examples


   
   data(syr1); data(syr2); data(syr3)
   
   coords <- data.frame(x=syr1$x, y=syr1$y); var1<- syr1$marks; var2<- syr2$marks
   
   (stest<-syrjala(coords, var1, var2, 9999))
   plot(stest)
   
   
   ## Not run: 
##D    
##D    plot(syrjala.test(syr1, syr2, nsim=999)) 
##D    
##D    plot(syrjala.test(syr1, syr3, nsim=999)) 
##D    
##D    syrjala0(coords, var1, var2, 9999)
##D    
##D    syrjala0(coords, var1, var2, 999, R=TRUE)
##D    
##D    
##D    coords <- expand.grid(x=1:10,y=1:10)
##D    var1 <- runif(100)
##D    var2 <- runif(100)
##D    syrjala(coords, var1, var2, 9999)
##D    
##D    
## End(Not run)




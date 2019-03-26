library(spaMM)


### Name: mapMM
### Title: Colorful plots of predicted responses in two-dimensional space.
### Aliases: spaMMplot2D mapMM filled.mapMM
### Keywords: hplot

### ** Examples

data("blackcap")
bfit <- corrHLfit(migStatus ~ means+ Matern(1|longitude+latitude),data=blackcap,
                  HLmethod="ML",
                  ranFix=list(lambda=0.5537,phi=1.376e-05,rho=0.0544740,nu=0.6286311))
if (requireNamespace("maps")) { ## required for add.map=TRUE 
  mapMM(bfit,color.palette = function(n){spaMM.colors(n,redshift=1/2)},add.map=TRUE)
}

if (spaMM.getOption("example_maxtime")>0.8) {
  ## filled.mapMM takes a bit longer
  # showing 'add.map', 'nlevels', and contour lines for 'variances'
  if (requireNamespace("maps")) { ## required for add.map=TRUE 
    filled.mapMM(bfit,nlevels=30,add.map=TRUE,plot.axes=quote({axis(1);axis(2)}),
             variance="respVar",
             plot.title=title(main="Inferred migration propensity of blackcaps",
                               xlab="longitude",ylab="latitude"))
  }
}

if (spaMM.getOption("example_maxtime")>2.5) {
 data("Loaloa")  
 lfit <- corrHLfit(cbind(npos,ntot-npos)~elev1+elev2+elev3+elev4+maxNDVI1+seNDVI
                  +Matern(1|longitude+latitude),HLmethod="HL(0,1)",data=Loaloa,
                  family=binomial(),ranFix=list(nu=0.5,rho=2.255197,lambda=1.075))   

 ## longer computation requiring interpolation of 197 points 
 if (requireNamespace("maps")) { ## required for add.map=TRUE 
  filled.mapMM(lfit,add.map=TRUE,plot.axes=quote({axis(1);axis(2)}),
             decorations=quote(points(pred[,coordinates],pch=15,cex=0.3)),
             plot.title=title(main="Inferred prevalence, North Cameroon",
                                xlab="longitude",ylab="latitude"))
  }
}





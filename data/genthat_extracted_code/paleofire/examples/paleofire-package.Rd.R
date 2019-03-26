library(paleofire)


### Name: paleofire-package
### Title: paleofire: A package for the Global Charcoal Database
### Aliases: paleofire-package paleofire
### Keywords: charcoal, fire, global, paleo sediments,

### ** Examples


## Not run: 
##D ## Interactive sites selection:
##D # ID=pfInteractive()
##D 
##D ## Site selection using criterions
##D # Boreal Eastern North American sites with at least one
##D # dating point each 2500 year
##D 
##D ID=pfSiteSel(lat>50, lat<70, long>-90, long<(-50), date_int<=2500, l12==1)
##D plot(ID,zoom="world")
##D 
##D ## Modify plot
##D plot(ID,zoom="sites")
##D 
##D ## Simple test for transforming data
##D # Select site 1 (Cygnet Lake)
##D 
##D ID1=pfSiteSel(id_site==1)
##D plot(ID1)
##D 
##D # Transformation of data
##D TR=pfTransform(ID1,method=c("MinMax", "Box-Cox", "Z-Score"))
##D 
##D # Plot Transformed and raw data
##D # First retrieve raw data for Cygnet using pfExtract
##D 
##D RAW=pfExtract(ID=1)
##D 
##D dev.off()
##D par(mfrow=(c(2,1)))
##D 
##D plot(RAW[,3],RAW[,4],type="l")
##D plot(TR$Age,TR$TransData,type="l")
##D 
##D ## Transforming and Compositing
##D ## Example 1: Usage as in Power et al. 2008
##D ## Data transformation
##D 
##D TR1=pfTransform(ID, method=c("MinMax","Box-Cox","Z-Score"),BasePeriod=c(200,2000))
##D 
##D ## Diagnostic pdf file with transformed series:
##D # pfDiagnostic(ID, method=c("MinMax","Box-Cox","Z-Score"),BasePeriod=c(200,2000),
##D # FileName = "Diagnostic.pdf")
##D 
##D ## Compositing: basic binning procedure
##D COMP=pfComposite(TR1, binning=TRUE, bins=seq(0,8000,500))
##D plot(COMP)
##D 
##D ## The result matrix can be saved
##D # write.csv(COMP$Result,file="temp.csv")
##D 
##D ## Compositing: Using the locfit package equivalent procedure to Daniau et al. 2012
##D 
##D COMP2=pfCompositeLF(TR1, tarAge=seq(-50,8000,20), binhw=20, hw=500,nboot=100)
##D plot(COMP2)
##D 
##D ## And save
##D write.csv(COMP2$Result,file="temp2.csv")
## End(Not run)





library(paleofire)


### Name: pfAddData
### Title: Add user defined charcoal data series to paleofire
### Aliases: pfAddData

### ** Examples



## Not run: 
##D # Ad user own data from CharAnalysis file (csv)
##D # In this example we will use data from:
##D # Senici, D., A. Lucas, H. Y. H. Chen, Y. Bergeron, A. Larouche, B. Brossier, O.
##D # Blarquez, and A. A. Ali. 2013. Multi-millennial fire frequency and tree abundance
##D # differ between xeric and mesic boreal forests in central Canada. Journal of Ecology:
##D # 101, 356-367.
##D 
##D files=c("http://blarquez.com/public/data//Ben.csv",
##D        "http://blarquez.com/public/data/Small.csv")
##D metadata=c("http://blarquez.com/public/data/metadata.csv")
##D 
##D mydata=pfAddData(files=files,metadata=metadata,type="CharAnalysis")
##D 
##D # Transform and compositing:
##D TR1=pfTransform(add=mydata, method=c("MinMax","Box-Cox","Z-Score"),
##D                 BasePeriod=c(200,2000))
##D COMP2=pfCompositeLF(TR1, tarAge=seq(-50,8000,20), hw=500, nboot=100)
##D plot(COMP2)
##D 
##D # Three columns example (with semicolon csv files):
##D files=c("http://blarquez.com/public/data/Ben_area.csv",
##D        "http://blarquez.com/public/data/Small_area.csv")
##D mydata=pfAddData(files=files, sep=";")
##D # Transform and compositing:
##D TR1=pfTransform(add=mydata, method=c("MinMax","Box-Cox","Z-Score"),
##D                BasePeriod=c(200,2000))
##D COMP2=pfCompositeLF(TR1, tarAge=seq(-50,8000,20), hw=500, nboot=100)
##D plot(COMP2)
## End(Not run)





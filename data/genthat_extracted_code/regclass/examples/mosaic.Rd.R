library(regclass)


### Name: mosaic
### Title: Mosaic plot
### Aliases: mosaic

### ** Examples

  data(ACCOUNT)
	mosaic(Area.Classification~Purchase,data=ACCOUNT,color=TRUE)
	
	data(EX6.CLICK)
	#Default presentation:  not very useful
	mosaic(Click~DeviceModel,data=EX6.CLICK)  
	#Better presentation
	mosaic(Click~DeviceModel,data=EX6.CLICK,equal=TRUE,inside=TRUE,magnification=0.8)  
	 



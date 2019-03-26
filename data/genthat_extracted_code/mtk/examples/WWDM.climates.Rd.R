library(mtk)


### Name: wwdm.climates
### Title: Dataset used with the 'WWDM' model
### Aliases: WWDM.climates wwdm.climates
### Keywords: dataset

### ** Examples

  data(wwdm.climates)
  summary(wwdm.climates)
  wwdm.climates[1:20,]
  par(mfrow=c(3,1)) ; 
  		for(i in 1:3) ts.plot(wwdm.climates[ wwdm.climates[,1]==1,1+i],
  		ylab=names(wwdm.climates[1+i])
  	)




library(Simpsons)


### Name: coef.Simpson
### Title: Coef method for "Simpson"
### Aliases: coef.Simpson

### ** Examples

## Not run: 
##D 	#Simulating 100 males 
##D 	coffeem=rnorm(100,100,15)
##D 	neuroticismm=(coffeem*.8)+rnorm(100,15,8)
##D 	clusterid=rep(1,100)
##D 	males=cbind(coffeem,neuroticismm,clusterid)
##D 
##D 	#Simulating 100 females
##D 	coffeef=rnorm(100,100,15)
##D 	neuroticismf=160+((coffeef*-.8)+rnorm(100,15,8))
##D 	clusterid=rep(2,100)
##D 	females=cbind(coffeef,neuroticismf,clusterid)
##D 		data=data.frame(rbind(males,females))
##D 	colnames(data) <- c("Coffee","Neuroticism","gender")
##D example1=Simpsons(Coffee,Neuroticism,clusterid=gender, data=data) 
##D coef(example1)
##D 
##D 
## End(Not run)




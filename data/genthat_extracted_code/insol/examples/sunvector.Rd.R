library(insol)


### Name: sunvector
### Title: Solar vector
### Aliases: sunvector

### ** Examples

# Current solar vector at Greenwich observatory
sunvector(JD(Sys.time()),51.4778,-0.0017,0)

juneday = JD(seq(ISOdate(2019,6,21,0),ISOdate(2019,6,21,23,30),by='30 min'))
## Not run: 
##D  
##D # Path of the sun over Greenwich in summer
##D require(scatterplot3d)
##D scatterplot3d(sunvector(juneday,51.4778,-0.0017,0),
##D 	ylim=c(-1,1),zlim=c(0,1),pch=8,color='orange')
## End(Not run)	
# print values 
options(digits=12)		# make sure decimals are printed
sunvector(juneday,51.4778,-0.0017,0)





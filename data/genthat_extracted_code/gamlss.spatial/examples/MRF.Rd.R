library(gamlss.spatial)


### Name: MRF
### Title: Markov Random Fields Fitting Functions
### Aliases: MRF MRFA
### Keywords: regression

### ** Examples

library(mgcv)
data(columb)
data(columb.polys)
vizinhos=polys2nb(columb.polys)
precisionC <- nb2prec(vizinhos,x=columb$district)
# MRFA
 m1<-MRFA(columb$crime, columb$district, polys=columb.polys)
m11<-MRFA(columb$crime, columb$district, precision=precisionC)
m12<-MRFA(columb$crime, columb$district,  neighbour=vizinhos)
draw.polys(columb.polys, m12, scheme="heat",swapcolors=TRUE)
## Not run: 
##D # MRF 
##D   m2<-MRF(columb$crime, columb$district, polys=columb.polys)
##D  m21<-MRF(columb$crime, columb$district, precision=precisionC)
##D  m22<-MRF(columb$crime, columb$district, neighbour=vizinhos)
##D AIC(m1, m11,m12,m2, m21, m22, k=0)
##D draw.polys(columb.polys, m12, scheme="heat",swapcolors=TRUE)
##D # removing one area
##D columb2 <- columb[-5,]
##D # creating new precision matrix
##D precisionC2 <- nb2prec(vizinhos,x=columb$district,area=columb$district)
##D # MRFA 
##D # new data but declaring  area
##D m11<-MRFA(columb2$crime, columb2$district, polys=columb.polys, area=columb$district)
##D # new data old polys
##D m112<-MRFA(columb2$crime, columb2$district, polys=columb.polys)
##D # new data old precision old area
##D m111<-MRFA(columb2$crime, columb2$district, precision=precisionC,area=columb$district)
##D # new data old neighbour old area
##D m121<-MRFA(columb2$crime, columb2$district,  neighbour=vizinhos,area=columb$district)
##D # new data new precision old area
##D m113<-MRFA(columb2$crime, columb2$district, precision=precisionC2,area=columb$district)
##D AIC(m11,m112,m111,m121,m113, k=0)
##D m11<-MRFA(columb2$crime, columb2$district, polys=columb.polys, area=columb$district)
##D # new data old polys
##D m112<-MRFA(columb2$crime, columb2$district, polys=columb.polys)
##D # new data old precision old area
##D m111<-MRFA(columb2$crime, columb2$district, precision=precisionC,area=columb$district)
##D # new data old neighbour old area
##D m121<-MRFA(columb2$crime, columb2$district,  neighbour=vizinhos,area=columb$district)
##D # new data new precision old area
##D m113<-MRFA(columb2$crime, columb2$district, precision=precisionC2,area=columb$district)
##D AIC(m11,m112,m111,m121,m113, k=0)
##D draw.polys(columb.polys, fitted(m11))
## End(Not run)




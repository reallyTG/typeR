library(xtal)


### Name: design8Vertex
### Title: constructor of Class Design8Vertex
### Aliases: design8Vertex Design8Vertex

### ** Examples

# set the stock with 3 variables: PEG concentration, pH, and salt concentration
stock<-matrix(nrow=8,ncol=3) 
colnames(stock)<-c("PEG","pH","salt")
stock[,1]<-rep(c(6,16),4)
stock[,2]<-rep(c(8,8,9.5,9.5),2)
stock[,3]<-rep(c(0,300),each=4)
stock<-data.frame(stock)
dim<-list(5:0/5,3:0/3,3:0/3) # the dilution serial of stock1
#call the function and return a new object
test8Vertex<-design8Vertex(900,stock,dim) 




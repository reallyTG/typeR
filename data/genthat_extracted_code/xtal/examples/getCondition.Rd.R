library(xtal)


### Name: getCondition
### Title: Getter of the condition matrix in Screen object
### Aliases: getCondition

### ** Examples

# set up a Design object
# please read the 'design8Vertex' for detail
stock=matrix(nrow=8,ncol=3)
colnames(stock)=c("PEG","pH","salt")
stock[,1]=rep(c(6,16),4)
stock[,2]=rep(c(8,8,9.5,9.5),2)
stock[,3]=rep(c(0,300),each=4)
stock=data.frame(stock)
dim=list(5:0/5,3:0/3,3:0/3)
test8Vertex=design8Vertex(900,stock,dim)
# construct a new Screen object
testScreen<-design2Screen(test8Vertex)
condition<-getCondition(testScreen)




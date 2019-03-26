library(xtal)


### Name: getOptimal
### Title: get Optimal condition in the crystallization plate
### Aliases: getOptimal

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
# set up a Screen object
# please read the 'design2Screen' for detail
testScreen<-design2Screen(test8Vertex)
# the score from evaluation of crystal quality in screen plate
# in this example, the crystals are scored according to 
# the scale proposed by Carter & Carter
score=c(2,2,1,1,1,1,1,2,3,3,2,2,1,1,4,4,4,4,1,4,5,3,3,3,2,2,2,2,2,3,1,2,4,3,3,2,1,1,
1,1,1,1,1,1,3,4,3,4,2,2,4,3,3,3,1,4,3,3,4,2,1,2,3,3,4,3,1,3,3,3,5,4,2,2,2,3,
4,3,2,2,5,4,5,5,2,2,5,5,5,5,2,2,5,5,5,4)
testExp=new(Class='Exp',screen=testScreen, score=score)
testOpt<-getOptimal(testExp)




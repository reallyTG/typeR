library(lifecourse)


### Name: lifecourse-package
### Title: lifecourse
### Aliases: lifecourse-package lifecourse
### Keywords: lifecourse

### ** Examples

#---------------------------------------------------
# obtaining the in-built data derived from BHPS data.
#---------------------------------------------------
#data(mydata)
#bbc = mydata
#lbbc = length(mydata[,1])
#---------------------------------------------------
# plotting the sequences with the sequence states
# colour coded.
#--------------------------------------------------
#balphabet =c("non-mover","mover within gb")   	
# specifying the sequence alphabet.  For the BHPS mobility data we 
# specify "non-mover" and "mover within gb"
#blabels = c("non-mover","mover within gb")
#bcodes =  c("non-mover","mover within gb")
#bseq = seqdef(bbc[,2:14], alphabet=balphabet,states = bcodes, labels = blabels) 
# forming the dataset of sequences
#seqIplot(bseq,  sortv = "from.start",cex.legend=1.6,cex.main=3,cex.lab=1.5,cex = 2,
#         cpal=c("lightgoldenrod","blue")) 		
# plotting the sequences

#------------------------------------------
# calculating the mobility index
# for the observed sequences
#------------------------------------------
#bbcseq = bbc[,2:14] 					
# removing the first column which contains the ID for the persons involved.
#totalScore = score = 0					
# calculating the mobility index for the observed sequences
#for(i in 1:length(bbcseq[,1])){
#  myseq = bbcseq[i,1:13]
#  score = (mobility_index(myseq,c("non-mover","mover within gb"),2)) 
#  totalScore = totalScore + score
#}
#totalScore
#testStatistic = totalScore/(13*lbbc)
# the length of the lifecourse = 13, 
#the number of sequences = lbbc
#testStatistic

#-------------------------------------
# Running the non-standardization test
#-------------------------------------
#nll = nonStanTest(bbcseq,balphabet) # obtaining the null distribution
#hist(nll[[1]],main="Null distribution",xlab="Test statistsics",ylab="Frequency",col="grey")
# plotting the null distribution to compare with the observed test statistic.
#par(new=T)
#plot(density(nll[[1]],adjust=3),col="blue",axes=F,lwd=4,xlab="",ylab="",main="")
#abline(v=testStatistic,col="orange",lwd=4)
#nll[[2]]# Left Tailed test - pval
#nll[[3]]# Right Tailed test - pval




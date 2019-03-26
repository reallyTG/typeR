library(ClusteredMutations)


### Name: dissmutmatrix
### Title: Symmetric dissimilarity mutation matrix.
### Aliases: dissmutmatrix

### ** Examples

require(seriation)

###Example 1:
example1<-c(1,101,201,299,301,306,307,317,318,320,418,518,528,628)
10**(dissmutmatrix(position=example1,upper=TRUE))
mut.matrix <- dissmutmatrix(position=example1)
dissplot(mut.matrix,method=NA, 
 options=list(col = c("white","white","orange","orange","red","red","red")))


###Example 2:
###One hypermutated zone with Two hypermutated areas sharing somatic mutations.
example2<-c(1,101,201,299,301,306,307,317,318,320,402,404,406,628)
10**(dissmutmatrix(position=example2,upper=TRUE))
mut.matrix <- dissmutmatrix(position=example2)
dissplot(mut.matrix,method=NA, 
 options=list(col = c("white","white","orange","orange","red","red","red")))


###Example 3:
#data(PD4107a)

###Visualizes a dissimilarity mutation matrix using seriation and matrix shading
###using the method developed by Hahsler and Hornik (2011).
###Chromosome 1;
#mut.matrix <- dissmutmatrix(data=PD4107a,chr=Chr,position=Position,subset=1)
#dissplot(mut.matrix, method=NA, options=list( col = 
# c("black","navy","blue","cyan","green","yellow","orange","red",
#	"darkred","darkred","white")))

###Chromosome 6;
#mut.matrix <- dissmutmatrix(data=PD4107a,chr=Chr,position=Position,subset=6)
#dissplot(mut.matrix, method=NA, options=list( col = 
# c("black","navy","blue","cyan","green","yellow","orange","red","darkred",
#	"darkred","white")))

###Chromosome 12;
#mut.matrix <- dissmutmatrix(data=PD4107a,chr=Chr,position=Position,subset=12)
#dissplot(mut.matrix, method=NA, options=list( col = 
# c("black","navy","blue","cyan","green","yellow","orange","red","darkred",
#   "darkred","white")))




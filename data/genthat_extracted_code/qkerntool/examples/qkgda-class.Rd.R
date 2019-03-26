library(qkerntool)


### Name: qkgda-class
### Title: Class "qkgda"
### Aliases: qkgda-class prj eVal eVec label prj<- eVal<- eVec<- label<-
###   prj,qkgda-method eVal,qkgda-method eVec,qkgda-method
###   label,qkgda-method prj<-,qkgda-method eVal<-,qkgda-method
###   eVec<-,qkgda-method label<-,qkgda-method
### Keywords: classes

### ** Examples

Iris <- data.frame(rbind(iris3[,,1], iris3[,,2], iris3[,,3]), Sp = rep(c("1","2","3"), rep(50,3)))
testset <- sample(1:150,20)
train <- as.matrix(iris[-testset,-5])
test <- as.matrix(iris[testset,-5])
Sp = rep(c("1","2","3"), rep(50,3))
labels <-as.numeric(Sp)
trainlabel <- labels[-testset]
testlabel <- labels[testset]

kgda1 <- qkgda(train, label=trainlabel, kernel = "ratibase", qpar = list(c=1,q=0.9),features = 2)

prj(kgda1)
eVal(kgda1)
eVec(kgda1)
cndkernf(kgda1)
kcall(kgda1)




data("iris3")
Iris <- data.frame(rbind(iris3[,,1], iris3[,,2], iris3[,,3]), Sp = rep(c("1","2","3"), rep(50,3)))
testset <- sample(1:150,20)
train <- as.matrix(iris[-testset,-5])
test <- as.matrix(iris[testset,-5])
Sp = rep(c("1","2","3"), rep(50,3))
labels <-as.numeric(Sp)

trainlabel <- labels[-testset]
testlabel <- labels[testset]
kgda1 <- qkgda(train, label=trainlabel, kernel = "rbfbase", qpar = list(sigma = 0.005,q = 0.8),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")
#predict(kgda1,test)

kgda1 <- qkgda(train, label=trainlabel, kernel = "nonlbase", qpar = list(alpha=.0005,q=.3),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "laplbase", qpar = list(sigma = .01, q = 0.9),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "ratibase", qpar = list(c = .01, q = 0.8),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "multbase", qpar = list(c = 0.05, q = 0.001),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "invbase", qpar = list(c = 0.050, q = 0.9),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "wavbase", qpar = list(theta=0.01,q=0.8),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "powbase", qpar = list(d = .1, q = 0.5),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "logbase", qpar = list(d = .1, q = 0.5),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "caubase", qpar = list(sigma = 0.02,q = 0.5),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "chibase", qpar = list(gamma = 1000,q=0.8),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "studbase", qpar = list(d = .15, q = 0.5),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "nonlcnd", qpar = list(alpha = 0.1),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "polycnd", qpar = list(d = 1,alpha = .01, c=1),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "rbfcnd", qpar = list(gamma = 0.02),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "laplcnd", qpar = list(gamma = .1),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "anocnd", qpar = list(d = 2, sigma = 5000),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "raticnd", qpar = list(c = .0025),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "multcnd", qpar = list(c = 10000-3),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "invcnd", qpar = list(c = 0.05),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "wavcnd", qpar = list(theta = 0.01),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "powcnd", qpar = list(d = .02),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "logcnd", qpar = list(d = .02),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "caucnd", qpar = list(gamma = .01),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "chicnd", qpar = list(),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

kgda1 <- qkgda(train, label=trainlabel, kernel = "studcnd", qpar = list(d = .1),features = 2)
plot(kgda1@prj,col=as.integer(trainlabel), xlab="1st Principal Component",ylab="2nd Principal Component")

predict(kgda1, test)

#qkernel
kfunc <- rbfbase(sigma = .025,q = 0.5)
Ktrain2 <- qkernmatrix(kfunc, train)
kgda1<- qkgda(Ktrain2, label=trainlabel, features = 2)
plot(kgda1@prj,col = as.integer(trainlabel))

kfunc <- nonlbase(alpha=.0005,q=.3)
Ktrain2 <- qkernmatrix(kfunc, train)
kgda1<- qkgda(Ktrain2, label=trainlabel, features = 2)
plot(kgda1@prj,col = as.integer(trainlabel))

kfunc <- laplbase(sigma = .01, q = 0.9)
Ktrain2 <- qkernmatrix(kfunc, train)
kgda1<- qkgda(Ktrain2, label=trainlabel, features = 2)
plot(kgda1@prj,col = as.integer(trainlabel))

kfunc <- ratibase(c = .01, q = 0.8)
Ktrain2 <- qkernmatrix(kfunc, train)
kgda1<- qkgda(Ktrain2, label=trainlabel, features = 2)
plot(kgda1@prj,col = as.integer(trainlabel))

kfunc <- multbase(c = 0.05, q = 0.001)
Ktrain2 <- qkernmatrix(kfunc, train)
kgda1<- qkgda(Ktrain2, label=trainlabel, features = 2)
plot(kgda1@prj,col = as.integer(trainlabel))

kfunc <- invbase(c = 0.050, q = 0.9)
Ktrain2 <- qkernmatrix(kfunc, train)
kgda1<- qkgda(Ktrain2, label=trainlabel, features = 2)
plot(kgda1@prj,col = as.integer(trainlabel))

kfunc <- wavbase(theta=0.01,q=0.8)
Ktrain2 <- qkernmatrix(kfunc, train)
kgda1<- qkgda(Ktrain2, label=trainlabel, features = 2)
plot(kgda1@prj,col = as.integer(trainlabel))

kfunc <- powbase(d = .1, q = 0.5)
Ktrain2 <- qkernmatrix(kfunc, train)
kgda1<- qkgda(Ktrain2, label=trainlabel, features = 2)
plot(kgda1@prj,col = as.integer(trainlabel))

kfunc <- logbase(d = .1, q = 0.5)
Ktrain2 <- qkernmatrix(kfunc, train)
kgda1<- qkgda(Ktrain2, label=trainlabel, features = 2)
plot(kgda1@prj,col = as.integer(trainlabel))

kfunc <- caubase(sigma = 0.02,q = 0.5)
Ktrain2 <- qkernmatrix(kfunc, train)
kgda1<- qkgda(Ktrain2, label=trainlabel, features = 2)
plot(kgda1@prj,col = as.integer(trainlabel))

kfunc <- chibase(gamma = 1000,q=0.8)
Ktrain2 <- qkernmatrix(kfunc, train)
kgda1<- qkgda(Ktrain2, label=trainlabel, features = 2)
plot(kgda1@prj,col = as.integer(trainlabel))

kfunc <- studbase(d = .15, q = 0.5)
Ktrain2 <- qkernmatrix(kfunc, train)
kgda1<- qkgda(Ktrain2, label=trainlabel, features = 2)
plot(kgda1@prj,col = as.integer(trainlabel))

predict(kgda1,qkernmatrix(kfunc, test, train))


#cndkernel
cndkfunc <- nonlcnd(alpha = 0.1)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- polycnd(d = 2,alpha = 1, c=1)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- rbfcnd(gamma = 0.02)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- laplcnd(gamma = .1)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- anocnd(d = 2, sigma = 5000)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- raticnd(c = .0025)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- multcnd(c = 0.03)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- invcnd(c = 0.05)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- wavcnd(theta = 0.01)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- powcnd(d = .02)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- logcnd(d = .02)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- caucnd(gamma = .01)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- chicnd()
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

cndkfunc <- studcnd(d = .1)
Ktrain3 <- cndkernmatrix(cndkfunc, train)
kgda2<- qkgda(Ktrain3, label=trainlabel, features = 2)
plot(kgda2@prj,col = as.integer(trainlabel))

predict(kgda2,cndkernmatrix(cndkfunc, test, train))



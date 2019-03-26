

palette(rainbow(10))

data("mfeat_pix")
trainlabels <- rep(1:10,rep(200,10))

colors = rainbow(length(unique(trainlabels)))
names(colors) = unique(trainlabels)
ecb = function(x,y){
  plot(x,t='n');
  text(x,labels=trainlabels, col=colors[as.integer(unlist(trainlabels))])
}

#qkern
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "rbfbase", qpar = list(sigma = 10,q = 0.99) , epoch_callback = ecb, max_iter = 1000, perplexity=35)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "nonlbase", qpar = list(alpha=0.01,q=0.8) , epoch_callback = ecb, max_iter = 1000, perplexity=30)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "laplbase", qpar = list(sigma = 112, q = 0.9) , epoch_callback = ecb, max_iter = 1000, perplexity=30)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "ratibase", qpar = list(c = .1, q = 0.9) , epoch_callback = ecb, max_iter = 1000, perplexity=30)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "multbase", qpar = list(c = 1, q = 0.9) , epoch_callback = ecb, max_iter = 1000, perplexity=30)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "invbase", qpar = list(c = 1, q = 0.9) , epoch_callback = ecb, max_iter = 1000, perplexity=30)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "wavbase", qpar = list(theta=10,q=0.8) , epoch_callback = ecb, max_iter = 1000, perplexity=30)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "powbase", qpar = list(d = .5, q = 0.9) , epoch_callback = ecb, max_iter = 1000, perplexity=30)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "logbase", qpar = list(d = 2, q = 0.9) , epoch_callback = ecb, max_iter = 1000, perplexity=30)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "caubase", qpar = list(sigma = 100, q = 0.9) , epoch_callback = ecb, max_iter = 1000, perplexity=30)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "chibase", qpar = list(gamma=.01,q = 0.8) , epoch_callback = ecb, max_iter = 1000, perplexity=30)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "studbase", qpar = list(d = .5, q = 0.9) , epoch_callback = ecb, max_iter = 1000, perplexity=30)

#cndkern
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "nonlcnd", qpar = list(alpha=.00001) , epoch_callback = ecb, perplexity=15)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "polycnd", qpar = list(d = 2,alpha = 1, c=1) , epoch_callback = ecb, perplexity=10)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "rbfcnd", qpar = list(gamma = 1e5) , epoch_callback = ecb, perplexity=10)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "laplcnd", qpar = list(gamma = 100000) , epoch_callback = ecb, perplexity=40)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "anocnd", qpar = list(d = 1, sigma = 1e9), epoch_callback = ecb, perplexity=40)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "raticnd", qpar = list(c = 1000) , epoch_callback = ecb, perplexity=10)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "multcnd", qpar = list(c= 10) , epoch_callback = ecb, perplexity=10)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "invcnd", qpar = list(c = 10) , epoch_callback = ecb, perplexity=10)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "wavcnd", qpar = list(theta = 1000), epoch_callback = ecb, perplexity=30)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "powcnd", qpar = list(d = 2) , epoch_callback = ecb, perplexity=10)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "logcnd", qpar = list(d = 2) , epoch_callback = ecb, perplexity=10)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "caucnd", qpar = list(gamma = 1000) , epoch_callback = ecb, perplexity=10)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "chicnd", qpar = list() , epoch_callback = ecb, perplexity=10)
kpc2 <- qtSNE(as.matrix(mfeat_pix), kernel = "studcnd", qpar = list(d = 0.16) , epoch_callback = ecb, perplexity=10)



plot(dimRed(kpc2),col=trainlabels)

## S4 method for signature 'qkernmatrix'
qkfunc <- rbfbase(sigma = 10,q = 0.99)
qKtrain <- qkernmatrix(qkfunc, as.matrix(mfeat_pix))
kpc3 <- qtSNE(qKtrain,max_iter = 1000,epoch_callback = ecb, perplexity=30)
plot(dimRed(kpc3),col=trainlabels)

qkfunc <- nonlbase(alpha=0.01,q=0.8)
qKtrain <- qkernmatrix(qkfunc, as.matrix(mfeat_pix))
kpc3 <- qtSNE(qKtrain,max_iter = 1000,epoch_callback = ecb, perplexity=30)
plot(dimRed(kpc3),col=trainlabels)

qkfunc <- laplbase(sigma = 112, q = 0.9)
qKtrain <- qkernmatrix(qkfunc, as.matrix(mfeat_pix))
kpc3 <- qtSNE(qKtrain,max_iter = 1000,epoch_callback = ecb, perplexity=30)
plot(dimRed(kpc3),col=trainlabels)

qkfunc <- ratibase(c = .1, q = 0.9)
qKtrain <- qkernmatrix(qkfunc, as.matrix(mfeat_pix))
kpc3 <- qtSNE(qKtrain,max_iter = 1000,epoch_callback = ecb, perplexity=30)
plot(dimRed(kpc3),col=trainlabels)

qkfunc <- multbase(c = 1, q = 0.9)
qKtrain <- qkernmatrix(qkfunc, as.matrix(mfeat_pix))
kpc3 <- qtSNE(qKtrain,max_iter = 1000,epoch_callback = ecb, perplexity=30)
plot(dimRed(kpc3),col=trainlabels)

qkfunc <- invbase(c = 1, q = 0.9)
qKtrain <- qkernmatrix(qkfunc, as.matrix(mfeat_pix))
kpc3 <- qtSNE(qKtrain,max_iter = 1000,epoch_callback = ecb, perplexity=30)
plot(dimRed(kpc3),col=trainlabels)

qkfunc <- wavbase(theta=10,q=0.8)
qKtrain <- qkernmatrix(qkfunc, as.matrix(mfeat_pix))
kpc3 <- qtSNE(qKtrain,max_iter = 1000,epoch_callback = ecb, perplexity=30)
plot(dimRed(kpc3),col=trainlabels)

qkfunc <- powbase(d = .5, q = 0.9)
qKtrain <- qkernmatrix(qkfunc, as.matrix(mfeat_pix))
kpc3 <- qtSNE(qKtrain,max_iter = 1000,epoch_callback = ecb, perplexity=30)
plot(dimRed(kpc3),col=trainlabels)

qkfunc <- logbase(d = 2, q = 0.9)
qKtrain <- qkernmatrix(qkfunc, as.matrix(mfeat_pix))
kpc3 <- qtSNE(qKtrain,max_iter = 1000,epoch_callback = ecb, perplexity=30)
plot(dimRed(kpc3),col=trainlabels)

qkfunc <- caubase(sigma = 100, q = 0.9)
qKtrain <- qkernmatrix(qkfunc, as.matrix(mfeat_pix))
kpc3 <- qtSNE(qKtrain,max_iter = 1000,epoch_callback = ecb, perplexity=30)
plot(dimRed(kpc3),col=trainlabels)

qkfunc <- chibase(gamma=.01,q = 0.8)
qKtrain <- qkernmatrix(qkfunc, as.matrix(mfeat_pix))
kpc3 <- qtSNE(qKtrain,max_iter = 1000,epoch_callback = ecb, perplexity=30)
plot(dimRed(kpc3),col=trainlabels)

qkfunc <- studbase(d = .5, q = 0.9)
qKtrain <- qkernmatrix(qkfunc, as.matrix(mfeat_pix))
kpc3 <- qtSNE(qKtrain,max_iter = 1000,epoch_callback = ecb, perplexity=30)
plot(dimRed(kpc3),col=trainlabels)

#cndkfun
cndkfunc <- nonlcnd(alpha=.00001)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- polycnd(d = 2,alpha = 1, c=1)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- rbfcnd(gamma = 1e5)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- laplcnd(gamma = 100000)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- raticnd(c = 1000)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- anocnd(d = 1, sigma = 1e9)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- multcnd(c = 10)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- invcnd(c = 10)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- wavcnd(theta = 1000)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- powcnd(d = 2)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- logcnd(d = 2)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- caucnd(gamma = 1000)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- chicnd()
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)

cndkfunc <- studcnd(d = 0.16)
cndKtrain <- cndkernmatrix(cndkfunc, as.matrix(mfeat_pix))
kpc4 <- qtSNE(cndKtrain,max_iter = 1300,epoch_callback = ecb, perplexity=10)
plot(dimRed(kpc4),col=trainlabels)



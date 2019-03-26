library(hbm)


### Name: hbm
### Title: Build a Hierarchical Block Matrix (HBM)
### Aliases: hbm

### ** Examples


set.seed(2)
n = 200 # chain size
# generate chain configuration (random walk/giant loop model)
conf = generate.random.conf(n, sd = 0.5, scale = FALSE)
# generate a contact map like matrix using the model c ~ exp(-d)
control = exp(-1*as.matrix(dist(conf)))
res = hbm(control)
m = res$hm
image(t(m)[,nrow(m):1], axes = FALSE)
ats = seq(0,1,0.2)
lbls = as.character(n*ats)
axis(1, at= ats, labels = lbls, cex.axis = 0.8) 
ats = seq(1,0,-1*0.2)
lbls = as.character(n*seq(0,1,0.2))
axis(2, at= ats, labels = lbls, cex.axis = 0.8) 
            
res$scales






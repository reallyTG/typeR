## ------------------------------------------------------------------------
set.seed(5)

## ---- echo=TRUE, eval=TRUE, message=FALSE, warning=FALSE-----------------
library(ordinalClust)

## ------------------------------------------------------------------------
m=7
nr=10000
mu=5
pi=0.5

probaBOS=rep(0,m)
for (im in 1:m) probaBOS[im]=pejSim(im,m,mu,pi)
M <- sample(1:m,nr,prob = probaBOS, replace=TRUE)

## ----fig.width = 5, warning=FALSE, eval=TRUE, message=FALSE, tidy=TRUE, dev='png', echo=FALSE, fig.show='hold', fig.align='center'----
library(ggplot2)
library(ordinalClust)
m=7
nr=10000

probaBOS=rep(0,m)
for (im in 1:m) probaBOS[im]=pejSim(im,m,5,0.5)
M <- sample(1:m,nr,prob = probaBOS, replace=TRUE)
M <- as.data.frame(M)
cbPalette <- c("#560303", "#a30606", "#ceac18", "#e0e00d", "#f7f313", "#9bf713", "#0de037")
plot1 <- ggplot(data = M, aes(x = M,fill=factor(M))) +
  geom_histogram() +
  ylim(0, nr) +
  ggtitle("ordinal data with m=7 \n mu=5 and pi=0.5") +
  theme(plot.title = element_text(vjust = -20,hjust = 0.5,size = 16)) +
  scale_x_continuous(breaks=1:7, labels=c(1:7), limits=c(0,8)) +
  scale_fill_manual(values=cbPalette)

plot1

## ---- echo=TRUE, eval=FALSE, message=FALSE, warning=FALSE----------------
#  
#  library(ordinalClust)
#  data("dataqol")
#  set.seed(5)
#  
#  # loading the ordinal data
#  M <- as.matrix(dataqol[,2:29])
#  
#  m = 4
#  
#  krow = 4
#  
#  nbSEM=50
#  nbSEMburn=40
#  nbindmini=2
#  init = "random"
#  
#  object <- bosclust(x=M,kr=krow, m=m, nbSEM=nbSEM,
#      nbSEMburn=nbSEMburn, nbindmini=nbindmini, init=init)
#  

## ---- echo=TRUE, eval=FALSE, message=FALSE, warning=FALSE----------------
#  
#  plot(object)
#  

## ----echo=FALSE, out.width = "75%", out.extra='style="display: block;margin: auto;"', fig.cap=""----
library(knitr)    # For knitting document and include_graphics function

include_graphics("figures/clust.png")

## ---- echo=TRUE, eval=FALSE, message=FALSE, warning=FALSE----------------
#  
#  library(ordinalClust)
#  
#  # loading the real dataset
#  data("dataqol")
#  set.seed(5)
#  
#  # loading the ordinal data
#  M <- as.matrix(dataqol[,2:29])
#  
#  
#  # defining different number of categories:
#  m=4
#  
#  
#  # defining number of row and column clusters
#  krow = 5
#  kcol = 4
#  
#  # configuration for the inference
#  nbSEM=50
#  nbSEMburn=40
#  nbindmini=2
#  init = "kmeans"
#  
#  # Co-clustering execution
#  object <- boscoclust(x=M,kr=krow,kc=kcol,m=m,nbSEM=nbSEM,
#            nbSEMburn=nbSEMburn, nbindmini=nbindmini, init=init)
#  

## ----echo=TRUE, eval=FALSE, message=FALSE, warning=FALSE-----------------
#  
#  plot(object)
#  

## ----echo=FALSE, out.width = "75%", out.extra='style="display: block;margin: auto;"', fig.cap=""----
library(knitr)    # For knitting document and include_graphics function

include_graphics("figures/coclust.png")

## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------

library(ordinalClust)
# loading the real dataset
data("dataqol.classif")

set.seed(5)

# loading the ordinal data
M <- as.matrix(dataqol.classif[,2:29])


# creating the classes values
y <- as.vector(dataqol.classif$death)


# sampling datasets for training and to predict
nb.sample <- ceiling(nrow(M)*2/3)
sample.train <- sample(1:nrow(M), nb.sample, replace=FALSE)

M.train <- M[sample.train,]
M.validation <- M[-sample.train,]
nb.missing.validation <- length(which(M.validation==0))


y.train <- y[sample.train]
y.validation <- y[-sample.train]

# number of classes to predict
kr <- 2

# configuration for SEM algorithm
nbSEM=50
nbSEMburn=40
nbindmini=2
init="kmeans"


# different kc to test with cross-validation
kcol <- c(0,1,2,3)
m <- 4


# matrix which contains the predictions for all different kc
predictions <- matrix(0,nrow=length(kcol),ncol=nrow(M.validation))

for(kc in 1:length(kcol)){
  res <- bosclassif(x=M.train, y=y.train, idx_list=c(0),
                    kr=kr, kc=kcol[kc], init=init, m=m, nbSEM=nbSEM, 
                    nbSEMburn=nbSEMburn, nbindmini=nbindmini)
  new.prediction <- predict(res, M.validation)
  predictions[kc,] <- new.prediction@zr_topredict
}

predictions = as.data.frame(predictions)
row.names <- c()
for(kc in kcol){
  name= paste0("kc=",kc)
  row.names <- c(row.names,name)
}
rownames(predictions)=row.names

## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------

library(caret)

actual <- y.validation -1


precisions <- rep(0,length(kcol))
recalls <- rep(0,length(kcol))
sensitivities <- rep(0,length(kcol))
specificities <- rep(0,length(kcol))

for(i in 1:length(kcol)){
  prediction <- unlist(as.vector(predictions[i,])) -1
  conf_matrix<-table(prediction,actual)
  precisions[i] <- precision(conf_matrix)
  recalls[i] <- recall(conf_matrix)
  sensitivities[i] <- sensitivity(conf_matrix)
  specificities[i] <- specificity(conf_matrix)
}


## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------

precisions
recalls
sensitivities
specificities


## ---- echo=TRUE, eval=FALSE, message=FALSE, warning=FALSE----------------
#  
#  library(ordinalClust)
#  
#  # loading the real dataset
#  data("dataqol")
#  set.seed(5)
#  
#  # loading the ordinal data
#  M <- as.matrix(dataqol[,2:31])
#  
#  
#  # defining different number of categories:
#  m=c(4,7)
#  
#  
#  # defining number of row and column clusters
#  krow = 3
#  kcol = c(3,1)
#  
#  # configuration for the inference
#  nbSEM=50
#  nbSEMburn=40
#  nbindmini=2
#  init='kmeans'
#  
#  d.list <- c(0,28)
#  
#  # Co-clustering execution
#  object <- boscoclust(x=M,kr=krow,kc=kcol,m=m, idx_list=d.list,
#                      nbSEM=nbSEM,nbSEMburn=nbSEMburn,
#                       nbindmini=nbindmini, init=init)
#  


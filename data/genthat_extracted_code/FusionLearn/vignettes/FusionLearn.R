## ----include = FALSE-----------------------------------------------------
library(ggplot2)
#library(ggalt)
#library(ggfortify)
#library(ggpubr)
library(FusionLearn)
#library(lattice)
set.seed(123)
cex = 0.5

## ----eval=FALSE----------------------------------------------------------
#  install.packages("FusionLearn",repos = "http://cran.us.r-project.org")

## ------------------------------------------------------------------------
library(MASS)
library(mvtnorm)
m <- 4
N <- 100
p <- 10

## ----include=TRUE--------------------------------------------------------
## parameters
rho <- 0.3
Rho <- rho*matrix(1,4,4) + diag(1-rho,4,4)
sigma <- c(2,1,3,2)
Sigma <- Rho * sigma * rep(sigma, each = nrow(Rho))
mu = c(-1,1,0.5,-0.5)

## data information
name_pf =  c("platform 1","platform 2", "platform 3","platform 4")
name_id =  paste("ID", seq(1:N))
name_cov = paste("M", seq(1:p))

## ------------------------------------------------------------------------
x <- array(NA,dim = c(N,m,p))
for(k in 1:p){
  x[,,k] <- mvrnorm(N,mu,Sigma)
}

## ----include = FALSE-----------------------------------------------------
dimnames(x) = list(name_id, name_pf, name_cov)

## ----echo=FALSE----------------------------------------------------------
print("Platform 1")
print(round(x[1:5,1,1:5],3))

print("Platform 2")
print(round(x[1:5,2,1:5],3))

print("Platform 3")
print(round(x[1:5,3,1:5],3))
print("Platform 4")
print(round(x[1:5,4,1:5],3))

## ----echo= FALSE---------------------------------------------------------
tp <- 5
beta <- array(0,dim = c(p,m))
for (j in 1:m){
  beta[1:tp,j]<- c(1,1.5,1.2,2,1.8)*j
  beta[(tp+1):p,j]<-rep(0,(p-tp))
} 
rownames(beta) <- name_cov
e <- rmvnorm(N,mu,Sigma)

x1 = x[,1,]
x2 = x[,2,]
x3 = x[,3,]
x4 = x[,4,]
  
y1 = x1 %*% beta[,1] + e[,1]
y2 = x2 %*% beta[,2] + e[,2]
y3 = x3 %*% beta[,3] + e[,3]
y4 = x4 %*% beta[,4] + e[,4]

## ------------------------------------------------------------------------
x <- list(x1, x2, x3, x4)
y <- list(y1, y2, y3, y4)

## ------------------------------------------------------------------------
result <- fusionbase(x, y, lambda = 0.9, N = N ,p = p, m = m, methods = "scad", 
                     Complete = TRUE)
print(result) ## partial estimated parameters

## ----fig.align='center', fig.width= 4.5, fig.height = 3.5, echo = FALSE, fig.cap="Learning example of simulated continuous responses"----
para <- data.frame(result$beta)
rownames(para) <- name_cov
g <- ggplot(para, aes(x=1:10))
g + geom_area(aes(y=X3+0.05, fill="Platform 3"))  + 
  geom_area(aes(y=X4+0.02, fill="Platform 4"))   +
  geom_area(aes(y=X1*1.2+0.01, fill="Platform 1")) + 
  geom_area(aes(y=X2*0.7+0.06, fill="Platform 2"))  + 
labs(title="Estimated Coefficients", 
       subtitle="Non-zero v.s. zero coefficients", 
       caption="Continuous responses", 
       y = "Estimation",
       x = " ") +
 scale_x_continuous( name =  "Predictors", breaks = 1:10, labels = name_cov) +
 scale_y_discrete(labels = NULL) 
#+theme(panel.background = element_rect(fill = "white", colour = "grey50"))


## ----echo = FALSE--------------------------------------------------------
y1. <- y1 > 0
y2. <- y2 > 0
y3. <- y3 > 0
y4. <- y4 > 0
y.bin <- list(y1. ,y2., y3., y4.)

## ------------------------------------------------------------------------
result <- fusionbinary(x, y.bin, lambda = 0.15, N = N, p = p, m = m, methods = "scad",
                       link = "logit")
print(result)

## ----fig.align='center',fig.width= 4.5, fig.height = 3.5, echo = FALSE, fig.cap = "Learning example of simulated binary responses"----
para <- data.frame(result$beta)
rownames(para) <- name_cov
g <- ggplot(para, aes(x=1:10))
g + geom_area(aes(y=X1*1.4+0.01, fill="Platform 1")) + 
  geom_area(aes(y=X2*1.2+0.015, fill="Platform 2"))  + 
  geom_area(aes(y=X3*1.1+0.005, fill="Platform 3"))  + 
  geom_area(aes(y=X4*0.8+0.02, fill="Platform 4"))   +
labs(title="Estimated Coefficients", 
       subtitle="Non-zero v.s. zero coefficients", 
       caption="Binary responses", 
       y = "Estimation",
       x = " ") +
 scale_x_continuous( name =  "Predictors", breaks = 1:10, labels = name_cov) +
 scale_y_discrete(labels = NULL)  
 #+theme(panel.background = element_rect(fill = "white", colour = "grey50"))

table(beta[,1]!=0, result$beta[,1]!=0)

## ----echo = FALSE--------------------------------------------------------
y.mixed <- list(y1,y2, y3>0, y4>0)

## ------------------------------------------------------------------------
result <- fusionmixed(x, y.mixed, lambda = 0.4, N = N, p = p, m1 = 2, m2 = 2, methods 
                      = "scad", link = "logit")
print(result)

## ----fig.align='center', fig.width= 4.5, fig.height = 3.5,  echo = FALSE, fig.cap = "Learning example of simulated mixed responses"----
para <- data.frame(result$beta)
rownames(para) <- name_cov
g <- ggplot(para, aes(x=1:10))
g + geom_area(aes(y=X1+0.01, fill="Platform 1")) + 
  geom_area(aes(y=X2*0.7+0.015, fill="Platform 2"))  + 
  geom_area(aes(y=X3*0.7+0.005, fill="Platform 3"))  + 
  geom_area(aes(y=X4*0.7+0.02, fill="Platform 4"))   +
labs(title="Estimated Coefficients", 
       subtitle="Non-zero v.s. zero coefficients", 
       caption="Mixed responses", 
       y = "Estimation",
       x = " ") +
 scale_x_continuous( name =  "Predictors", breaks = 1:10, labels = name_cov) +
 scale_y_discrete(labels = NULL) 
 #+theme(panel.background = element_rect(fill = "white", colour = "grey50"))

table(beta[,1]!=0, result$beta[,1]!=0)

## ----echo=FALSE----------------------------------------------------------
x2. <- x2
x2.[,2] <- NA
print(cbind(round(x2.[1:5,1:5],3)))

## ----echo = FALSE--------------------------------------------------------
x <- list(x1, x2., x3, x4)
y <- list(y1, y2, y3, y4)

## ------------------------------------------------------------------------
result <- fusionbase(x, y, lambda = 1.3, N = N, p = p, m = m, methods = "scad", 
                     Complete = FALSE)
print(result$beta)

## ----include = F---------------------------------------------------------
m <- 4
N <- 500
p <- 1000

## parameters
rho <- 0.3
Rho <- rho*matrix(1,4,4) + diag(1-rho,4,4)
sigma <- c(2,1,3,2)
Sigma <- Rho * sigma * rep(sigma, each = nrow(Rho))
mu =c(0,0,0,0)

## data information
name_pf =  c("platform 1","platform 2", "platform 3","platform 4")
name_id =  paste("ID", seq(1:N))
name_cov = paste("M", seq(1:p))

## Main
x <- array(NA,dim = c(N,m,p))
for(k in 1:p){
  x[,,k] <- mvrnorm(N,mu,Sigma)
}

dimnames(x) = list(name_id, name_pf, name_cov)


tp <- 40
beta <- array(0,dim = c(p,m))
for (j in 1:m){
  beta[1:tp,j]<- runif(tp, 1,2)
  beta[(tp+1):p,j]<-rep(0,(p-tp))
} 
beta[c(2,4,6,10,16,20),] <- - beta[c(2,4,6,10,16,20),]
rownames(beta) <- name_cov

rho <- 0.3
Rho <- rho*matrix(1,4,4) + diag(1-rho,4,4)
sigma <- c(2,1,3,2)
Sigma <- Rho * sigma * rep(sigma, each = nrow(Rho))
e <- rmvnorm(N,mu,Sigma)

x1 = x[,1,]
x2 = x[,2,]
x3 = x[,3,]
x4 = x[,4,]
  
y1 = x1 %*% beta[,1] + e[,1]
y2 = x2 %*% beta[,2] + e[,2]
y3 = x3 %*% beta[,3] + e[,3]
y4 = x4 %*% beta[,4] + e[,4]

x <- list(x1, x2, x3, x4)
y <- list(y1, y2, y3, y4)

## ----fig.align='center', echo = TRUE, fig.width= 4.5, fig.height = 3.5, fig.cap = "Example of model selection process in the fusion learning algorithm", warning = F----
lambda <- c(0.19, 0.2, 0.3, 0.5, 0.6, 1.75, 2)
model <- fusionbase.fit(x, y, lambda, N = 500, p = 1000, m = 4, depen = "CORR")
print(model)

## ------------------------------------------------------------------------
result <- fusionbase(x, y, lambda = 0.5, N = 500, p = 1000, m = 4)

## ----echo=F--------------------------------------------------------------
result_table = table(beta[,1]!=0,result$beta[,1]!=0 )
colnames(result_table) <- c("Est zero", "Est non-zero")
rownames(result_table) <- c("True zero", "True non-zero")
result_table

## ----fig.align='center', fig.width= 4.5, fig.height = 3.5, fig.cap = "Model selection for the function `fusionbase.fit`"----
##analysis of the stock index data
#Responses contain indices "VIX","GSPC", and "DJI" 
y <- list(stockindexVIX[,1],stockindexGSPC[,1],stockindexDJI[,1]) 
#Predictors include 46 stocks
x <- list(stockindexVIX[,2:47],stockindexGSPC[,2:47],stockindexDJI[,2:47])  
##Implementing the model selection algorithm based on the psuedolikelihood 
##information criteria  
model <- fusionbase.fit(x,y,seq(0.03,5,length.out = 10),232,46,3,depen="CORR")
print(model)
lambda <- model[which.min(model[,2]),1]
result <- fusionbase(x,y,lambda,232,46,3)
##Identify the significant predictors for the three indices
id <- which(result$beta[,1]!=0)+1
colnames(stockindexVIX)[id]

## ----fig.align='center'--------------------------------------------------
##Analysis of the gene data 
y = list(mockgene1[,2],mockgene2[,2])           ## responses "status"
x = list(mockgene1[,3:502],mockgene2[,3:502])   ## 500 predictors 
##Implementing fusion learning algorithm 
lambda <- seq(0.1,0.5, length.out = 10)
result <- fusionbinary(x,y,0.3,N=c(98,286),500,2) 
id <- which(result$beta[,1]!=0)+2
genename <- colnames(mockgene1)[id]
print(genename)


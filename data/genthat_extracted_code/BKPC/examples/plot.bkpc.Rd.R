library(BKPC)


### Name: plot.bkpc
### Title: Plot bkpc Objects
### Aliases: plot.bkpc

### ** Examples

set.seed(-88106935)

data(microarray)

# consider only four tumour classes (NOTE: "NORM" is not a class of tumour)
y <- microarray[, 2309]
train <- as.matrix(microarray[y != "NORM", -2309])
wtr <- factor(microarray[y != "NORM", 2309], levels = c("BL" ,  "EWS" , "NB" ,"RMS" ))

n.kpc <- 6
n.class <- length(levels(wtr)) - 1

K <- gaussKern(train)$K

# supply starting values for the parameters
# use Gaussian kernel as input

result <- bkpc(K, y = wtr, n.iter = 10000,  thin = 100, n.kpc = n.kpc,  
initSigmasq = 0.001, initBeta = matrix(10, n.kpc *n.class, 1), 
initTau =matrix(10, n.kpc * n.class, 1), intercept = FALSE, rotate = TRUE)



plot(result, type = "tracePlot")
plot(result, type = "boxPlot", n.burnin = 20)
plot(result, n.burnin = 20)




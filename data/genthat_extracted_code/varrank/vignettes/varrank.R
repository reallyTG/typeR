## ----setup, include = FALSE, cache = FALSE-------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, 
  comment = "#>", 
  fig.width = 6, fig.height = 6, fig.align = "center"
)
options(digits = 3)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("varrank")

## ----eval=TRUE-----------------------------------------------------------
library(varrank)

## ---- warning = FALSE, message = FALSE-----------------------------------

data(PimaIndiansDiabetes, package = "mlbench")

varrank.PimaIndiansDiabetes <- varrank(data.df = PimaIndiansDiabetes, method = "estevez", variable.important = "diabetes", discretization.method = "sturges", algorithm = "forward", scheme="mid", verbose = FALSE)

summary(varrank.PimaIndiansDiabetes)

## ------------------------------------------------------------------------
plot(varrank.PimaIndiansDiabetes)

## ------------------------------------------------------------------------
library(caret)
library(e1071)
# prepare training scheme
control <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
# train the model
model <- train(diabetes~., data = PimaIndiansDiabetes, method = "lvq", preProcess = "scale", trControl = control)
# estimate variable importance
importance <- varImp(model, useModel = FALSE)
# summarize importance
print(importance)
# plot importance
plot(importance)

## ------------------------------------------------------------------------
library(Boruta)
out.boruta <- Boruta(diabetes~., data = PimaIndiansDiabetes)
print(out.boruta)
plot(out.boruta, cex.axis = 0.8, las=1)

## ---- warning = FALSE, message = FALSE-----------------------------------
library(varSelRF)

rf <- randomForest(diabetes~., data = PimaIndiansDiabetes, ntree = 200, importance = TRUE)
rf.rvi <- randomVarImpsRF(xdata = PimaIndiansDiabetes[, 1:8], Class = PimaIndiansDiabetes[, 9], forest = rf, numrandom = 20, usingCluster = FALSE)
randomVarImpsRFplot(rf.rvi, rf, show.var.names = TRUE, cexPoint = 0.3,cex.axis=0.3)

## ------------------------------------------------------------------------
library(FSelector)
weights <- information.gain(diabetes~., data = PimaIndiansDiabetes)
row.names(weights)[order(weights, decreasing = TRUE)]

## ---- fig.width = 3, fig.height = 3--------------------------------------
### 1D example ####
# sample from continuous uniform distribution
x1 = runif(1000)
hist(x1, xlim = c(0, 1))

#True entropy value: H(X) = log(1000) = 6.91
entropy.data(freqs.table = table(discretization(data.df = data.frame(x1), discretization.method = "rice", freq = FALSE)))

# sample from a non-uniform distribution
x2 = rnorm(n = 10000, mean = 0, sd = 1)
hist(x2)

#differential entropy: H(x) = log(1*sqrt(2*pi*exp(1))) = 1.42
entropy.data(freqs.table = table(discretization(data.df = data.frame(x2), discretization.method = "sturges", freq = FALSE)))

### 2D example ####
# two independent random variables
x1 <- runif(100)
x2 <- runif(100)


## Theoretical entropy: 2*log(100) = 9.21
entropy.data(freqs.table = table(discretization(data.df = data.frame(x1, x2), discretization.method = "sturges", freq = FALSE)))

## ------------------------------------------------------------------------
# mutual information for 2 uniform random variables
x1 <- runif(10000)
x2 <- runif(10000)

# approximately zero
mi.data(X = x1, Y = x2, discretization.method = "kmeans") 

# MI computed directely
mi.data(X = x2, Y = x2, discretization.method = "kmeans") 

# MI computed with entropies:
##MI(x,y) = H(x)+H(y)-H(x, y) for x=y; 
##MI(x,x) = 2 * H(x) - H(x,x) 
2 * entropy.data(freqs.table = table(discretization(data.df = data.frame(x2), discretization.method = "kmeans", freq = FALSE))) - entropy.data(freqs.table = table(discretization(data.df = data.frame(x2, x2), discretization.method = "kmeans", freq = FALSE)))

## ------------------------------------------------------------------------
output <- varrank(data.df = PimaIndiansDiabetes, method = "battiti", variable.important = "diabetes", discretization.method = "sturges", ratio = 0.6, algorithm = "forward", scheme="mid", verbose = FALSE)

##print
output

##summary
summary(output)

## ------------------------------------------------------------------------
output <- varrank(data.df = PimaIndiansDiabetes, method = "battiti", variable.important = "diabetes", discretization.method = "sturges", ratio = 0.6, algorithm = "forward", scheme="mid", verbose = FALSE)

plot(output)

## ------------------------------------------------------------------------
output<-varrank(data.df = PimaIndiansDiabetes, method = "battiti", variable.important = "diabetes", discretization.method = "sturges", ratio = 0.6, algorithm = "backward",scheme="mid", verbose = FALSE)

plot(output)

## ------------------------------------------------------------------------
pairs(swiss, panel = panel.smooth, main = "Swiss Data", 
      col = 3 + (swiss$Catholic > 80), gap = 0)
summary(lm(Fertility ~ . , data = swiss))

## ------------------------------------------------------------------------
swiss.varrank <- varrank(data.df = swiss, method = "estevez", variable.important = "Fertility", discretization.method = "sturges", algorithm = "forward", scheme = "mid", verbose = FALSE)
swiss.varrank
plot(swiss.varrank)

## ------------------------------------------------------------------------
pairs(longley, main = "Longley Data", gap = 0)
summary(fm1 <- lm(Employed ~ ., data = longley))

## ------------------------------------------------------------------------
longley.varrank <- varrank(data.df = longley, method = "estevez", variable.important = "Employed", discretization.method = "sturges", algorithm = "forward", scheme = "mid", verbose = FALSE)
longley.varrank
plot(longley.varrank)

## ------------------------------------------------------------------------
pairs(airquality, panel = panel.smooth, main = "Air Quality Data", gap = 0)

## ------------------------------------------------------------------------
airquality.varrank <- varrank(data.df = (data.frame(lapply(airquality[complete.cases(airquality), ], as.numeric))), method = "estevez", variable.important = "Ozone", discretization.method = "sturges", algorithm = "forward", scheme = "mid", verbose = FALSE)
airquality.varrank
plot(airquality.varrank)

## ------------------------------------------------------------------------
data(nassCDS, package = "DAAG")

nassCDS.varrank <- varrank(data.df = nassCDS, method = "peng", variable.important = "dead", discretization.method = "sturges", algorithm = "forward", scheme = "mid", verbose = FALSE)
nassCDS.varrank

plot(nassCDS.varrank, notecex = 0.5)

## ------------------------------------------------------------------------
data(epi, package = "psych")

epi.varrank <- varrank(data.df = data.frame(lapply(epi[complete.cases(epi), ], as.factor)), method = "peng", variable.important = c("V6", "V12", "V18", "V24", "V30", "V36", "V42", "V48", "V54"), discretization.method = "sturges", algorithm = "forward", scheme = "mid", verbose = FALSE)

##example of custom plot using gplots
cool <- rainbow(50, start = rgb2hsv(col2rgb("cyan"))[1], end = rgb2hsv(col2rgb("blue"))[1])
warm <- rainbow(50, start = rgb2hsv(col2rgb("red"))[1], end = rgb2hsv(col2rgb("yellow"))[1])
cols <- c(rev(cool), rev(warm))
mypalette <- colorRampPalette(cols)(100)

require(gplots)
heatmap.2(epi.varrank$distance.m, sepcolor = "white", 
          margins = c(3, 3), 
          Rowv = FALSE, 
          Colv = FALSE , 
          trace = "none", col = mypalette, 
          #distfun = distCor, 
          #hclustfun = hclustAvg, 
          dendrogram = "none", 
          RowSideColors = c("grey", "grey", "black", "grey", "grey", "grey", "black", "grey", "grey", "black", "black", "grey", "grey", "black", "grey", "grey", "black", "grey", "black", "black", "black", "black", "grey", "grey", " grey", "grey", "black", "black", "black", "black", "grey", "grey", "black", "grey", "black", "black", "grey", "black", "grey", "black", "black", "grey", "grey", "black", "grey", "black", "black", "black"), 
          key.title = "", 
          key.xlab = "Redundancy       Relevancy", density.info = "density", denscol = "black")

par(lend = 0)           # square line ends for the color legend
legend("topright",     # location of the legend on the heatmap plot
       legend = c("Extrovert score", "Neurotic score"), # category labels
       col = c("grey", "black"), # color key
       lty = 1,            # line style
       lwd = 10            # line width
)



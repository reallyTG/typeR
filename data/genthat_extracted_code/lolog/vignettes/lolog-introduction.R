## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  out.width="80%", 
  dpi=120
)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("statnet")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("lolog")

## ---- eval=FALSE---------------------------------------------------------
#  # If devtools is not installed:
#  # install.packages("devtools")
#  
#  devtools::install_github("statnet/lolog")

## ------------------------------------------------------------------------
library(lolog)
set.seed(1)

## ------------------------------------------------------------------------
suppressPackageStartupMessages(library(ergm))
#data(package='ergm') # tells us the datasets in our packages
data(florentine) # loads flomarriage and flobusiness data
flomarriage # Let's look at the flomarriage data
plot(flomarriage) # Let's view the flomarriage network

## ------------------------------------------------------------------------
flomodel.01 <- lolog(flomarriage~edges) # fit model
flomodel.01 

summary(flomodel.01) # look in more depth

## ------------------------------------------------------------------------
flomodel.02 <- lolog(flomarriage~edges()+triangles(), verbose=FALSE) 
summary(flomodel.02)

## ------------------------------------------------------------------------
coef1 = flomodel.02$theta[1]
coef2 = flomodel.02$theta[2]
logodds = coef1 + c(0,1,2) * coef2
expit = function(x) 1/(1+exp(-x))
ps = expit(logodds)
coef1 = round(coef1, 3)
coef2 = round(coef2, 3)
logodds = round(logodds, 3)
ps = round(ps, 3)

## ------------------------------------------------------------------------
class(flomodel.02) # this has the class lolog

names(flomodel.02) # let's look straight at the lolog obj.

## ------------------------------------------------------------------------
flomodel.02$theta 
flomodel.02$formula 
wealth <- flomarriage %v% 'wealth' # the %v% extracts vertex
wealth # attributes from a network
plot(flomarriage, vertex.cex=wealth/25) # network plot with vertex size 
                                        # proportional to wealth

## ------------------------------------------------------------------------
flomodel.03 <- lolog(flomarriage~edges+nodeCov('wealth'))
summary(flomodel.03)

## ------------------------------------------------------------------------
wdiff<-outer(flomarriage %v% "wealth", flomarriage %v% "wealth",function(x,y){abs(x-y)>20})
table(wdiff)
flomodel.04 <- lolog(flomarriage~edges+nodeCov('wealth')+edgeCov(wdiff,"inequality"))
summary(flomodel.04)

## ------------------------------------------------------------------------
data(samplk) 
ls() # directed data: Sampson's Monks
samplk3
plot(samplk3)
sampmodel.01 <- lolog(samplk3~edges+mutual, verbose=FALSE)
summary(sampmodel.01)

## ------------------------------------------------------------------------
data(faux.mesa.high) 
mesa <- faux.mesa.high
mesa
plot(mesa, vertex.col='Grade')
#legend('bottomleft',fill=7:12,legend=paste('Grade',7:12),cex=0.75)
mesa %v% "GradeCat" <- as.character(mesa %v% "Grade")
fauxmodel.01 <- lolog(mesa ~edges + nodeMatch('GradeCat') + nodeMatch('Race'))
summary(fauxmodel.01)

## ------------------------------------------------------------------------
# This may take a minute or two
fauxmodel.02 <- lolog(mesa ~edges + nodeMatch('GradeCat') + nodeMatch('Race') + 
                        triangles + star(2), verbose=FALSE)
summary(fauxmodel.02)

## ---- error=TRUE---------------------------------------------------------
fauxmodel.01.ergm <- ergm(mesa ~edges + nodematch('GradeCat') + nodematch('Race') + 
                            triangles + kstar(2))

## ------------------------------------------------------------------------
library(network)
data(lazega)
seniority <- as.numeric(lazega %v% "seniority") # Lower values are more senior
fit <- lolog(lazega ~  edges() + triangles() + nodeCov("cSeniority") + 
               nodeCov("cPractice") + nodeMatch("gender") + nodeMatch("practice") + 
               nodeMatch("office") | seniority, verbose=FALSE)
summary(fit)

## ----eval=FALSE----------------------------------------------------------
#  help('lolog-terms')

## ---- eval=FALSE---------------------------------------------------------
#  lologPackageSkeleton()

## ---- eval=FALSE---------------------------------------------------------
#  help("inlineLologPlugin")

## ------------------------------------------------------------------------
calculateStatistics(mesa ~ edges + triangles + degree(0:15))

## ------------------------------------------------------------------------
nets <- simulate(flomodel.03,nsim=10) #Generates a list of BinaryNet objects
plot(nets[[1]])

## ---- eval=FALSE---------------------------------------------------------
#  data(sampson)
#  
#  #coersion
#  net <- as.BinaryNet(samplike)
#  nw2 <- as.network(net)
#  print(nw2)
#  
#  #dyad Extraction
#  net[1:2,1:5]
#  net$outNeighbors(c(1,2,3))
#  
#  #dyad assignment
#  net[1,1:5] <- rep(NA,5)
#  net[1:2,1:5]
#  net[1:2,1:5,maskMissing=FALSE] #remove the mask over missing values and see
#                                 #nothing was really changed
#  
#  #node variables
#  net$variableNames()
#  net[["group"]]
#  net[["rnorm"]] <- rnorm(18)
#  net[["rnorm"]]
#  
#  #See available methods
#  #print(DirectedNet)
#  #print(UndirectedNet)

## ---- tidy=FALSE---------------------------------------------------------
flomodel.04 <- lolog(flomarriage ~ edges() + preferentialAttachment(), 
                     flomarriage ~ star(2), verbose=FALSE)
summary(flomodel.04)

## ----  out.width="100%", dpi=340-----------------------------------------
gdeg <- gofit(flomodel.03, flomarriage ~ degree(0:10))
gdeg
plot(gdeg)

## ------------------------------------------------------------------------
gesp <- gofit(flomodel.03, flomarriage ~ esp(0:5))
gesp
plot(gesp)


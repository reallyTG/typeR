library(HistDAWass)


### Name: HistDAWass-package
### Title: Histogram-Valued Data Analysis
### Aliases: HistDAWass-package HistDAWass
### Keywords: package

### ** Examples


# Generating a list of distributions
a<-vector("list",4)
a[[1]]<-distributionH(x=c(80,100,120,135,150,165,180,200,240),
                      p=c(0,0.025,0.1,0.275,0.525,0.725,0.887,0.975,1))
a[[2]]<-distributionH(x=c(80,100,120,135,150,165,180,195,210,240),
                      p=c(0,0.013,0.101,0.255,0.508,0.718,0.895,0.961,0.987,1))
a[[3]]<-distributionH(x=c(95,110,125,140,155,170,185,200,215,230,245),
                      p=c(0,0.012,0.041,0.154,0.36,0.595,0.781,0.929,0.972,0.992,1))
a[[4]]<-distributionH(x=c(105,120,135,150,165,180,195,210,225,240,260),
                      p=c(0,0.009,0.035,0.081,0.186,0.385,0.633,0.832,0.932,0.977,1))
# Generating a list of names of observations
namerows<-list( 'u1'  , 'u2') 
# Generating a list of names of variables
namevars<-list( 'Var_1'  , 'Var_2') 
# creating the MatH  
Mat_of_distributions<-MatH(x=a, nrows = 2, ncols = 2, 
                            rownames=namerows, varnames=namevars, by.row=FALSE )





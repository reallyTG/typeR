library(MVar)


### Name: Plot.CCA
### Title: Graphs of the Canonical Correlation Analysis (CCA).
### Aliases: Plot.CCA
### Keywords: Analysis of canonical correlation CCA

### ** Examples

data(DataMix) # database

Data <- DataMix[,2:ncol(DataMix)]

rownames(Data) <- DataMix[,1]

X <- as.data.frame(NormData(Data[,1:2],2))

Y <- as.data.frame(NormData(Data[,5:6],2))

Resp <- CCA(X, Y, Type = 1, Test = "Bartlett", Sign = 0.05) # performs CCA

Tit = c("Scree-plot","Correlations","Scores of the group X","Scores of the group Y")

Plot.CCA(Resp, Titles = Tit, xlabel = NA, ylabel = NA,
         Color = TRUE, Casc = TRUE)




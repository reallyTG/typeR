library(MVar)


### Name: Plot.PCA
### Title: Graphs of the Principal Components Analysis (PCA).
### Aliases: Plot.PCA
### Keywords: Principal Components Analysis PCA

### ** Examples

data(DataQuan) # set of quantitative data

Data <- DataQuan[,2:8]

rownames(Data) <- DataQuan[1:nrow(DataQuan),1]

PC <- PCA(Data, 2) # performs the PCA

Tit = c("Scree-plot","Graph of the Observations","Circle of Correlation")

Plot.PCA(PC, Titles = Tit, xlabel = NA, ylabel = NA,
         Color = TRUE, LinLab = NA, Casc = TRUE)




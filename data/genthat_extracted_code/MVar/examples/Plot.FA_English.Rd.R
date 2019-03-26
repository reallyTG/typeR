library(MVar)


### Name: Plot.FA
### Title: Graphs of the Factorial Analysis (FA).
### Aliases: Plot.FA
### Keywords: Factor Analysis FA

### ** Examples

data(DataQuan) # database

Data <- DataQuan[,2:ncol(DataQuan)]

rownames(Data) <- DataQuan[,1]

Resp <- FA(Data, Method = "PC", Type = 2, NFactor = 3)

Tit = c("Scree-plot","Scores of the Observations","Factorial Loadings","Biplot")

Plot.FA(Resp, Titles = Tit, xlabel = NA, ylabel = NA,
        Color = TRUE, LinLab = rep("", nrow(Data)),
        Casc = TRUE)




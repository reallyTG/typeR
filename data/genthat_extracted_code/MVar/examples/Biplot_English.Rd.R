library(MVar)


### Name: Biplot
### Title: Biplot graph.
### Aliases: Biplot
### Keywords: Biplot

### ** Examples

data(DataQuan) # set of quantitative data

Data <- DataQuan[,2:ncol(DataQuan)]
rownames(Data) <- DataQuan[,1]

Biplot(Data)

LinNames <- paste("C",1:nrow(Data), sep="")
Biplot(Data, alpha = 0.6, Title = "Biplot of data valuing individuals",
       xlabel = "X Axis", ylabel = "Y Axis", Color = TRUE, Obs = TRUE, 
       LinLab = LinNames)
       
Biplot(Data, alpha = 0.4, Title = "Graph valuing the variables",
       xlabel = "", ylabel = "", Color = FALSE, Obs = FALSE)




library(MVar)


### Name: Plot.CA
### Title: Graphs of the simple (CA) and multiple correspondence analysis
###   (MCA).
### Aliases: Plot.CA
### Keywords: Correspondence Analysis CA

### ** Examples

data(DataFreq) # frequency data set

Data <- DataFreq[,2:ncol(DataFreq)]

rownames(Data) <- DataFreq[1:nrow(DataFreq),1]

Resp <- CA(Data, "f") # performs CA

Tit = c("Scree-plot","Observations", "Variables", "Observations / Variables")

Plot.CA(Resp, Titles = Tit, xlabel = NA, ylabel = NA,
        Color = TRUE, LinLab = NA, Casc = FALSE)


data(DataQuali) # qualitative data set

Data <- DataQuali[,2:ncol(DataQuali)]

Resp <- CA(Data, "c", "b") # performs CA

Tit = c("","","Graph of the variables")

Plot.CA(Resp, Titles = Tit, xlabel = NA, ylabel = NA,
        Color = TRUE, LinLab = NA, Casc = FALSE)





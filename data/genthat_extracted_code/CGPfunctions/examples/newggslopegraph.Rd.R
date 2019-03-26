library(CGPfunctions)


### Name: newggslopegraph
### Title: Plot a Slopegraph a la Tufte using dplyr and ggplot2
### Aliases: newggslopegraph

### ** Examples


newggslopegraph(newcancer, Year, Survival, Type)
newggslopegraph(newcancer, Year, Survival, Type, Title = "Estimates of Percent Survival Rates")
newggslopegraph(newcancer, Year, Survival, Type, 
                Title = "Estimates of Percent Survival Rates", 
                LineColor = "black", 
                LineThickness = 1, 
                SubTitle = NULL, 
                Caption = NULL)
newggslopegraph(newcancer, Year, Survival, Type, 
                Title = "Estimates of Percent Survival Rates", 
                SubTitle = "Based on: Edward Tufte, Beautiful Evidence, 174, 176.",
                Caption = "https://www.edwardtufte.com/bboard/q-and-a-fetch-msg?msg_id=0003nk",
                LineColor = c("black", "red", "grey"), 
                LineThickness = .5)






library(incR)


### Name: incRplot
### Title: Quick visualisation of incubation temperatures, on-bouts and
###   off-bouts
### Aliases: incRplot

### ** Examples

# loading example data
data(incR_procdata)
my_plot <- incRplot(data = incR_procdata[complete.cases(incR_procdata$temperature),], 
                    time.var = "dec_time", 
                    day.var = "date", 
                    inc.temperature.var = "temperature", 
                    env.temperature.var = "env_temp",
                    vector.incubation = "incR_score")
                    
# see your plot
my_plot

# add new labels (ggplot2 required)
my_plot + ggplot2::labs(x = "New X label", y = "New Y label")




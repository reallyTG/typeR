library(jcext)


### Name: plot_jcscheme
### Title: Plot the classification scheme
### Aliases: plot_jcscheme

### ** Examples

# Visualise the scheme for one point
library(jcext)
# Define a central point
mycentral <- c(10,50)
# load the data to get coordinates
data(press)
# Visualise the whole map
plot_jcscheme(mycentral,press$loni,press$lati,fullmap=TRUE)
# Visualise the region
plot_jcscheme(mycentral,press$loni,press$lati,fullmap=FALSE)




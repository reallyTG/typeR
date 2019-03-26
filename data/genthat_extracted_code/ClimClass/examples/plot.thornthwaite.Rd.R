library(ClimClass)


### Name: plot.thornthwaite
### Title: Thornthwaite - Mather's quantile plot
### Aliases: plot.thornthwaite

### ** Examples


data(Trent_climate)


# quantiles is the list ("thornthwaite" S3 object)of quantile tables generated 
# by function thornthwaite; 
# it is the second element of the output list, 
# which can be split into two separate lists (see function thornthwaite)
sta <- 1     # 1st station in the list of quantile tables
q_list=quantiles[[sta]]
class(q_list) <- "thornthwaite" ## q_list is coerced to a "thornthwaite" S3 object
plot(q_list, 
st_name=names(quantiles)[sta], variables=c("Precipitation",  "Et0"), 
leg_pos = "topleft", col=c(1:6,1), pch=c(1:6,16),  
lty=1, horiz=TRUE,  y.intersp=0.1)





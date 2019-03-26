library(ArCo)


### Name: panel_to_ArCo_list
### Title: Transforms a balanced panel into a list of matrices compatible
###   with the fitArCo function
### Aliases: panel_to_ArCo_list

### ** Examples

# = Generate a small panel as example = #
set.seed(123)
time=sort(rep(1:100,2))
unit=rep(c("u1","u2"),100)
v1=rnorm(200)
v2=rnorm(200)
panel=data.frame(time=time,unit=unit,v1=v1,v2=v2)
head(panel)

data=panel_to_ArCo_list(panel,time="time",unit="unit",variables = c("v1","v2"))
head(data$v1)





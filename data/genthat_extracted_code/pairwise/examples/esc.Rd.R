library(pairwise)


### Name: esc
### Title: Expected Score Curves Plots
### Aliases: esc

### ** Examples

########
data(bfiN)
result <- pers(pair(bfiN))
esc(pers_obj=result,1,lwd=2) # plot for first item
esc(pers_obj=result,2,lwd=2) # plot for second item
for(i in 1:5){esc(pers_obj=result,i,lwd=2)}
#########
esc(pers_obj=result,2,integ="all",lwd=2) # plot for secod item





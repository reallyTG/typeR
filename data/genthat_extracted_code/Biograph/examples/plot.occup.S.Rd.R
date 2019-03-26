library(Biograph)


### Name: plot.occup.S
### Title: Plots state occupancies
### Aliases: plot.occup.S

### ** Examples

    data(GLHS)
    Bdata.a <- date_b (GLHS,format.out="age",covs=c("marriage","LMentry"))
    occup <- Occup(Bdata.a)
    dd <- occup$state_occup
    t <- "States occupancies. GLHS"
    cc <- c("red","green","lightgrey")
    xx <- c("N","J","Censored")
    z<- plot (x=dd,namstates.desired=xx,colours=cc,title=t,area=TRUE,xmin=10,xmax=55) 
     



library(Biograph)


### Name: plot.cumrates
### Title: Plots cumulative transition rates
### Aliases: plot.cumrates

### ** Examples

    data(GLHS)
    Bdata.a <- date_b (GLHS,format.out="age",covs=c("marriage","LMentry"))
    cumrates <- Cumrates (irate = 3,Bdata=Bdata.a)
    z<- plot (x=cumrates,ptrans=c("NJ","JN")) 
  



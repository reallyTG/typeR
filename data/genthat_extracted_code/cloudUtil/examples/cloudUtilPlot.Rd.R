library(cloudUtil)


### Name: cloudUtilPlot
### Title: Cloud Utilization Plot
### Aliases: cloudUtilPlot cloudUtil

### ** Examples

    data(cloudms2)

    #green
    col.amazon<-rgb(0.1,0.8,0.1,alpha=0.2)
    col.amazon2<-rgb(0.1,0.8,0.1,alpha=0.2)

    #blue
    col.fgcz<-rgb(0.1,0.1,0.8,alpha=0.2)
    col.fgcz2<-rgb(0.1,0.1,0.5,alpha=0.2)

    #red
    col.uzh<-rgb(0.8,0.1,0.1,alpha=0.2)
    col.uzh2<-rgb(0.5,0.1,0.1,alpha=0.2)

    cm<-c(col.amazon, col.amazon2, col.fgcz, col.fgcz2, col.uzh, col.uzh2)

    cloudUtilPlot(begin=cloudms2$BEGIN_PROCESS, 
        end=cloudms2$END_PROCESS, 
        id=cloudms2$id, 
        group=cloudms2$CLOUD, 
        colormap=cm, 
        normalize=FALSE, 
        plotConcurrent=TRUE); 

    cloudUtilPlot(begin=cloudms2$BEGIN_PROCESS, 
        end=cloudms2$END_PROCESS, 
        id=cloudms2$id, 
        group=cloudms2$CLOUD, 
        colormap=cm, 
        normalize=TRUE, 
        plotConcurrent=TRUE)





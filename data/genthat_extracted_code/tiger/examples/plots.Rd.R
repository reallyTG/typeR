library(tiger)


### Name: plots
### Title: Evaluation plots for temporal dynamics of model performance
### Aliases: box.plots errors.in.time peaks.in.clusters peaks.on.som
###   peaks.measures scatterplot p.validityIndex
### Keywords: utilities hplot

### ** Examples

data(tiger.example)

new.order <- c(6,3,2,5,4,1)
correlated <- correlated(tiger.single, keep=c("CE","RMSE" ))

opar <- par(mfrow=c(3,5))
box.plots(tiger.single, solution=6, new.order=new.order, show.synthetic.peaks=TRUE)
box.plots(tiger.single, solution=6, new.order=new.order, show.cell=data.frame(x=1,y=1))
par(opar)
errors.in.time(xval=d.dates, result= tiger.single, solution=6, 
		show.months=TRUE, new.order=new.order)
peaks.in.clusters(tiger.single, solution=6, new.order=new.order)
peaks.measures(tiger.single, show.measures=correlated$measures.uniform$to.keep)
scatterplot(tiger.single$measures.uniform, show.measures=correlated$measures.uniform$to.keep)






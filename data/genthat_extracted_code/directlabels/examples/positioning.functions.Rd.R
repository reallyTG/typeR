library(directlabels)


### Name: positioning.functions
### Title: Built-in Positioning Methods for direct label placement
### Aliases: positioning.functions positioning.methods

### ** Examples

## Not run: 
##D ### contourplot Positioning Methods
##D for(p in list({
##D ## Example from help(contourplot)
##D require(stats)
##D require(lattice)
##D attach(environmental)
##D ozo.m <- loess((ozone^(1/3)) ~ wind * temperature * radiation,
##D                parametric = c("radiation", "wind"), span = 1, degree = 2)
##D w.marginal <- seq(min(wind), max(wind), length.out = 50)
##D t.marginal <- seq(min(temperature), max(temperature), length.out = 50)
##D r.marginal <- seq(min(radiation), max(radiation), length.out = 4)
##D wtr.marginal <- list(wind = w.marginal, temperature = t.marginal,
##D                      radiation = r.marginal)
##D grid <- expand.grid(wtr.marginal)
##D grid[, "fit"] <- c(predict(ozo.m, grid))
##D detach(environmental)
##D library(ggplot2)
##D p <- ggplot(grid,aes(wind,temperature,z=fit))+
##D   stat_contour(aes(colour=..level..))+
##D   facet_wrap(~radiation)
##D 
##D },
##D {
##D ## example from help(stat_contour)
##D library(reshape2)
##D volcano3d <- melt(volcano)
##D names(volcano3d) <- c("x", "y", "z")
##D library(ggplot2)
##D p <- ggplot(volcano3d, aes(x, y, z = z))+
##D   stat_contour(aes(colour = ..level..))
##D })){
##D   print(direct.label(p,"bottom.pieces"))
##D   print(direct.label(p,"top.pieces"))
##D }
##D 
##D ### densityplot Positioning Methods
##D for(p in list({
##D data(Chem97,package="mlmRev")
##D library(lattice)
##D p <- densityplot(~gcsescore|gender,Chem97,
##D             groups=factor(score),layout=c(1,2),
##D             n=500,plot.points=FALSE)
##D },
##D {
##D library(reshape2)
##D iris2 <- melt(iris,id="Species")
##D library(lattice)
##D p <- densityplot(~value|variable,iris2,groups=Species,scales="free")
##D },
##D {
##D loci <- data.frame(ppp=c(rbeta(800,10,10),rbeta(100,0.15,1),rbeta(100,1,0.15)),
##D                    type=factor(c(rep("NEU",800),rep("POS",100),rep("BAL",100))))
##D library(ggplot2)
##D p <- qplot(ppp,data=loci,colour=type,geom="density")
##D })){
##D   print(direct.label(p,"top.bumptwice"))
##D   print(direct.label(p,"top.bumpup"))
##D   print(direct.label(p,"top.points"))
##D }
##D 
##D ### dotplot Positioning Methods
##D for(p in list({
##D library(lattice)
##D p <- dotplot(VADeaths,xlim=c(8,85),type="o")
##D },
##D {
##D vad <- as.data.frame.table(VADeaths)
##D names(vad) <- c("age","demographic","deaths")
##D library(ggplot2)
##D p <- qplot(deaths,age,data=vad,group=demographic,geom="line",colour=demographic)+
##D   xlim(8,80)
##D })){
##D   print(direct.label(p,"angled.endpoints"))
##D   print(direct.label(p,"top.qp"))
##D }
##D 
##D ### lineplot Positioning Methods
##D for(p in list({
##D data(BodyWeight,package="nlme")
##D library(lattice)
##D p <- xyplot(weight~Time|Diet,BodyWeight,groups=Rat,type='l',
##D        layout=c(3,1),xlim=c(-10,75))
##D },
##D {
##D data(Chem97,package="mlmRev")
##D library(lattice)
##D p <- qqmath(~gcsescore|gender,Chem97,groups=factor(score),
##D        type=c('l','g'),f.value=ppoints(100))
##D },
##D {
##D data(Chem97,package="mlmRev")
##D library(lattice)
##D p <- qqmath(~gcsescore,Chem97,groups=gender,
##D        type=c("l","g"),f.value=ppoints(100))
##D },
##D {
##D data(prostate,package="ElemStatLearn")
##D pros <- subset(prostate,select=-train,train==TRUE)
##D ycol <- which(names(pros)=="lpsa")
##D x <- as.matrix(pros[-ycol])
##D y <- pros[[ycol]]
##D library(lars)
##D fit <- lars(x,y,type="lasso")
##D beta <- scale(coef(fit),FALSE,1/fit$normx)
##D arclength <- rowSums(abs(beta))
##D library(reshape2)
##D path <- data.frame(melt(beta),arclength)
##D names(path)[1:3] <- c("step","variable","standardized.coef")
##D library(ggplot2)
##D p <- ggplot(path,aes(arclength,standardized.coef,colour=variable))+
##D   geom_line(aes(group=variable))+
##D   ggtitle("LASSO path for prostate cancer data calculated using the LARS")+
##D   xlim(0,20)
##D },
##D {
##D data(projectionSeconds, package="directlabels")
##D p <- ggplot(projectionSeconds, aes(vector.length/1e6))+
##D   geom_ribbon(aes(ymin=min, ymax=max,
##D                   fill=method, group=method), alpha=1/2)+
##D   geom_line(aes(y=mean, group=method, colour=method))+
##D   ggtitle("Projection Time against Vector Length (Sparsity = 10##D 
##D   guides(fill="none")+
##D   ylab("Runtime (s)")
##D },
##D {
##D ## complicated ridge regression lineplot ex. fig 3.8 from Elements of
##D ## Statistical Learning, Hastie et al.
##D myridge <- function(f,data,lambda=c(exp(-seq(-15,15,l=200)),0)){
##D   require(MASS)
##D   require(reshape2)
##D   fit <- lm.ridge(f,data,lambda=lambda)
##D   X <- data[-which(names(data)==as.character(f[[2]]))]
##D   Xs <- svd(scale(X)) ## my d's should come from the scaled matrix
##D   dsq <- Xs$d^2
##D   ## make the x axis degrees of freedom
##D   df <- sapply(lambda,function(l)sum(dsq/(dsq+l)))
##D   D <- data.frame(t(fit$coef),lambda,df) # scaled coefs
##D   molt <- melt(D,id=c("lambda","df"))
##D   ## add in the points for df=0
##D   limpts <- transform(subset(molt,lambda==0),lambda=Inf,df=0,value=0)
##D   rbind(limpts,molt)
##D }
##D data(prostate,package="ElemStatLearn")
##D pros <- subset(prostate,train==TRUE,select=-train)
##D m <- myridge(lpsa~.,pros)
##D library(lattice)
##D p <- xyplot(value~df,m,groups=variable,type="o",pch="+",
##D        panel=function(...){
##D          panel.xyplot(...)
##D          panel.abline(h=0)
##D          panel.abline(v=5,col="grey")
##D        },
##D        xlim=c(-1,9),
##D        main="Ridge regression shrinks least squares coefficients",
##D        ylab="scaled coefficients",
##D        sub="grey line shows coefficients chosen by cross-validation",
##D        xlab=expression(df(lambda)))
##D },
##D {
##D library(ggplot2)
##D tx <- time(mdeaths)
##D Time <- ISOdate(floor(tx),round(tx##D 
##D uk.lung <- rbind(data.frame(Time,sex="male",deaths=as.integer(mdeaths)),
##D                  data.frame(Time,sex="female",deaths=as.integer(fdeaths)))
##D p <- qplot(Time,deaths,data=uk.lung,colour=sex,geom="line")+
##D   xlim(ISOdate(1973,9,1),ISOdate(1980,4,1))
##D })){
##D   print(direct.label(p,"angled.boxes"))
##D   print(direct.label(p,"first.bumpup"))
##D   print(direct.label(p,"first.points"))
##D   print(direct.label(p,"first.polygons"))
##D   print(direct.label(p,"first.qp"))
##D   print(direct.label(p,"lasso.labels"))
##D   print(direct.label(p,"last.bumpup"))
##D   print(direct.label(p,"last.points"))
##D   print(direct.label(p,"last.polygons"))
##D   print(direct.label(p,"last.qp"))
##D   print(direct.label(p,"lines2"))
##D   print(direct.label(p,"maxvar.points"))
##D   print(direct.label(p,"maxvar.qp"))
##D }
##D 
##D ### scatterplot Positioning Methods
##D for(p in list({
##D data(mpg,package="ggplot2")
##D m <- lm(cty~displ,data=mpg)
##D mpgf <- fortify(m,mpg)
##D library(lattice)
##D library(latticeExtra)
##D p <- xyplot(cty~hwy|manufacturer,mpgf,groups=class,aspect="iso",
##D        main="City and highway fuel efficiency by car class and manufacturer")+
##D   layer_(panel.abline(0,1,col="grey90"))
##D },
##D {
##D data(mpg,package="ggplot2")
##D m <- lm(cty~displ,data=mpg)
##D mpgf <- fortify(m,mpg)
##D library(lattice)
##D p <- xyplot(jitter(.resid)~jitter(.fitted),mpgf,groups=factor(cyl))
##D },
##D {
##D library(lattice)
##D p <- xyplot(jitter(Sepal.Length)~jitter(Petal.Length),iris,groups=Species)
##D },
##D {
##D data(mpg,package="ggplot2")
##D library(lattice)
##D p <- xyplot(jitter(cty)~jitter(hwy),mpg,groups=class,
##D        main="Fuel efficiency depends on car size")
##D },
##D {
##D library(ggplot2)
##D data(mpg,package="ggplot2")
##D p <- qplot(jitter(hwy),jitter(cty),data=mpg,colour=class,
##D       main="Fuel efficiency depends on car size")
##D },
##D {
##D data(normal.l2.cluster,package="directlabels")
##D library(ggplot2)
##D p <- ggplot(normal.l2.cluster$path,aes(x,y))+
##D   geom_path(aes(group=row),colour="grey")+
##D   geom_point(aes(size=lambda),colour="grey")+
##D   geom_point(aes(colour=class),data=normal.l2.cluster$pts,pch=21,fill="white")+
##D   coord_equal()
##D })){
##D   print(direct.label(p,"ahull.grid"))
##D   print(direct.label(p,"chull.grid"))
##D   print(direct.label(p,"extreme.grid"))
##D   print(direct.label(p,"smart.grid"))
##D }
##D 
## End(Not run)




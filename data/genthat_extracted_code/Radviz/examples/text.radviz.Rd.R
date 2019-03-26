library(Radviz)


### Name: text.radviz
### Title: Text annotations for for the Radviz Plots
### Aliases: text.radviz

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)
plot(rv,point.shape=1,point.color='grey')
med.iris <- split(iris,iris$Species)
med.iris <- lapply(med.iris,function(df) {
   spc <- unique(df$Species)
   df <-df[,names(df)!='Species']
   df <- apply(df,2,median)
   df <- data.frame(t(df))
   df$Species <- spc
   return(df)
 }
)
med.iris <- do.call('rbind',med.iris)
med.rv <- do.radviz(med.iris,S)
text(med.rv,labels=med.iris$Species,col=c('red','green','blue')[as.integer(med.iris$Species)])





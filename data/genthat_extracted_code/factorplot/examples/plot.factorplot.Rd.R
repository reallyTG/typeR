library(factorplot)


### Name: plot.factorplot
### Title: Plot method for objects of class factorplot
### Aliases: plot.factorplot

### ** Examples

est1 <- log(c(1.00,2.12,1.44,1.31,1.44,
     1.46,0.90))
var1 <- c(0.242,0.096,0.156,0.140,
     0.380,0.484,0.375)^2
names(est1) <- c(
     "Normal & superficial gastritis", 
     "Chronic gastritis", 
     "Chronic atrophic gastritits", 
     "Intestinal metaplasia I", 
     "Intestinal metaplasia II", 
     "Intestinal metaplasia III", 
     "Dysplasia")

plummer_fp1 <- factorplot(est1, var=var1, resdf=Inf)
plot(plummer_fp1, trans="exp", abbrev.char = 100)




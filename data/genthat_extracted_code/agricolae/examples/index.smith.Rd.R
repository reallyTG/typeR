library(agricolae)


### Name: index.smith
### Title: Uniformity soil. Smith's Index of Soil Heterogeneity
### Aliases: index.smith
### Keywords: design

### ** Examples

library(agricolae)
data(rice)
#startgraph
table<-index.smith(rice,
 main="Relationship between CV per unit area and plot size",col="red")
#endgraph
uniformity <- data.frame(table$uniformity)
uniformity
# regression variance per unit area an plot size.
model <- lm(Vx ~ I(log(Size)),uniformity)
coeff <- coef(model)
x<-1:max(uniformity$Size)
Vx<- coeff[1]+coeff[2]*log(x)
#startgraph
plot(x,Vx, type="l", col="blue",
 main="Relationship between variance per unit area and plot size")
points(uniformity$Size,uniformity$Vx)
#endgraph




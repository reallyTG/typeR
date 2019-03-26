library(vipor)


### Name: tukeyTexture
### Title: Generate random positions based on Tukey texture algorithm
### Aliases: tukeyTexture

### ** Examples

x<-rnorm(200)
plot(tukeyTexture(x),x)
x<-1:100
plot(tukeyTexture(x),x)
plot(tukeyTexture(log10(counties$landArea),TRUE,TRUE),log10(counties$landArea),cex=.25)




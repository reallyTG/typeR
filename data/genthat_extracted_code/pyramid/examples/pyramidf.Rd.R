library(pyramid)


### Name: pyramidf
### Title: Drawing population pyramid using data.frame within the specified
###   frame
### Aliases: pyramidf
### Keywords: hplot

### ** Examples

# GunmaPop2005 and GumaPop2010 are included in this package.
plot(c(0,100), c(0,100), type="n", frame=FALSE, axes=FALSE, xlab="", ylab="", 
 main="Population pyramid of Gunma prefecture")
# overlay
pyramidf(GunmaPop2005, frame=c(10, 75, 0, 90), Clab="", Lcol="skyblue", Rcol="pink",
 Cstep=10, Laxis=0:4*5000, AxisFM="d")
pyramidf(GunmaPop2010, frame=c(10, 75, 0, 90), Clab="", Lcol="deepskyblue", Rcol="deeppink",
 Ldens=10, Rdens=10, Cstep=10, Laxis=0:4*5000, AxisFM="d")
legend("right", fill=c("skyblue","pink","deepskyblue","deeppink"), density=c(NA,NA,10,10), 
 legend=c("Male 2005", "Female 2005", "Male 2010", "Female 2010"), cex=0.8)




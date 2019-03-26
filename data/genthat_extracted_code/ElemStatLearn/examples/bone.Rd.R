library(ElemStatLearn)


### Name: bone
### Title: Bone Mineral Density Data
### Aliases: bone
### Keywords: datasets

### ** Examples

summary(bone)
# We ignore the repeat measurements:
# smooth.spline is in standard package stats.
names(bone)
# Plot page 128 in the book:
plot(spnbmd ~ age, data=bone, col = 
     ifelse(gender=="male", "blue", "red2"), 
     xlab="Age", ylab="Relative Change in Spinal BMD")
bone.spline.male <- with(subset(bone,gender=="male"),
                smooth.spline(age, spnbmd,df=12))
bone.spline.female <- with(subset(bone, gender=="female"), 
                smooth.spline(age, spnbmd, df=12))
lines(bone.spline.male, col="blue")
lines(bone.spline.female, col="red2")
legend(20,0.20, legend=c("male", "Female"), col=c("blue", "red2"), 
          lwd=2)




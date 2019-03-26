library(BrailleR)


### Name: hist
### Title: Create a standard histogram with a few extra elements added to
###   the output object
### Aliases: hist

### ** Examples

x=rnorm(1000)
# the stamdard hist function returns
MyHist=graphics::hist(x, xlab="random normal values", main="Example histogram (graphics package)")
#dev.off()
MyHist

# while this version returns
MyHist=hist(x, xlab="random normal values", main="Example histogram (BrailleR package)")
#dev.off()
MyHist

# The VI() method then uses the extra information stored
VI(MyHist)




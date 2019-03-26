require(optextras)

cat("Show how fnchk works\n")



# Want to illustrate each case.
# Ben Bolker idea for a function that is NOT scalar

benbad<-function(x, y){
   # y may be provided with different structures
   f<-(x-y)^2
} # very simple, but ...

y<-1:10
x<-c(1)
cat("test benbad() with y=1:10, x=c(1)\n")
fc01<-fnchk(x, benbad, trace=1, y)
print(fc01)

y<-as.vector(y)
cat("test benbad() with y=as.vector(1:10), x=c(1)\n")
fc02<-fnchk(x, benbad, trace=1, y)
print(fc02)

y<-as.matrix(y)
cat("test benbad() with y=as.matrix(1:10), x=c(1)\n")
fc03<-fnchk(x, benbad, trace=1, y)
print(fc03)
   
y<-as.array(y)
cat("test benbad() with y=as.array(1:10), x=c(1)\n")
fc04<-fnchk(x, benbad, trace=1, y)
print(fc04)
   
y<-"This is a string"
cat("test benbad() with y a string, x=c(1)\n")
fc05<-fnchk(x, benbad, trace=1, y)
print(fc05)

fr <- function(x) {   ## Rosenbrock Banana function
    x1 <- x[1]
    x2 <- x[2]
    100 * (x2 - x1 * x1)^2 + (1 - x1)^2
}
xtrad<-c(-1.2,1)
ros1<-fnchk(xtrad, fr, trace=1)
print(ros1)


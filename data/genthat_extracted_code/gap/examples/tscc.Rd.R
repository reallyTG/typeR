library(gap)


### Name: tscc
### Title: Power calculation for two-stage case-control design
### Aliases: tscc
### Keywords: misc

### ** Examples

K <- 0.1
p1 <- 0.4
n1 <- 1000
n2 <- 1000 
M <- 300000
alpha.genome <- 0.05
GRR <- 1.4
p1 <- 0.4
pi.samples <- 0.2
pi.markers <- 0.1

options(echo=FALSE)
cat("sample%,marker%,GRR,(thresholds x 4)(power estimates x 4)\n")
for(GRR in c(1.3,1.35,1.40)) {
   cat("\n")
   for(pi.samples in c(1.0,0.5,0.4,0.3,0.2)) {
      if(pi.samples==1.0) s <- 1.0
      else s <- c(0.1,0.05,0.01)
      for(pi.markers in s)
      {
        x <- tscc("multiplicative",GRR,p1,n1,n2,M,alpha.genome,
                  pi.samples,pi.markers,K)
        l <- c(pi.samples,pi.markers,GRR,x$C,x$power)
        l <- sprintf("%.2f %.2f %.2f, %.2f %.2f %.2f %.2f, %.2f %.2f %.2f %.2f",
                     l[1],l[2],l[3],l[4],l[5],l[6],l[7],l[8],l[9],l[10],l[11])
        cat(l,"\n")
      }
      cat("\n")
   }
}
options(echo=TRUE)




library(genetics)


### Name: print.LD
### Title: Textual and graphical display of linkage disequilibrium (LD)
###   objects
### Aliases: print.LD print.LD.data.frame summary.LD.data.frame
###   print.summary.LD.data.frame plot.LD.data.frame LDtable LDplot
### Keywords: misc

### ** Examples



g1 <- genotype( c('T/A',    NA, 'T/T',    NA, 'T/A',    NA, 'T/T', 'T/A',
                  'T/T', 'T/T', 'T/A', 'A/A', 'T/T', 'T/A', 'T/A', 'T/T',
                     NA, 'T/A', 'T/A',   NA) )

g2 <- genotype( c('C/A', 'C/A', 'C/C', 'C/A', 'C/C', 'C/A', 'C/A', 'C/A',
                  'C/A', 'C/C', 'C/A', 'A/A', 'C/A', 'A/A', 'C/A', 'C/C',
                  'C/A', 'C/A', 'C/A', 'A/A') )


g3 <- genotype( c('T/A', 'T/A', 'T/T', 'T/A', 'T/T', 'T/A', 'T/A', 'T/A',
                  'T/A', 'T/T', 'T/A', 'T/T', 'T/A', 'T/A', 'T/A', 'T/T',
                  'T/A', 'T/A', 'T/A', 'T/T') )
data <- makeGenotypes(data.frame(g1,g2,g3))

# Compute & display  LD for one marker pair
ld <- LD(g1,g2)
print(ld)

# Compute LD table for all 3 genotypes
ldt <- LD(data)

# display the results
print(ldt)                               # textual display
LDtable(ldt)                            # graphical color-coded table
LDplot(ldt, distance=c(124, 834, 927))  # LD plot vs distance

# more markers makes prettier plots!
data <- list()
nobs <- 1000
ngene <- 20
s <- seq(0,1,length=ngene)
a1 <- a2 <- matrix("", nrow=nobs, ncol=ngene)
for(i in 1:length(s) )
{

  rallele <- function(p) sample( c("A","T"), 1, p=c(p, 1-p))

  if(i==1)
    {
      a1[,i] <- sample( c("A","T"), 1000, p=c(0.5,0.5), replace=TRUE)
      a2[,i] <- sample( c("A","T"), 1000, p=c(0.5,0.5), replace=TRUE)
    }
  else
    {
      p1 <- pmax( pmin( 0.25 + s[i] * as.numeric(a1[,i-1]=="A"),1 ), 0 )
      p2 <- pmax( pmin( 0.25 + s[i] * as.numeric(a2[,i-1]=="A"),1 ), 0 )
      a1[,i] <- sapply(p1, rallele )
      a2[,i] <- sapply(p2, rallele )
    }

  data[[paste("G",i,sep="")]] <- genotype(a1[,i],a2[,i])
}
data <- data.frame(data)
data <- makeGenotypes(data)

ldt <- LD(data)
plot(ldt, digits=2, marker=19) # do LDtable & LDplot on in a single
                               # graphics window




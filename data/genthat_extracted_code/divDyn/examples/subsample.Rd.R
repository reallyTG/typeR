library(divDyn)


### Name: subsample
### Title: Serial subsampling wrapper function
### Aliases: subsample

### ** Examples


data(corals)
data(stages)
# Example 1-calculate metrics of diversity dynamics
  dd <- divDyn(corals, tax="genus", bin="stg")
  rarefDD<-subsample(corals,iter=50, q=50,
  tax="genus", bin="stg", output="dist", keep=95)
	
# plotting
  tsplot(stages, shading="series", boxes="sys", xlim=c(260,0), 
  ylab="range-through diversity (genera)", ylim=c(0,230))
  lines(stages$mid, dd$divRT, lwd=2)
  shades(stages$mid, rarefDD$divRT, col="blue")
  legend("topleft", legend=c("raw","rarefaction"),
    col=c("black", "blue"), lwd=c(2,2), bg="white")
  
  
  
## No test: 
# Example 2-SIB diversity 
# draft a simple function to calculate SIB diversity
sib<-function(dat, bin, tax){
  calc<-tapply(INDEX=dat[,bin], X=dat[,tax], function(y){
    length(levels(factor(y)))
  })
  return(calc[as.character(stages$stg)])
}
sibDiv<-sib(corals, bin="stg", tax="genus")

# calculate it with subsampling
rarefSIB<-subsample(corals,iter=50, q=50,
  tax="genus", bin="stg", output="arit", keep=95, FUN=sib)
rarefDD<-subsample(corals,iter=50, q=50,
  tax="genus", bin="stg", output="arit", keep=95)

# plot
tsplot(stages, shading="series", boxes="sys", xlim=c(260,0), 
  ylab="SIB diversity (genera)", ylim=c(0,230))

lines(stages$mid, rarefDD$divSIB, lwd=2, col="black")
lines(stages$mid, rarefSIB, lwd=2, col="blue")


# Example 3 - different subsampling types with default function (divDyn)
# compare different subsampling types
  # classical rarefaction
  cr<-subsample(corals,iter=50, q=20,tax="genus", bin="stg", output="dist", keep=95)
  # by-list subsampling (unweighted) - 3 collections
  UW<-subsample(corals,iter=50, q=3,tax="genus", bin="stg", coll="collection_no", 
    output="dist", keep=95, type="oxw", x=0)
  # occurrence weighted by list subsampling
  OW<-subsample(corals,iter=50, q=20,tax="genus", bin="stg", coll="collection_no", 
    output="dist", keep=95, type="oxw", x=1)
 
  SQS<-subsample(corals,iter=50, q=0.4,tax="genus", bin="stg", output="dist", keep=95, type="sqs")

# plot
  tsplot(stages, shading="series", boxes="sys", xlim=c(260,0), 
  ylab="range-through diversity (genera)", ylim=c(0,100))
  shades(stages$mid, cr$divRT, col="red")
  shades(stages$mid, UW$divRT, col="blue")
  shades(stages$mid, OW$divRT, col="green")
  shades(stages$mid, SQS$divRT, col="cyan")
  
  legend("topleft", bg="white", legend=c("CR (20)", "UW (3)", "OW (20)", "SQS (0.4)"), 
    col=c("red", "blue", "green", "cyan"), lty=c(1,1,1,1), lwd=c(2,2,2,2))
## End(No test)





library(FrF2)


### Name: splitplot
### Title: Statistical and algorithmic aspects of split-plot designs in
###   FrF2
### Aliases: splitplot
### Keywords: array design

### ** Examples

########## hard to change factors ####################
## example from Bingham and Sitter Technometrics 19999
## MotorSpeed, FeedMode,FeedSizing,MaterialType are hard to change
BS.ex <- FrF2(16,7,hard=4,
     factor.names=c("MotorSpeed", "FeedMode","FeedSizing","MaterialType",
                  "Gain","ScreenAngle","ScreenVibLevel"), 
     default.levels=c("-","+"))
design.info(BS.ex)
BS.ex
## NOTE: the design has 8 whole plots.
## The first hard-to-change factors have very few changes only 
## between whole plots. 
## A conscious and honest decision is required whether it is 
##    acceptable for the situation at hand not to reset them!
## A proper split-plot design with resetting all whole plot factors 
## for each whole plot would be strongly preferred from a 
## statistical point of view. 

########## automatic generation for split plot ##########
## 3 control factors, 5 noise factors, control factors are whole plot factors
## 8 plots desired in a total of 32 runs
## Bingham Sitter 2003
BS.ex2a <- FrF2(32, 8, WPs=8, nfac.WP=3, 
      factor.names=c(paste("C",1:3,sep=""), paste("N",1:5,sep="")),randomize=TRUE)

## manual generation of this same design
BS.ex2m <- FrF2(32, 8, generators=c("ABD","ACD","BCDE"),WPs=8, WPfacs=c("C1","C2","C3"), nfac.WP=3, 
      factor.names=c(paste("C",1:3,sep=""),paste("N",1:5,sep="")),randomize=TRUE)

## design with few whole plot factors
## 2 whole plot factors, 7 split plot factors
## 8 whole plots, i.e. one extra WP factor needed
BSS.cheese.exa <- FrF2(32, 9, WPs=8, nfac.WP=2, 
      factor.names=c("A","B","p","q","r","s","t","u","v"))
design.info(BSS.cheese.exa)
## manual generation of the design used by Bingham, Schoen and Sitter
## note that the generators include a generator for the 10th spplitting factor
    ## s= ABq, t = Apq, u = ABpr and v = Aqr, splitting factor rho=Apqr
BSS.cheese.exm <- FrF2(32, gen=list(c(1,2,4),c(1,3,4),c(1,2,3,5),c(1,4,5),c(1,3,4,5)), 
      WPs=8, nfac.WP=3, WPfacs=c(1,2,10),
      factor.names=c("A","B","p","q","r","s","t","u","v","rho"))
design.info(BSS.cheese.exm)




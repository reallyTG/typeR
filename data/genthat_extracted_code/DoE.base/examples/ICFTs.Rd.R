library(DoE.base)


### Name: ICFTs
### Title: Function for calculating interaction contribution frequency
###   tables
### Aliases: ICFTs ICFT
### Keywords: design array

### ** Examples

   oa24.bad <- oa.design(L24.2.13.3.1.4.1, columns=c(1,2,14,15))
   oa24.good <- oa.design(L24.2.13.3.1.4.1, columns=c(3,10,14,15))
   ## resolution is III in both cases, but the bad one has more words of length 3
   GWLP(oa24.bad)[4:5]
   ICFTs(oa24.bad)
   ICFTs(oa24.bad, conc=FALSE)
   GWLP(oa24.good)[4:5]
   ICFTs(oa24.good)
   ICFTs(oa24.good, conc=FALSE)
   ICFTs(oa24.good, resk.only=FALSE)
   
   ICFT(L18[,c(1,4,6)])
   ICFT(L18[,c(1,4,6)], conc=FALSE)




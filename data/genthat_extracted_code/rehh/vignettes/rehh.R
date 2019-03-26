## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(comment=">")

## ----message=FALSE-------------------------------------------------------
library(rehh)

## ----results='hide'------------------------------------------------------
make.example.files()

## ------------------------------------------------------------------------
head(read.table("map.inp"))

## ------------------------------------------------------------------------
?data2haplohh

## ------------------------------------------------------------------------
hap<-data2haplohh(hap_file="bta12_cgu.hap",map_file="map.inp",
                  recode.allele=TRUE,chr.name=12)

## ----eval=FALSE----------------------------------------------------------
#  hap<-data2haplohh(hap_file="bta12_cgu.hap",map_file="map.inp",
#                    recode.allele=TRUE)

## ----echo=FALSE----------------------------------------------------------
cat("More than one chromosome name in Map file: map.inp\nWhich chromosome should be considered among:\n1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29\n1:")

## ----eval=FALSE----------------------------------------------------------
#  12

## ----echo=FALSE----------------------------------------------------------
hap<-data2haplohh(hap_file="bta12_cgu.hap",map_file="map.inp",recode.allele=TRUE,chr.name=12)

## ----error=TRUE----------------------------------------------------------
hap<-data2haplohh(hap_file="bta12_cgu.hap",map_file="map.inp",
                  recode.allele=TRUE,chr.name=18)

## ------------------------------------------------------------------------
hap<-data2haplohh(hap_file="bta12_cgu.thap",map_file="map.inp",haplotype.in.columns=TRUE,
                  recode.allele=TRUE,chr.name=12)

## ------------------------------------------------------------------------
hap<-data2haplohh(hap_file="bta12_hapguess_switch.out",map_file="map.inp",
                  recode.allele=TRUE,popsel=7,chr.name=12)

## ----eval=FALSE----------------------------------------------------------
#  hap<-data2haplohh(hap_file="bta12_hapguess_switch.out",map_file="map.inp",
#                    recode.allele=TRUE,chr.name=12)

## ----echo=FALSE----------------------------------------------------------
cat("Map file seems OK: 1424  SNPs declared for chromosome 12\nLooks like a FastPHASE haplotype file\nHaplotypes originate from  8  different populations in the fastPhase output file\nChosen pop. is not in the list of pop. number: 1 2 3 4 5 6 7 8\nWhich population should be considered among: 1 2 3 4 5 6 7 8\n1: 
")

## ----eval=FALSE----------------------------------------------------------
#  7

## ----echo=FALSE----------------------------------------------------------
hap<-data2haplohh(hap_file="bta12_hapguess_switch.out",map_file="map.inp",recode.allele=TRUE,popsel=7,chr.name=12)

## ----eval=FALSE----------------------------------------------------------
#  ?calc_ehh

## ---- fig.align='center',fig.keep='all'----------------------------------
#example haplohh object (280 haplotypes, 1424 SNPs) see ?haplohh_cgu_bta12 for details
data(haplohh_cgu_bta12)
#computing EHH statistics for the focal SNP at position 456 
#which display a strong signal of selection
res.ehh<-calc_ehh(haplohh_cgu_bta12,mrk=456) 

## ------------------------------------------------------------------------
res.ehh$ehh[1:2,454:458]

## ------------------------------------------------------------------------
res.ehh$nhaplo_eval[1:2,454:458]

## ------------------------------------------------------------------------
res.ehh$freq_all1

## ------------------------------------------------------------------------
res.ehh$ihh

## ----ehhplot,echo=FALSE,fig.align='center',,out.height="7cm",fig.cap='Graphical output for the \\texttt{calc\\_ehh()} function',fig.pos='!h',fig.lp='fig:'----
sel_reg <- (colSums(res.ehh$nhaplo_eval) > 0) ; mrk=456
matplot(haplohh_cgu_bta12@position[sel_reg]/1000000, t(res.ehh$ehh[, sel_reg]),col = c("red", "blue"), lty = 1, type = "l",main = "", bty = "n", xlab = "Position (Mb)",ylab = expression(Extended ~ haplotype ~ homozygosity ~ (italic(EHH))))
abline(v = haplohh_cgu_bta12@position[mrk]/1000000, lty = 2)
legend("topleft", c("Ancestral Allele", "Derived Allele"),col = c("red", "blue"), bty = "n", lty = 1)

## ---- eval=FALSE---------------------------------------------------------
#  ?calc_ehhs

## ------------------------------------------------------------------------
#example haplohh object (280 haplotypes, 1424 SNPs) see ?haplohh_cgu_bta12 for details
data(haplohh_cgu_bta12)
#computing EHH statistics for the focal SNP at position 456
#which display a strong signal of selection
res.ehhs<-calc_ehhs(haplohh_cgu_bta12,mrk=456)

## ------------------------------------------------------------------------
res.ehhs$EHHS_Sabeti_et_al_2007[453:459] 

## ------------------------------------------------------------------------
res.ehhs$EHHS_Tang_et_al_2007[453:459] 

## ------------------------------------------------------------------------
res.ehhs$nhaplo_eval[453:459] 

## ------------------------------------------------------------------------
res.ehhs$IES_Tang_et_al_2007

## ------------------------------------------------------------------------
res.ehhs$IES_Sabeti_et_al_2007

## ----ehhsplot,echo=FALSE,fig.align='center',out.height="7cm",fig.cap='Graphical output for the \\texttt{calc\\_ehhs()} function',fig.pos='!h',fig.lp='fig:'----
sel_reg <- (colSums(res.ehh$nhaplo_eval) > 0) ; mrk=456
plot(haplohh_cgu_bta12@position[sel_reg]/1000000, res.ehhs$EHHS_Sabeti_et_al_2007[sel_reg],col = "red", lty = 1, type = "l",main = "", bty = "n", xlab = "Position (Mb)",ylab = expression(Site ~ specific ~ italic(EHH) ~ (italic(EHHS)) ))
lines(haplohh_cgu_bta12@position[sel_reg]/1000000, res.ehhs$EHHS_Tang_et_al_2007[sel_reg], col = "blue")
abline(v = haplohh_cgu_bta12@position[mrk]/1000000, lty = 2)
legend("topleft", c("Sabeti et al. (2007)", "Tang et al. (2007)"),col = c("red", "blue"), bty = "n", lty = 1)

## ----eval=TRUE-----------------------------------------------------------
data(haplohh_cgu_bta12)
res.scan<-scan_hh(haplohh_cgu_bta12)

## ------------------------------------------------------------------------
dim(res.scan)

## ------------------------------------------------------------------------
head(res.scan)

## ------------------------------------------------------------------------
system.time(res.scan<-scan_hh(haplohh_cgu_bta12))

## ------------------------------------------------------------------------
foo<-function(haplo){
res.ihh=res.ies=matrix(0,haplo@nsnp,2)
for(i in 1:length(haplo@position)){
  res.ihh[i,]=calc_ehh(haplo,mrk=i,plotehh=FALSE)$ihh
  tmp=calc_ehhs(haplo,mrk=i,plotehhs=FALSE)
  res.ies[i,1]=tmp$IES_Tang_et_al_2007
  res.ies[i,2]=tmp$IES_Sabeti_et_al_2007  
}
list(res.ies=res.ies,res.ihh=res.ihh)
}
system.time(res.scan2<-foo(haplohh_cgu_bta12))

## ------------------------------------------------------------------------
sum(res.scan2$res.ihh[,1]!=res.scan[,4]) + sum(res.scan2$res.ihh[,2]!=res.scan[,5]) +
sum(res.scan2$res.ies[,1]!=res.scan[,6]) + sum(res.scan2$res.ies[,2]!=res.scan[,7])

## ----eval=FALSE----------------------------------------------------------
#  for(i in 1:29){
#   hap_file=paste("hap_chr_",i,".pop1",sep="")
#   data<-data2haplohh(hap_file="hap_file","snp.info",chr.name=i)
#   res<-scan_hh(data)
#   if(i==1){wg.res<-res}else{wg.res<-rbind(wg.res,res)}
#     }
#  wg.ihs<-ihh2ihs(wg.res)

## ------------------------------------------------------------------------
data(wgscan.cgu)
## results from a genome scan (44,057 SNPs) see ?wgscan.eut and ?wgscan.cgu for details
ihs.cgu<-ihh2ihs(wgscan.cgu)

## ------------------------------------------------------------------------
head(ihs.cgu$iHS)

## ------------------------------------------------------------------------
head(ihs.cgu$frequency.class)

## ----eval=FALSE----------------------------------------------------------
#  ihsplot(ihs.cgu,plot.pval=TRUE,ylim.scan=2,main="iHS (CGU cattle breed)")
#  

## ----echo=FALSE,fig.ext="png",fig.align='center',fig.width=16,fig.height=12,fig.cap='Graphical output for the \\texttt{ihsplot()} function'----
layout(matrix(1:2,2,1))
plot.pval = TRUE; ylim.scan = 2; pch = 16; cex = 0.75; cex.lab = 1; main = "iHS (CGU cattle breed)"; cex.main = 1.;cex.axis=0.7
data = ihs.cgu$iHS
lst_chrm <- unique(data$CHR) ; nbr_chrm <- length(lst_chrm) ; cum <- rep(0, (nbr_chrm + 1))
if (nbr_chrm > 1) {
  for (i in 1:nbr_chrm) {cum[i + 1] <- tail(data$POSITION[data$CHR == lst_chrm[i]],n = 1)}
}
cum <- cumsum(cum) ; pos <- rep(0, length(data$CHR)) ; pos_labels <- rep(0, nbr_chrm)
for (i in 1:nbr_chrm) {
  pos[data$CHR == lst_chrm[i]] <- data$POSITION[data$CHR ==lst_chrm[i]] + cum[which(lst_chrm == lst_chrm[i])]
  pos_labels[i] <- (cum[i] + cum[i + 1])/2
}
col_chr <- data$CHR
par(mar = c(5, 5, 4, 2) + 0.1)
plot(pos, data$iHS, pch = pch, cex = cex, las = 1, col = col_chr,xaxt = "n", xlab = "Chromosome", ylab = expression(italic(iHS)), 
     cex.lab = cex.lab, main = main, cex.main = cex.main,cex.axis=cex.axis)
axis(1, at = pos_labels, labels = lst_chrm, las = 1,cex.lab=cex.lab,cex.axis=cex.axis)
abline(h = c(-ylim.scan, ylim.scan), lty = 2)
par(mar = c(5, 5, 4, 2) + 0.1)
plot(pos, data$"-log10(p-value)", pch = pch, cex = cex,las = 1, col = col_chr, xaxt = "n", xlab = "Chromosome", 
         ylab = expression("-" * log[10] * "[1" ~ "-" ~"2" ~ "|" ~ Phi[scriptstyle(italic(iHS))] ~"-" ~ 0.5 * "|]"),            cex.lab = cex.lab, main = main, cex.main = cex.main,cex.axis=cex.axis)
axis(1, at = pos_labels, labels = lst_chrm, las = 1,cex.lab=cex.lab,cex.axis=cex.axis)
abline(h = c(-ylim.scan, ylim.scan), lty = 2)

## ----eval=FALSE----------------------------------------------------------
#  for(i in 1:29){
#   hap_file=paste("hap_chr_",i,".pop1",sep="")
#   data<-data2haplohh(hap_file="hap_file","snp.info",chr.name=i)
#   res<-scan_hh(data)
#   if(i==1){wg.res.pop1<-res}else{wg.res.pop1<-rbind(wg.res.pop1,res)}
#   hap_file=paste("hap_chr_",i,".pop2",sep="")
#   data<-data2haplohh(hap_file="hap_file","snp.info",chr.name=i)
#   res<-scan_hh(data)
#   if(i==1){wg.res.pop2<-res}else{wg.res.pop2<-rbind(wg.res.pop2,res)}
#   }
#  wg.rsb<-ies2rsb(wg.res.pop1,wg.res.pop2)

## ------------------------------------------------------------------------
data(wgscan.cgu) ; data(wgscan.eut)
## results from a genome scan (44,057 SNPs) see ?wgscan.eut and ?wgscan.cgu for details
cguVSeut.rsb<-ies2rsb(wgscan.cgu,wgscan.eut,"CGU","EUT")

## ------------------------------------------------------------------------
head(cguVSeut.rsb)

## ----eval=FALSE----------------------------------------------------------
#  rsbplot(cguVSeut.rsb,plot.pval=TRUE)

## ----rsbplot,echo=FALSE,fig.ext="png",fig.align='center',fig.width=16,fig.height=12,fig.lp='fig:',fig.cap='Graphical output for the \\texttt{rsbplot()} function',fig.pos='!h'----
layout(matrix(1:2,2,1))
plot.pval = TRUE; ylim.scan = 2; pch = 16; cex = 0.75; cex.lab = 1; main = "Rsb (CGU vs. EUT)"; cex.main = 1.;cex.axis=0.7
data = cguVSeut.rsb
lst_chrm <- unique(data$CHR) ; nbr_chrm <- length(lst_chrm) ; cum <- rep(0, (nbr_chrm + 1))
if (nbr_chrm > 1) {
  for (i in 1:nbr_chrm) {cum[i + 1] <- tail(data$POSITION[data$CHR == lst_chrm[i]],n = 1)}
}
cum <- cumsum(cum) ; pos <- rep(0, length(data$CHR)) ; pos_labels <- rep(0, nbr_chrm)
for (i in 1:nbr_chrm) {
  pos[data$CHR == lst_chrm[i]] <- data$POSITION[data$CHR ==lst_chrm[i]] + cum[which(lst_chrm == lst_chrm[i])]
  pos_labels[i] <- (cum[i] + cum[i + 1])/2
}
col_chr <- data$CHR
par(mar = c(5, 5, 4, 2) + 0.1)
plot(pos, data[,3], pch = pch, cex = cex, las = 1, col = col_chr,xaxt = "n", xlab = "Chromosome", ylab = expression(italic(Rsb)), 
     cex.lab = cex.lab, main = main, cex.main = cex.main,cex.axis=cex.axis)
axis(1, at = pos_labels, labels = lst_chrm, las = 1,cex.lab=cex.lab,cex.axis=cex.axis)
abline(h = c(-ylim.scan, ylim.scan), lty = 2)
par(mar = c(5, 5, 4, 2) + 0.1)
plot(pos, data$"-log10(p-value)", pch = pch, cex = cex,las = 1, col = col_chr, xaxt = "n", xlab = "Chromosome", 
         ylab = expression("-" * log[10] * "[1" ~ "-" ~"2" ~ "|" ~ Phi[scriptstyle(italic(Rsb))] ~"-" ~ 0.5 * "|]"), cex.lab = cex.lab, main = main, cex.main = cex.main,cex.axis=cex.axis)
axis(1, at = pos_labels, labels = lst_chrm, las = 1,cex.lab=cex.lab,cex.axis=cex.axis)
abline(h = c(-ylim.scan, ylim.scan), lty = 2)

## ----eval=FALSE----------------------------------------------------------
#  for(i in 1:29){
#   hap_file=paste("hap_chr_",i,".pop1",sep="")
#   data<-data2haplohh(hap_file="hap_file","snp.info",chr.name=i)
#   res<-scan_hh(data)
#   if(i==1){wg.res.pop1<-res}else{wg.res.pop1<-rbind(wg.res.pop1,res)}
#   hap_file=paste("hap_chr_",i,".pop2",sep="")
#   data<-data2haplohh(hap_file="hap_file","snp.info",chr.name=i)
#   res<-scan_hh(data)
#   if(i==1){wg.res.pop2<-res}else{wg.res.pop2<-rbind(wg.res.pop2,res)}
#   }
#  wg.xpehh<-ies2xpehh(wg.res.pop1,wg.res.pop2)

## ------------------------------------------------------------------------
data(wgscan.cgu) ; data(wgscan.eut)
## results from a genome scan (44,057 SNPs) see ?wgscan.eut and ?wgscan.cgu for details
cguVSeut.xpehh<-ies2xpehh(wgscan.cgu,wgscan.eut,"CGU","EUT")

## ------------------------------------------------------------------------
head(cguVSeut.xpehh)

## ----eval=FALSE----------------------------------------------------------
#  xpehhplot(cguVSeut.xpehh,plot.pval=TRUE)

## ----xpehhplot,echo=FALSE,fig.align='center',fig.ext="png",fig.width=16,fig.height=12,fig.lp='fig:',fig.cap='Graphical output for the \\texttt{xpehhplot()} function',fig.pos="!h"----
layout(matrix(1:2,2,1))
plot.pval = TRUE; ylim.scan = 2; pch = 16; cex = 0.75; cex.lab = 1; main = "XPEHH (CGU vs. EUT)"; cex.main = 1.;cex.axis=0.7
data = cguVSeut.xpehh
lst_chrm <- unique(data$CHR) ; nbr_chrm <- length(lst_chrm) ; cum <- rep(0, (nbr_chrm + 1))
if (nbr_chrm > 1) {
  for (i in 1:nbr_chrm) {cum[i + 1] <- tail(data$POSITION[data$CHR == lst_chrm[i]],n = 1)}
}
cum <- cumsum(cum) ; pos <- rep(0, length(data$CHR)) ; pos_labels <- rep(0, nbr_chrm)
for (i in 1:nbr_chrm) {
  pos[data$CHR == lst_chrm[i]] <- data$POSITION[data$CHR ==lst_chrm[i]] + cum[which(lst_chrm == lst_chrm[i])]
  pos_labels[i] <- (cum[i] + cum[i + 1])/2
}
col_chr <- data$CHR
par(mar = c(5, 5, 4, 2) + 0.1)
plot(pos, data[,3], pch = pch, cex = cex, las = 1, col = col_chr,xaxt = "n", xlab = "Chromosome", ylab = expression(italic(XPEHH)), 
     cex.lab = cex.lab, main = main, cex.main = cex.main,cex.axis=cex.axis)
axis(1, at = pos_labels, labels = lst_chrm, las = 1,cex.lab=cex.lab,cex.axis=cex.axis)
abline(h = c(-ylim.scan, ylim.scan), lty = 2)
par(mar = c(5, 5, 4, 2) + 0.1)
plot(pos, data$"-log10(p-value)", pch = pch, cex = cex,las = 1, col = col_chr, xaxt = "n", xlab = "Chromosome", 
         ylab = expression("-" * log[10] * "[1" ~ "-" ~"2" ~ "|" ~ Phi[scriptstyle(italic(XPEHH))] ~"-" ~ 0.5 * "|]"), cex.lab = cex.lab, main = main, cex.main = cex.main,cex.axis=cex.axis)
axis(1, at = pos_labels, labels = lst_chrm, las = 1,cex.lab=cex.lab,cex.axis=cex.axis)
abline(h = c(-ylim.scan, ylim.scan), lty = 2)

## ----comp,echo=TRUE,fig.align='center',fig.ext="png",out.height="7cm",fig.lp='fig:',fig.cap='Comparison of the XPEHH and Rsb estimates across the CGU and EUT populations',fig.pos="!h"----
plot(cguVSeut.rsb[,3],cguVSeut.xpehh[,3],xlab="Rsb",ylab="XPEHH",pch=16,
    cex=0.5,cex.lab=0.75,cex.axis=0.75)
abline(a=0,b=1,lty=2)

## ----eval=FALSE----------------------------------------------------------
#  distribplot(ihs.cgu$iHS[,3],xlab="iHS")

## ----distribplot,echo=FALSE,fig.align='center',fig.width=7,out.height="7cm",fig.height=7,fig.lp='fig:',fig.cap='Graphical output for the function \\texttt{distribplot}',fig.pos="!h"----
layout(matrix(1:2,2,1))
data=ihs.cgu$iHS[,3]
lty = 1;lwd = 1.5;col = c("blue","red");main = "Genome-wide distribution";xlab = "iHS";cex.main = 1.5;cex.lab = 1.25;qqplot = TRUE
plot(density(data,na.rm = TRUE),main = main,xlab = xlab,col = col[1],lty = lty,lwd = lwd,cex.main = cex.main,cex.lab = cex.lab)
	curve(dnorm,col = col[2],add = TRUE)
	legend("topright",c("Observed","Gaussian"),bty = "n",col = col,lty = lty,lwd = lwd)
	if (qqplot) {
		par(mar = c(5,5,4,2) + 0.1)
		qqnorm(data[!is.na(data)],cex.main = cex.main,cex.lab = cex.lab,pch = 16,cex = 0.75)
     abline(a=0,b=1,lty=2)
    }

## ----bifdia,eval=TRUE,fig.align='center',out.height="12cm",fig.width=16,fig.height=12,fig.lp='fig:',fig.cap='Graphical output for the function \\texttt{bifurcation.diagram()}',fig.pos="!h"----
data(haplohh_cgu_bta12)
layout(matrix(1:2,2,1))
bifurcation.diagram(haplohh_cgu_bta12,mrk_foc=456,all_foc=1,nmrk_l=20,nmrk_r=20,
                    main="Bifurcation diagram (RXFP2 SNP on BTA12): Ancestral Allele")
bifurcation.diagram(haplohh_cgu_bta12,mrk_foc=456,all_foc=2,nmrk_l=20,nmrk_r=20,
                    main="Bifurcation diagram (RXFP2 SNP on BTA12): Derived Allele")


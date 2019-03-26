## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("RZooRoH")

## ---- out.width="0.95\\linewidth", include=TRUE, fig.align="center", fig.cap=c("Distribution of length of HBD segments identified in Belgian Blue beef cattle with different models (results from Sole et al. (2017)). We observe that a model with 1 HBD class (1R) has more segments of intermediary size (10-100 kb). The model with 14 classes identifies more long segments (> 500 kb)."), echo=FALSE----
knitr::include_graphics("Figure1.pdf")

## ---- out.width="0.95\\linewidth", include=TRUE, fig.align="center", fig.cap=c("Estimated level of autozygosity per HBD class in five humans (A), five dogs (B) and five sheeps (C). Each colour is associated with a distinct class (defined by its rate). The heights of each colour bar represent the estimated level of autozygosity associated with the class, and the total height represents the total estimated autozygosity (results from Druet and Gautier (2017)). Three dogs have total values close to 0.5 and the method indicates that 25 percent of the genome is associated with HBD classes with rates equal to 2 or 4. These values are compatible with parent-offspring matings combined with additional autozygosity from more distance ancestors. The most inbred sheep has autozygosity levels higher than 0.30 but mainly associated with more distant ancestors (approximately 8 generations in the past). These examples illustrate that the partitioning in different HBD class might help to understand the relationship between the parents or past demographic events at the individual level."), echo=FALSE----
knitr::include_graphics("Fig4hb_barplot_filteredRR.pdf")

## ---- out.width="0.85\\linewidth", include=TRUE, fig.align="center", fig.cap=c("Comparison of individual autozygosity estimated with FEstim (1 HBD class) and a pruning strategy with recent autzoygosity classes estimated with a multiple HBD classes model (results from Druet and Gautier (2017))."), echo=FALSE----
knitr::include_graphics("Figure2.pdf")

## ------------------------------------------------------------------------
file1 <- system.file("exdata","BBB_PE_gt_subset.txt",package="RZooRoH")
myfile1 <- read.table(file1,header=FALSE)
head(myfile1)

## ------------------------------------------------------------------------
file2 <- system.file("exdata","BBB_NMP_pl_subset.txt",package="RZooRoH")
myfile2 <- read.table(file2,header=FALSE)
head(myfile2[,1:14])

## ------------------------------------------------------------------------
file3 <- system.file("exdata","BBB_NMP_GP_subset.txt",package="RZooRoH")
myfile3 <- read.table(file3,header=FALSE)
head(myfile3[,1:14])

## ------------------------------------------------------------------------
file4 <- system.file("exdata","BBB_NMP_ad_subset.txt",package="RZooRoH")
myfile4 <- read.table(file4,header=FALSE)
head(myfile4[,1:15])

## ------------------------------------------------------------------------
library(RZooRoH)

## ------------------------------------------------------------------------
file3 <- system.file("exdata","BBB_NMP_GP_subset.txt",package="RZooRoH")
BBB_GP <- zoodata(genofile = file3, zformat = "gp")

## ------------------------------------------------------------------------
BBB_GP <- zoodata(file3, zformat = "gp")

## ------------------------------------------------------------------------
file2 <- system.file("exdata","BBB_NMP_ad_subset.txt",package="RZooRoH")
BBB_AD <- zoodata(file2, zformat = "ad")

## ------------------------------------------------------------------------
file1 <- system.file("exdata","BBB_PE_gt_subset.txt",package="RZooRoH")
BBB_GT <- zoodata(file1, supcol = 4, poscol = 2, chrcol = 1)

## ------------------------------------------------------------------------
BBB_GT <- zoodata(file1, supcol = 4, poscol = 2, chrcol = 1, min_maf = 0.05)

## ------------------------------------------------------------------------
mysamples <- system.file("exdata","BBB_samples.txt",package="RZooRoH")
BBB_GT <- zoodata(file1, supcol = 4, poscol = 2, chrcol = 1, samplefile = mysamples)

## ------------------------------------------------------------------------
head(BBB_GT@genos)

head(BBB_GP@genos[,1:6])

## ------------------------------------------------------------------------
c(BBB_GT@nind, BBB_GT@nsnps, BBB_GT@nchr)

## ------------------------------------------------------------------------
head(cbind(BBB_GT@bp, BBB_GT@freqs))

## ------------------------------------------------------------------------
BBB_GT@sample_ids

## ------------------------------------------------------------------------
mix10R <- zoomodel()
mix10R

## ------------------------------------------------------------------------
mix10R@krates

## ------------------------------------------------------------------------
mix5R <- zoomodel(K=5,base=10)
mix5R

## ------------------------------------------------------------------------
mix5R <- zoomodel(K=5,base=10,err=0.01,seqerr=0.005)
mix5R@err
mix5R@seqerr

## ------------------------------------------------------------------------
my.mod4R <- zoomodel(predefined=FALSE,K=4,krates=c(16,64,256,256))
my.mod4R

## ------------------------------------------------------------------------
my.mod4R <- zoomodel(predefined=FALSE,K=4,krates=c(16,64,256,256),
                     mix_coef=c(0.03,0.04,0.13,0.80))
my.mod4R@mix_coef

## ------------------------------------------------------------------------
my.mod1R <- zoomodel(predefined=FALSE,K=2,krates=c(10,10))
my.mod1R

## ------------------------------------------------------------------------
freqfile <- (system.file("exdata","typsfrq.txt",package="RZooRoH"))
typfile <- (system.file("exdata","typs.txt",package="RZooRoH"))
frq <- read.table(freqfile,header=FALSE)
bbb <- zoodata(typfile,supcol=4,chrcol=1,poscol=2,allelefreq=frq$V1)

## ------------------------------------------------------------------------
bbb_results <- zoorun(my.mod1R, bbb, ids = c(1))

## ------------------------------------------------------------------------
bbb_results2 <- zoorun(my.mod1R, bbb, method="estem",ids = c(1,2), convem=1e-12, 
                       maxiter=100, minr=2, maxr=100)

## ------------------------------------------------------------------------
bbb_results3 <- zoorun(my.mod1R, bbb, localhbd = TRUE)

## ------------------------------------------------------------------------
Mod3R <- zoomodel(K=3,base_rate=10)
bbb_mod3r <- zoorun(Mod3R, bbb, localhbd = TRUE)

## ------------------------------------------------------------------------
bbb_results2@nind
bbb_results2@ids

## ------------------------------------------------------------------------
bbb_mod3r@mixc

## ------------------------------------------------------------------------
bbb_mod3r@krates

## ------------------------------------------------------------------------
bbb_results3@krates

## ------------------------------------------------------------------------
cbind(bbb_results3@modlik,bbb_results3@modbic)

## ------------------------------------------------------------------------
bbb_mod3r@realized

## ------------------------------------------------------------------------
bbb_results3@realized

## ------------------------------------------------------------------------
cbind(bbb_results3@realized,bbb_results3@mixc)

## ------------------------------------------------------------------------
mix10r <- zoomodel()
mix10r

## ------------------------------------------------------------------------
round(soay_mix10r@realized[1:20,],3)

## ------------------------------------------------------------------------
x <- 1-soay_mix10r@realized[,10]
hist(x,nc=20,main="",xlab="Inbreeding coefficient",xlim=c(0.15,0.35),col='tomato')

## ------------------------------------------------------------------------
x <- t(apply(soay_mix10r@realized[,1:6],1,cumsum))
hist(x[,6],nc=20,main="",xlab="Inbreeding coefficient (T = 64)",
     xlim=c(0.15,0.35),col='tomato')

## ------------------------------------------------------------------------
t(bbb_mod3r@hbdp[[3]][,1:15])

## ------------------------------------------------------------------------
t(bbb_mod3r@hbdp[[6]][,4700:4720])

## ------------------------------------------------------------------------
dim(bbb_mod3r@hbdseg)[1]
head(bbb_mod3r@hbdseg[,1:8])

## ------------------------------------------------------------------------
summary(bbb_mod3r@hbdseg$length)
summary(bbb_mod3r@hbdseg$number_snp)

## ------------------------------------------------------------------------
dim(soay_mix10r@hbdseg)[1]
head(soay_mix10r@hbdseg[,1:8])

## ------------------------------------------------------------------------
summary(soay_mix10r@hbdseg$length)
summary(soay_mix10r@hbdseg$number_snp)

## ------------------------------------------------------------------------
realized(bbb_mod3r)

## ------------------------------------------------------------------------
head(round(realized(soay_mix10r,seq(1,6)),5))

## ------------------------------------------------------------------------
F100 <- cumhbd(soay_mix10r, 100)
summary(F100)

## ------------------------------------------------------------------------
F10 <- cumhbd(bbb_mod3r, 10)
F100 <- cumhbd(bbb_mod3r, 100)
cbind(F10,F100)

## ------------------------------------------------------------------------
F20 <- cumhbd(bbb_results3, 20)
F50 <- cumhbd(bbb_results3, 50)
F100 <- cumhbd(bbb_results3, 100)
cbind(F20,F50,F100,bbb_results3@krates[,1])

## ------------------------------------------------------------------------
roh25_10_20 <- rohbd(zres = soay_mix10r, chrom = 25, 
                     startPos= 10000000,endPos = 20000000, inside = FALSE)
dim(roh25_10_20)
head(roh25_10_20[,1:8])
summary(roh25_10_20$length)

## ------------------------------------------------------------------------
roh25_10_20 <- rohbd(zres = soay_mix10r, chrom = 25, 
                     startPos= 10000000,endPos = 20000000, inside = TRUE)
dim(roh25_10_20)
head(roh25_10_20[,1:8])
summary(roh25_10_20$length)

## ------------------------------------------------------------------------
roh25_10_20 <- rohbd(zres = soay_mix10r, ids = c(15,56,97,103,108))
dim(roh25_10_20)
head(roh25_10_20[,1:8])

## ------------------------------------------------------------------------
y6 <- probhbd(zres = bbb_mod3r, zooin = bbb, id = 6, chrom = 19, 
              startPos = 0, endPos = 50000000)
x <- bbb@bp[bbb@chrbound[19,1]:bbb@chrbound[19,2]]
x <- x[x >=0 & x<= 50000000]/1000000
plot(y6~x,type='b',ylim=c(0,1),ylab='HBD probability',col='red',
     xlab='Position on chr25 (Mb)')
y1 <- probhbd(zres = bbb_mod3r, zooin = bbb, id = 1, chrom = 19, 
              startPos = 0, endPos = 50000000)
y2 <- probhbd(zres = bbb_mod3r, zooin = bbb, id = 2, chrom = 19, 
              startPos = 0, endPos = 50000000)
par(new=TRUE)
plot(y1~x,type='b',ylim=c(0,1),ylab='',col='royalblue',xlab='',axes=FALSE)
par(new=TRUE)
plot(y2~x,type='b',ylim=c(0,1),ylab='',col='orange',xlab='',axes=FALSE)


## ------------------------------------------------------------------------
y6b <- probhbd(zres = bbb_mod3r, zooin = bbb, id = 6, chrom = 19, 
              startPos = 0, endPos = 50000000,T=20)
y1b <- probhbd(zres = bbb_mod3r, zooin = bbb, id = 1, chrom = 19, 
              startPos = 0, endPos = 50000000,T=20)
plot(y6b~x,type='l',ylim=c(0,1),ylab='HBD probability',col='red',
     xlab='Position on chr25 (Mb)')
par(new=TRUE)
plot(y1b~x,type='l',ylim=c(0,1),ylab='',col='royal blue',xlab='',axes=FALSE)

## ------------------------------------------------------------------------
summary(realized(soay_mix10r))

## ------------------------------------------------------------------------
summary(cumhbd(soay_mix10r,100))

## ------------------------------------------------------------------------
allseg <- rohbd(zres = soay_mix10r)
summary(allseg$length)
hist(allseg$length/1000000,xlab="Length of HBD segment (in cM)",main="",col='tomato',nc=100)

## ------------------------------------------------------------------------
zoodoris(zres = wilt_mix10r, minv = 5, maxv = 10, glen = 2450, method = "counts")

## ------------------------------------------------------------------------
zoodoris(zres = wilt_mix10r, minv = 5, maxv = 10, glen = 2450, method = "sharing")

## ------------------------------------------------------------------------
dtw <- zoodoris(zres = wilt_mix10r, minv = 5, maxv = 25, glen = 2450, method = "sharing")
dts <- zoodoris(zres = soay_mix10r, minv = 5, maxv = 25, glen = 2450, method = "sharing")
dtr <- zoodoris(zres = rara_mix10r, minv = 5, maxv = 25, glen = 2450, method = "sharing")
matplot(dtw$win_st,cbind(dtw$sharing,dts$sharing,dtr$sharing),
        xlab = 'Length of HBD segment in cM', ylab = 'Proportion of the genome',
        type ='p', pch=c(21,21,21),bg=c('dark grey','royal blue','orange'),
        col=c('black','black','black'))

## ----fig.height=6,fig.width=10-------------------------------------------
zooplot_prophbd(list(Soay = soay_mix10r), cols = 'tomato', style = 'boxplot')

## ----fig.height=6,fig.width=10-------------------------------------------
zooplot_prophbd(list(Soay=soay_mix10r,Wiltshire=wilt_mix10r,
                     RasaAragonesa=rara_mix10r),style='barplot')

## ----fig.height=6,fig.width=12-------------------------------------------
zooplot_prophbd(list(Soay=soay_mix10r,Wiltshire=wilt_mix10r,
                     RasaAragonesa=rara_mix10r),style='lines', cumulative = TRUE)

## ----fig.height=6,fig.width=10-------------------------------------------
pop2 <- list(Soay=soay_mix10r,RasaAragonesa=rara_mix10r)
zooplot_individuals(pop2, cumulative = TRUE)

## ----fig.height=5,fig.width=10,show='hold'-------------------------------
zooplot_partitioning(list(Wiltshire=wilt_mix10r), ylim = c(0,0.5), nonhbd = FALSE)

## ----fig.height=5,fig.width=10,show='hold'-------------------------------
pop3 <- list(Soay=soay_mix10r,RasaAragonesa=rara_mix10r,Wiltshire=wilt_mix10r)
zooplot_partitioning(pop3, randomids = TRUE, nrandom = c(20,20,20), plotids = FALSE,
                     ylim=c(0,0.5), nonhbd = FALSE)

## ----fig.height=10,fig.width=10,show='hold'------------------------------
zooplot_hbdseg(pop3, randomids = TRUE, nrandom = c(20,20,20),
               chr=5,coord=c(10000000,50000000))

## ---- out.width="0.95\\linewidth", include=TRUE, fig.align="center", fig.cap=c("Impact on marker informativity on mean absolute error (MAE) for local HBD probabilities for all locus (left column) or for HBD locus only (right column) based on results from results from Druet and Gautier (2017). The figure shows the impact of average number of SNPs per HBD segment, site frequency spectrum (SFS), presence of genotyping errors or coverage with whole-genome sequencing (WGS) data."), echo=FALSE----
knitr::include_graphics("Effect_density_error_lowfoldII.pdf")

## ---- out.width="0.75\\linewidth", include=TRUE, fig.align="center", fig.cap=c("HBD segments identified on chromosome 1 using different genotyping densities or using whole-genome sequencing at different coverages in 46 Belgian blue sires."), echo=FALSE----
knitr::include_graphics("BBB_hdbseg_densities.pdf")


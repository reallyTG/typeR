### R code from vignette source 'PTM_MarkerFinder.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: PTM_MarkerFinder.Rnw:66-67
###################################################
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: PTM_MarkerFinder.Rnw:77-80
###################################################
library(protViz)
data(HexNAc)
str(HexNAc[[1]], nchar.max=30)


###################################################
### code chunk number 3: PTM_MarkerFinder.Rnw:101-103
###################################################
HexNAc_MarkerIons <- c(126.05495, 138.05495, 144.06552,
   168.06552, 186.07608, 204.08665)


###################################################
### code chunk number 4: PTM_MarkerFinder.Rnw:109-121
###################################################
ptm.0 <- cbind(AA = "-",
	mono = 0.0, avg = 0.0, desc = "unmodified", unimodAccID = NA)

ptm.1 <- cbind(AA='N', 
	mono = 317.122300, avg = NA, desc = "HexNAc",
        unimodAccID=2)
             
ptm.2 <- cbind(AA='M',
	mono = 147.035400, avg = NA, desc = "Oxidation",
        unimodAccID=1)
     
m <- as.data.frame(rbind(ptm.0, ptm.1, ptm.2))


###################################################
### code chunk number 5: PTM_MarkerFinder.Rnw:127-133
###################################################
S <- PTM_MarkerFinder(data = HexNAc,
	modification = m$mono, 
	modificationName = m$desc,
        minMarkerIntensityRatio = 3,
        itol_ppm = 20,
        mZmarkerIons = HexNAc_MarkerIons) 


###################################################
### code chunk number 6: xtable1
###################################################
library(xtable)
print(xtable(S, caption="Result",  label="Table:xtable1"), include.rownames=FALSE, scalebox="0.5")


###################################################
### code chunk number 7: PTM_MarkerFinder.Rnw:145-146
###################################################
summary(S)


###################################################
### code chunk number 8: example1
###################################################
op <- par(mfrow = c(2, 2), mar=c(4, 4, 4, 1))

dump <- lapply(split(S, S$query), 
    function(x){ 
      plot(x$mZ, x$markerIonIntensity, 
        type = 'h',
        col = 'lightblue',
        cex = 2,
        ylab = 'intensity', xlab='m/z',
        xlim = range(c(HexNAc_MarkerIons,  
            max(HexNAc_MarkerIons) 
                + 0.1 * (max(HexNAc_MarkerIons) - min(HexNAc_MarkerIons)), 
            min(HexNAc_MarkerIons) 
                - 0.1 * (max(HexNAc_MarkerIons) - min(HexNAc_MarkerIons)))),
        ylim = range(S$markerIonIntensity),
            log = 'y',
            main = paste("scan=", unique(x$scans),
                "/query=", unique(x$query), sep='')); 
            text(x$mZ, x$markerIonIntensity, 
                round(x$mZ,2),col='red',cex=0.7)
        }
    )
par(op)


###################################################
### code chunk number 9: PTM_MarkerFinder.Rnw:198-204
###################################################
names(S)[4] <- "mII"
S.wide <- reshape(S[,c(1,7,3,4)],
                  direction = 'wide', 
                  timevar = "markerIonMZ", 
                  idvar = c('scans','query'))



###################################################
### code chunk number 10: xtable2
###################################################
library(xtable)
print(xtable(S.wide, caption="Result",  label="Table:xtable2"), include.rownames=FALSE, scalebox=0.8)


###################################################
### code chunk number 11: PTM_MarkerFinder.Rnw:214-220
###################################################
write.table(S.wide, 
	file = "HexNAc_PTM_markerFinder.csv",
    	sep = ',', 
	row.names = FALSE,
	col.names = TRUE, 
	quote = FALSE)


###################################################
### code chunk number 12: example2
###################################################
# prepare the input
d <- list(); d[[1]] <- HexNAc[[3]]; d[[2]] <- HexNAc[[4]]; d[[3]] <- HexNAc[[5]]
S <- PTM_MarkerFinder(data = d, modification = m$mono, 
	modificationName = m$desc,
        minMarkerIntensityRatio = 3,
        itol_ppm = 20,
        mZmarkerIons = HexNAc_MarkerIons) 


###################################################
### code chunk number 13: PTM_MarkerFinder.Rnw:251-252 (eval = FALSE)
###################################################
## demo(PTM_MarkerFinder) 


###################################################
### code chunk number 14: PTM_MarkerFinder.Rnw:258-259
###################################################
ADP_Ribose <- c(136.0618, 250.0935, 348.0704, 428.0367)


###################################################
### code chunk number 15: sessioninfo
###################################################
toLatex(sessionInfo())



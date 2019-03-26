library(gap)


### Name: asplot
### Title: Regional association plot
### Aliases: asplot
### Keywords: hplot

### ** Examples

## Not run: 
##D asplot(CDKNlocus, CDKNmap, CDKNgenes)
##D title("CDKN2A/CDKN2B Region")
##D asplot(CDKNlocus, CDKNmap, CDKNgenes, best.pval=5.4e-8, sf=c(3,6))
##D 
##D ## NCBI2R
##D 
##D options(stringsAsFactors=FALSE)
##D p <- with(CDKNlocus,data.frame(SNP=NAME,PVAL))
##D hit <- subset(p,PVAL==min(PVAL,na.rm=TRUE))$SNP
##D 
##D library(NCBI2R)
##D # LD under build 36
##D pos <- apply(as.data.frame(p$SNP),1,GetSNPPosHapmap)
##D chr_pos <- do.call("rbind",pos)
##D l <- with(chr_pos,min(as.numeric(chrpos),na.rm=TRUE))
##D u <- with(chr_pos,max(as.numeric(chrpos),na.rm=TRUE))
##D LD <- with(chr_pos,GetLDInfo(unique(chr),l,u))
##D hit_LD <- subset(LD,SNPA==hit)
##D hit_LD <- within(hit_LD,{RSQR=r2})
##D info <- GetSNPInfo(p$SNP)
##D haldane <- function(x) 0.5*(1-exp(-2*x))
##D locus <- with(info, data.frame(CHR=chr,POS=chrpos,NAME=marker,
##D                     DIST=(chrpos-min(chrpos))/1000000,
##D                     THETA=haldane((chrpos-min(chrpos))/100000000)))
##D locus <- merge.data.frame(locus,hit_LD,by.x="NAME",by.y="SNPB",all=TRUE)
##D locus <- merge.data.frame(locus,p,by.x="NAME",by.y="SNP",all=TRUE)
##D locus <- subset(locus,!is.na(POS))
##D ann <- AnnotateSNPList(p$SNP)
##D genes <- with(ann,data.frame(ID=locusID,CLASS=fxn_class,PATH=pathways,
##D                              START=GeneLowPoint,STOP=GeneHighPoint,
##D                              STRAND=ori,GENE=genesymbol,BUILD=build,CYTO=cyto))
##D attach(genes)
##D ugenes <- unique(GENE)
##D ustart <- as.vector(as.table(by(START,GENE,min))[ugenes])
##D ustop <- as.vector(as.table(by(STOP,GENE,max))[ugenes])
##D ustrand <- as.vector(as.table(by(as.character(STRAND),GENE,max))[ugenes])
##D detach(genes)
##D genes <- data.frame(START=ustart,STOP=ustop,STRAND=ustrand,GENE=ugenes)
##D genes <- subset(genes,START!=0)
##D rm(l,u,ugenes,ustart,ustop,ustrand)
##D # Assume we have the latest map as in CDKNmap
##D asplot(locus,CDKNmap,genes)
## End(Not run)




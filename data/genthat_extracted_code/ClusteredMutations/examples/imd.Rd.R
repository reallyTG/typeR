library(ClusteredMutations)


### Name: imd
### Title: Calculate of the inter-mutational distance (IMD).
### Aliases: imd
### Keywords: kataegis

### ** Examples


data(PD4107a)

###New variable
extra <- factor(c(),levels=c("T>C","T>G","T>A","C>T","C>G","C>A"))
extra[PD4107a$Ref_base=="A" & PD4107a$Mutant_base=="G"]<-"T>C"
extra[PD4107a$Ref_base=="T" & PD4107a$Mutant_base=="C"]<-"T>C"
extra[PD4107a$Ref_base=="A" & PD4107a$Mutant_base=="C"]<-"T>G"
extra[PD4107a$Ref_base=="T" & PD4107a$Mutant_base=="G"]<-"T>G"
extra[PD4107a$Ref_base=="A" & PD4107a$Mutant_base=="T"]<-"T>A"
extra[PD4107a$Ref_base=="T" & PD4107a$Mutant_base=="A"]<-"T>A"
extra[PD4107a$Ref_base=="G" & PD4107a$Mutant_base=="A"]<-"C>T"
extra[PD4107a$Ref_base=="C" & PD4107a$Mutant_base=="T"]<-"C>T"
extra[PD4107a$Ref_base=="G" & PD4107a$Mutant_base=="C"]<-"C>G"
extra[PD4107a$Ref_base=="C" & PD4107a$Mutant_base=="G"]<-"C>G"
extra[PD4107a$Ref_base=="G" & PD4107a$Mutant_base=="T"]<-"C>A"
extra[PD4107a$Ref_base=="C" & PD4107a$Mutant_base=="A"]<-"C>A"
PD4107a$extra<-extra

###Generate new data set with intermutational distance;
rainfall<-imd(data=PD4107a,chr=Chr,position=Position,extra=extra)

###Rainfall plot for PD4107a cancer sample;
plot(rainfall$number, rainfall$log10distance,pch=20,
	ylab="Intermutation distance (bp)",xlab="PD4107a",yaxt="n",
	col=c(rep(c("black","red"),14)[rainfall$chr]))
axis(2, at=c(0,1,2,3,4,6), labels=c("1","10","100","1000","10000","1000000"),
	las=2, cex.axis=0.6)

###Rainfall plot for PD4107a cancer sample (Nik-Zainal et al. 2012);
#require(ggplot2)
#graph <- qplot(data=rainfall,number,log10distance,colour=extra, ylim=c(0.2,8), 
#	ylab="log10", xlab="PD4107a")
#graph <- graph + 
#	scale_colour_manual(values =c("T>C"="yellow","T>G"="green","T>A"="pink",
#		"C>T"="red","C>G"="black","C>A"="blue"))
#graph <- graph + theme(legend.title=element_blank())
#graph <- graph + scale_y_continuous(breaks = c(0, 1, 2, 3, 4, 6),
#		labels=c("1","10","100","1000","10000","1000000"))
#graph




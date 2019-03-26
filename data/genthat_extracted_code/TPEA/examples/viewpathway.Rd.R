library(TPEA)


### Name: viewpathway
### Title: The visualization of interested pathway based on the genes you
###   input, such as differentially expressed genes.
### Aliases: viewpathway

### ** Examples

DEGs<-c(836,842,5594,595);
DEG<-as.data.frame(DEGs);
pathwayID<-"hsa05210";
viewpathway(pathwayID,DEG);




library(D3GB)


### Name: segmentation
### Title: Function for segmentate tracks in BED format.
### Aliases: segmentation

### ** Examples

# Segmentate tracks.
# Create test data
chr <- character()
pos <- numeric()

for(i in 1:nrow(GRCh38)){
  chr <- c(chr,as.character(rep(GRCh38[i,"chr"],100)))
  pos <- c(pos,sample(GRCh38[i,"start"]:GRCh38[i,"end"],100))
}

value <- round(rexp(length(pos)),2)

track <- data.frame(chr,pos,pos+1,NA,value)
segments <- segmentation(track, 50000)






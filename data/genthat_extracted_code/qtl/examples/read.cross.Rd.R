library(qtl)


### Name: read.cross
### Title: Read data for a QTL experiment
### Aliases: read.cross
### Keywords: IO

### ** Examples

## Not run: 
##D # CSV format
##D dat1 <- read.cross("csv", dir="Mydata", file="mydata.csv")
##D 
##D # CSVS format
##D dat2 <- read.cross("csvs", dir="Mydata", genfile="mydata_gen.csv",
##D                    phefile="mydata_phe.csv")
##D 
##D # you can read files directly from the internet
##D datweb <- read.cross("csv", "https://rqtl.org/sampledata",
##D                      "listeria.csv")
##D 
##D # Mapmaker format
##D dat3 <- read.cross("mm", dir="Mydata", file="mydata.raw",
##D                    mapfile="mydata.map")
##D 
##D # Map Manager QTX format
##D dat4 <- read.cross("qtx", dir="Mydata", file="mydata.qtx")
##D 
##D # QTL Cartographer format
##D dat5 <- read.cross("qtlcart", dir="Mydata", file="qtlcart.cro",
##D                    mapfile="qtlcart.map")
##D 
##D # Gary format
##D dat6 <- read.cross("gary", dir="Mydata", genfile="geno.dat",
##D                    mapfile="markerpos.txt", phefile="pheno.dat",
##D                    chridfile="chrid.dat", mnamesfile="mnames.txt",
##D                    pnamesfile="pnames.txt")
##D 
##D # Karl format
##D dat7 <- read.cross("karl", dir="Mydata", genfile="gen.txt",
##D                    phefile="phe.txt", mapfile="map.txt")
## End(Not run)




library(caRpools)


### Name: data.extract
### Title: Extracting sgRNA information from NGS FASTQ files to create
###   read-count files for caRpools Analysis
### Aliases: data.extract
### Keywords: ~NGS

### ** Examples

data(caRpools)
# fileCONTROL1 = data.extract(scriptpath="path.to.scripts",
# datapath="path.to.FASTQ", fastqfile="filename1", extract=TRUE,
# seq.pattern, maschine.pattern, createindex=TRUE,
# bowtie2file=filename.lib.reference, referencefile="filename.lib.reference", 
# mapping=TRUE, reversecomplement=FALSE, threads, bowtieparams,
#sensitivity="very-sensitive-local",match="perfect")  
# Now we can load the generated Read-Count file directly!
#CONTROL1 = load.file(paste(datapath, fileCONTROL1, sep="/")) # Untreated sample 1 loaded

# Don't forget the library reference
# libFILE = load.file( paste(datapath, paste(referencefile,".fasta",sep=""), sep="/"),
# header = FALSE, type="fastalib")




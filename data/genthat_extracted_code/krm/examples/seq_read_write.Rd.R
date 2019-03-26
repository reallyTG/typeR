library(krm)


### Name: readFastaFile
### Title: Read a Fasta Sequence File
### Aliases: readFastaFile writeFastaFile aa2arabic string2arabic
###   fastaFile2arabicFile selexFile2arabicFile stringList2arabicFile
###   arabic2arabicFile readSelexFile readSelexAsMatrix arabic2fastaFile
###   readArabicFile readBlockFile

### ** Examples


library(RUnit)
fileName=paste(system.file(package="krm")[1],'/misc/SETpfamseed_aligned_for_testing.fasta', sep="")
seqs = readFastaFile (fileName, sep=" ")
checkEquals(length(seqs),11)





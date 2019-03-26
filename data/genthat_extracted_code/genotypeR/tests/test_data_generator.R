######################################################
##test data
one.test <- c(0,0,1,NA,0)
two.test <- c(NA,NA,1,NA,0)
three.test <- c(NA,1,NA,NA,0)
four.test <- c(NA,NA,NA,NA,NA)
##many NA run
##five.test <- c(NA,NA,NA,1,0)
##more than one CO/NA interval
five.test <- c(0,NA,0,NA,0)
SAMPLE_NAME <- c(as.character(paste("test", seq(1, 5), sep="")))
WELL <- c(as.character(paste("WELL", seq(1, 5), sep="")))

test_data <- rbind(one.test, two.test, three.test, four.test, five.test)

test_data <- cbind(SAMPLE_NAME, WELL, test_data)

test_data <- data.frame(test_data)

test_data <- as.data.frame(apply(test_data, 2, as.character), stringsAsFactors=FALSE)

##realistic test data requires markers longer than 1 bp apart and non-overlapping
colnames(test_data) <- c("SAMPLE_NAME", "WELL", paste("chrx", paste(seq(100, 500, by=100), seq(100, 500, by=100)+50, sep="_"), sep="_"))

###################################################################################################
##initialize fake genotypeR data
##fake markers
fake_markers <- data.frame(chr=as.character("chrx"), start=as.character(seq(100, 500, by=100)), end=as.character(seq(100, 500, by=100)+50), marker=as.character(c("AAA[G/T]ATG", "AAA[G/T]ATG", "CAA[A/G]AGG", "ACA[T/G]GCG", "AGG[A/T]GTG")), stringsAsFactors = FALSE)

##fake genotypes
one.test <- c("G","T","AG","","T")
two.test <- c("","","AG","","A")
three.test <- c("","GT","","","A")
four.test <- c("","","","","")
five.test <- c("T","","G","","T")

SAMPLE_NAME <- c(as.character(paste("test", seq(1, 5), sep="")))
WELL <- c(as.character(paste("WELL", seq(1, 5), sep="")))

genotypes_data <- rbind(one.test, two.test, three.test, four.test, five.test)

genotypes_data <- cbind(SAMPLE_NAME, WELL, genotypes_data)

genotypes_data <- data.frame(genotypes_data)

genotypes_data <- as.data.frame(apply(genotypes_data, 2, as.character), stringsAsFactors=FALSE)

##realistic test data requires markers longer than 1 bp apart and non-overlapping
colnames(genotypes_data) <- c("SAMPLE_NAME", "WELL", paste("chrx", paste(seq(100, 500, by=100), seq(100, 500, by=100)+50, sep="_"), sep="_"))

###################################################################################################

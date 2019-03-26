library(SFS)


### Name: SFS_sfs
### Title: Similarity-First Search multisweep algorithm
### Aliases: sfs SFS_sfs

### ** Examples

	## install package in R
 	#install.packages("SFS_0.1.tar.gz")
 	
 	## load package in R
 	library(SFS)
 
 	## invoke SFS on a R Matrix
 	mtxt <- c("11 2 9 0 5 0 5 5 2 0 5 0 5 6 0 0 2 0 5",
         "2 11 2 0 9 0 8 5 10 0 5 0 5 2 0 0 10 0 8",
         "9 2 11 0 5 0 5 5 2 0 5 0 5 10 0 0 2 0 5",
         "0 0 0 11 0 3 0 0 0 3 0 3 0 0 10 3 0 9 0",
         "5 9 5 0 11 0 8 7 9 0 7 0 7 5 0 0 9 0 10",
         "0 0 0 3 0 11 0 0 0 10 0 6 0 0 5 8 0 5 0",
         "5 8 5 0 8 0 11 7 8 0 7 0 7 5 0 0 8 0 9",
         "5 5 5 0 7 0 7 11 6 0 10 0 8 7 0 0 6 0 7",
         "2 10 2 0 9 0 8 6 11 0 6 0 5 2 0 0 10 0 8",
         "0 0 0 3 0 10 0 0 0 11 0 6 0 0 4 9 0 5 0",
         "5 5 5 0 7 0 7 10 6 0 11 0 9 7 0 0 6 0 7",
         "0 0 0 3 0 6 0 0 0 6 0 11 0 0 9 6 0 10 0",
         "5 5 5 0 7 0 7 8 5 0 9 0 11 7 0 0 5 0 7",
         "6 2 10 0 5 0 5 7 2 0 7 0 7 11 0 0 2 0 5",
         "0 0 0 10 0 5 0 0 0 4 0 9 0 0 11 4 0 10 0",
         "0 0 0 3 0 8 0 0 0 9 0 6 0 0 4 11 0 4 0",
         "2 10 2 0 9 0 8 6 10 0 6 0 5 2 0 0 11 0 8",
         "0 0 0 9 0 5 0 0 0 5 0 10 0 0 10 4 0 11 0",
         "5 8 5 0 10 0 9 7 8 0 7 0 7 5 0 0 8 0 11")
  	M <- as.matrix(read.table(textConnection(mtxt)))
  	A <- SFS::read(M)
  	SFS::sfs(A, Robinsonian = TRUE)
  	
  	## invoke SFS on a data-frame with 3-column data-frames with 0-based vertices, with 
  	## (row, col, value) triples containing symmetric values
  	data <- c("0 0 1.0",
            "1 0 1.5",
            "2 0 1.9",
            "0 1 2.0",
            "1 1 2.5",
            "2 1 2.9",
            "0 2 3.0",
            "1 2 3.5",
            "2 2 3.9")
  	M <- read.table(textConnection(data))
  	A <- SFS::read(M, identical_val = TRUE)
  	SFS::sfs(A)

  	## invoke SFS on a \code{dist} from seriation package:
    library(seriation)
    data("iris");
    x <- as.matrix(iris[-5]);
    x <- x[sample(1:nrow(x)),];
    M <- dist(x)
    D <- SFS::read(M)
    SFS::sfs(D, sfs_epsilon = 0.01, dissimilarity = TRUE)

	## invoke SFS reading from file a Robinsonian matrix
	M <- read.table(system.file("extdata", "list_130.txt", package = "SFS"))
	A <- SFS::read(M, identical_val = TRUE)
	SFS::sfs(A, Robinsonian = TRUE)
	
	## invoke SFS reading from file containing 3-columns (row, col, value) entries
        ## of an asymmetric non-Robinsonian similarity matrix with 1-based vertices
	M <- read.table(system.file("extdata", "list_130.txt", package = "SFS"))
	A <- SFS::read(M, identical_val = TRUE, symmetric = FALSE)
	SFS::sfs(A, num_sweeps = 7)
  




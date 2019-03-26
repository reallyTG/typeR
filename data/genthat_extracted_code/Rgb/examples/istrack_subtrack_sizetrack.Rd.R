library(Rgb)


### Name: subtrack
### Title: Extract elements within a genomic window
### Aliases: subtrack sizetrack istrack

### ** Examples

  
  # Exemplar data : subset of human genes
  data(hsFeatures)
  
  # Track validity
  print(istrack(hsGenes))
  hsGenes <- hsGenes[ order(hsGenes$chrom, hsGenes$start) ,]
  print(istrack(hsGenes))
  
  # Chromosome index (factorial 'chrom')
  index <- tapply(1:nrow(hsGenes), hsGenes$chrom, max)
  
  # Factor chrom query
  print(class(hsGenes$chrom))
  subtrack("1", 10e6, 15e6, index, hsGenes)
  
  # Row count
  a <- nrow(subtrack("1", 10e6, 15e6, index, hsGenes))
  b <- sizetrack("1", 10e6, 15e6, index, hsGenes)
  if(a != b) stop("Inconsistency")
  
  # Multiple sources
  length <- hsGenes$end - hsGenes$start
  subtrack("1", 10e6, 15e6, index, hsGenes, length)
  subtrack("1", 10e6, 15e6, index, hsGenes, length=length)
  
  # Speed comparison (x200 here)
  system.time(
    for(i in 1:40000) {
      subtrack("1", 10e6, 15e6, index, hsGenes)
    }
  )
  system.time(
    for(i in 1:200) {
      hsGenes[ hsGenes$chrom == "1" & hsGenes$start <= 15e6 & hsGenes$end >= 10e6 ,]
    }
  )
  
  # Convert chrom from factor to integer
  hsGenes$chrom <- as.integer(as.character(hsGenes$chrom))
  
  # Chromosome index (integer 'chrom')
  index <- rep(NA_integer_, 24)
  tmpIndex <- tapply(1:nrow(hsGenes), hsGenes$chrom, max)
  index[ as.integer(names(tmpIndex)) ] <- tmpIndex
  
  # Integer chrom query
  print(class(hsGenes$chrom))
  subtrack(1, 10e6, 15e6, index, hsGenes)




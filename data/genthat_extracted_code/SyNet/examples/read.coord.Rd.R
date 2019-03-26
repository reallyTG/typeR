library(SyNet)


### Name: read.coord
### Title: Read a List of Points from a txt File
### Aliases: read.coord
### Keywords: file

### ** Examples

  #####
  # You can recognize the format of a typical input file
  # in the following created .txt:
  write(c("sp", "latitude", "longitude"), file= "proof.txt", 3, TRUE, sep = ",")
  for (i in 1:10) 
    write(c(LETTERS[i], i*1.5, i*-8.6),file= "proof.txt", 3, TRUE, sep = ",")
  proof <- read.coord("proof.txt") # Put getwd() to identify the path where
                                   # the file 'proof.txt' has been located
  
  #####
  unlink("proof.txt") # Delete



